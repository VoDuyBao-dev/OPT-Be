package com.example.tutorsFinderSystem.services;

import com.example.tutorsFinderSystem.configuration.VNPAYConfig;
import com.example.tutorsFinderSystem.dto.request.CreatePaymentRequest;
import com.example.tutorsFinderSystem.dto.request.OfficialClassRequest;
import com.example.tutorsFinderSystem.dto.response.VNPAYResponse;
import com.example.tutorsFinderSystem.entities.*;
import com.example.tutorsFinderSystem.enums.*;
import com.example.tutorsFinderSystem.exceptions.AppException;
import com.example.tutorsFinderSystem.exceptions.ErrorCode;
import com.example.tutorsFinderSystem.repositories.*;
import com.example.tutorsFinderSystem.util.HttpClientUtil;
import com.example.tutorsFinderSystem.util.VNPAYUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class VNPAYService {
    VNPAYConfig vnPayConfig;
    UserRepository userRepository;
    UserService userService;
    ClassRequestRepository classRequestRepository;
    PaymentRepository paymentRepository;
    RefundRepository refundRepository;
    ClassRequestService classRequestService;
    TutorRepository tutorRepository;

    public VNPAYResponse createVNPAYPayment(CreatePaymentRequest paymentRequest, HttpServletRequest request) {
        try {
            User user = userService.getCurrentUser();

            // 1. Lấy ClassRequest đã tạo
            ClassRequest classRequest = classRequestRepository.findById(
                    paymentRequest.getClassRequestId()
            ).orElseThrow(() -> new AppException(ErrorCode.CLASS_REQUEST_NOT_FOUND));

            // 2. Kiểm tra quyền sở hữu
            if (!classRequest.getLearner().getUser().getUserId().equals(user.getUserId())) {
                throw new AppException(ErrorCode.UNAUTHORIZED);
            }

            // 3. Kiểm tra trạng thái
            if (classRequest.getStatus() != ClassRequestStatus.PENDING_PAYMENT) {
                throw new AppException(ErrorCode.INVALID_REQUEST_STATUS);
            }

            // 4. Không cho tạo payment trùng
            if (paymentRepository.existsByClassRequest(classRequest)) {
                throw new AppException(ErrorCode.PAYMENT_ALREADY_EXISTS);
            }

            Tutor tutor = classRequest.getTutor();

            // 5. Tính tiền TỪ DATABASE
            BigDecimal amount = classRequestService.calculateAmount(
                    tutor.getPricePerHour(),
                    classRequest.getTotalSessions()
            );

            //  so sánh amount FE gửi lên
            if (paymentRequest.getAmount().compareTo(amount) != 0) {
                throw new AppException(ErrorCode.INVALID_PAYMENT_AMOUNT);
            }

            // Tạo Payment PENDING
            Payment payment = Payment.builder()
                    .user(user)
                    .classRequest(classRequest)
                    .amount(amount)
                    .paymentMethod(PaymentMethod.VNPAY)
                    .paymentStatus(PaymentStatus.PENDING)
                    .vnpTxnRef(VNPAYUtil.getRandomNumber(8))
                    .build();

            paymentRepository.save(payment);

            Map<String, String> vnpParams = vnPayConfig.getVNPayConfig();

            long amountVnp = amount.multiply(BigDecimal.valueOf(100)).longValue();
            vnpParams.put("vnp_Amount", String.valueOf(amountVnp));
            vnpParams.put("vnp_TxnRef", payment.getVnpTxnRef());
            vnpParams.put("vnp_OrderInfo", "Thanh toan lop hoc #" + classRequest.getRequestId());


            String ip = "127.0.0.1";

            // --- DEPLOY ---
            // String ip = VNPAYUtil.getIpAddress(request);

            vnpParams.put("vnp_IpAddr", ip);

            String queryUrl = VNPAYUtil.getPaymentURL(vnpParams, true);
            String hashData = VNPAYUtil.getPaymentURL(vnpParams, false);
            String secureHash = VNPAYUtil.hmacSHA512(
                    vnPayConfig.getSecretKey(), hashData);

            String paymentUrl = vnPayConfig.getVnp_PayUrl()
                    + "?" + queryUrl
                    + "&vnp_SecureHash=" + secureHash;

            return VNPAYResponse.builder()
                    .code("00")
                    .message("SUCCESS")
                    .paymentUrl(paymentUrl)
                    .build();

        } catch (Exception e) {
           throw new AppException(ErrorCode.PAYMENT_ALREADY_EXISTS);
        }
    }

//    đã xong phần thu tiền. cần sửa lại logic khi callback để chuyển trạng thái lịch

    public VNPAYResponse handleVNPayCallback(HttpServletRequest request) {
        try {
            Map<String, String> fields = new HashMap<>();
            Enumeration<String> params = request.getParameterNames();
            while (params.hasMoreElements()) {
                String key = params.nextElement();
                fields.put(key, request.getParameter(key));
            }

            String vnpSecureHash = fields.remove("vnp_SecureHash");

            String hashData = VNPAYUtil.getPaymentURL(fields, false);
            String signValue = VNPAYUtil.hmacSHA512(
                    vnPayConfig.getSecretKey(), hashData);

            if (!signValue.equals(vnpSecureHash)) {
                return VNPAYResponse.builder()
                        .code("97")
                        .message("INVALID SIGNATURE")
                        .build();
            }

            String vnpTxnRef = fields.get("vnp_TxnRef");
            String responseCode = fields.get("vnp_ResponseCode");
            String vnpTransactionNo = fields.get("vnp_TransactionNo");

            Payment payment = paymentRepository.findByVnpTxnRef(vnpTxnRef)
                    .orElseThrow(() -> new AppException(ErrorCode.PAYMENT_NOT_FOUND));

            if (!payment.getPaymentStatus().equals(PaymentStatus.PENDING)) {
                return VNPAYResponse.builder()
                        .code("02")
                        .message("Payment already processed")
                        .build();
            }

            if ("00".equals(responseCode)) {
                payment.setPaymentStatus(PaymentStatus.PAID);
                payment.setVnpTransactionNo(vnpTransactionNo);
                payment.setPaidAt(LocalDateTime.now());

                payment.getClassRequest()
                        .setStatus(ClassRequestStatus.PENDING);

            } else {
                payment.setPaymentStatus(PaymentStatus.FAILED);
            }

            paymentRepository.save(payment);

            return VNPAYResponse.builder()
                    .code(responseCode)
                    .message("CALLBACK PROCESSED")
                    .build();

        } catch (Exception e) {
            log.error("Error handling VNPAY callback", e);
            return VNPAYResponse.builder()
                    .code("99")
                    .message("Unknown error")
                    .build();
        }
    }

//    hoàn tiền
    public VNPAYResponse refundWhenTutorReject(Long classRequestId, String reason, HttpServletRequest request) {

        ClassRequest classRequest = classRequestRepository.findById(classRequestId)
                .orElseThrow(() -> new AppException(ErrorCode.CLASS_REQUEST_NOT_FOUND));

        Payment payment = paymentRepository.findByClassRequest(classRequest)
                .orElseThrow(() -> new AppException(ErrorCode.PAYMENT_NOT_FOUND));

        // 1. Check điều kiện
        if (payment.getPaymentStatus() != PaymentStatus.PAID) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        if (refundRepository.existsByPayment(payment)) {
            throw new AppException(ErrorCode.REFUND_ALREADY_EXISTS);
        }

        // 2. Tạo refund PENDING
        Refund refund = Refund.builder()
                .payment(payment)
                .refundAmount(payment.getAmount())
                .refundReason(reason)
                .refundStatus(RefundStatus.PENDING)
                .build();
        refundRepository.save(refund);

        // 3. Gọi VNPay refund
        boolean refundSuccess = callVNPayRefund(payment, refund, request);

        // 4. Cập nhật kết quả
        if (refundSuccess) {
            refund.setRefundStatus(RefundStatus.SUCCESS);
            refund.setRefundedAt(LocalDateTime.now());

            payment.setPaymentStatus(PaymentStatus.REFUNDED);
//            classRequest.setStatus(ClassRequestStatus.REJECTED);

        } else {
            refund.setRefundStatus(RefundStatus.FAILED);
        }

        refundRepository.save(refund);
        paymentRepository.save(payment);

        return VNPAYResponse.builder()
                .code(refundSuccess ? "00" : "99")
                .message(refundSuccess ? "REFUND SUCCESS" : "REFUND FAILED")
                .build();
    }

    private boolean callVNPayRefund(Payment payment, Refund refund, HttpServletRequest request) {
        try {
            Map<String, String> vnpParams = new HashMap<>();

            String requestId = VNPAYUtil.getRandomNumber(16);
            String createDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            String transactionDate = payment.getPaidAt()
                    .format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            String amount = payment.getAmount().multiply(BigDecimal.valueOf(100))
                    .setScale(0, RoundingMode.DOWN).toString();

            // Tạo checksum
            String hashData = String.join("|",
                    requestId,
                    vnPayConfig.getVnp_Version(),
                    "refund",
                    vnPayConfig.getVnp_TmnCode(),
                    "02",
                    payment.getVnpTxnRef(),
                    amount,
                    payment.getVnpTransactionNo() != null ?
                            payment.getVnpTransactionNo() : "",
                    transactionDate,
                    "system",
                    createDate,
                    VNPAYUtil.getIpAddress(request),
                    "Hoan tien lop hoc"
            );

            String secureHash = VNPAYUtil.hmacSHA512(
                    vnPayConfig.getSecretKey(),
                    hashData
            );

            log.info("Hash data: {}", hashData);
            log.info("Secure hash: {}", secureHash);

            // Thêm các tham số vào map
            vnpParams.put("vnp_RequestId", requestId);
            vnpParams.put("vnp_Version", vnPayConfig.getVnp_Version());
            vnpParams.put("vnp_Command", "refund");
            vnpParams.put("vnp_TmnCode", vnPayConfig.getVnp_TmnCode());
            vnpParams.put("vnp_TransactionType", "02");
            vnpParams.put("vnp_TxnRef", payment.getVnpTxnRef());
            vnpParams.put("vnp_Amount", amount);
            vnpParams.put("vnp_OrderInfo", "Hoan tien lop hoc");

            // Chỉ thêm vnp_TransactionNo nếu có
            if (payment.getVnpTransactionNo() != null &&
                    !payment.getVnpTransactionNo().isEmpty()) {
                vnpParams.put("vnp_TransactionNo", payment.getVnpTransactionNo());
            }

            vnpParams.put("vnp_TransactionDate", transactionDate);
            vnpParams.put("vnp_CreateBy", "system");
            vnpParams.put("vnp_CreateDate", createDate);
            vnpParams.put("vnp_IpAddr", VNPAYUtil.getIpAddress(request));
            vnpParams.put("vnp_SecureHash", secureHash);

            // Gọi API
            String response = HttpClientUtil.post(
                    vnPayConfig.getVnp_ApiUrl(),
                    vnpParams
            );

            // Parse response (VNPAY trả về JSON)
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, String> result = objectMapper.readValue(
                    response,
                    new TypeReference<Map<String, String>>() {}
            );

            log.info("Refund response: {}", result);

            if ("00".equals(result.get("vnp_ResponseCode"))) {
                refund.setVnpRefundTransactionNo(
                        result.get("vnp_TransactionNo")
                );
                return true;
            }

            log.error("Refund failed: {}", result.get("vnp_Message"));
            return false;

        } catch (Exception e) {
            log.error("VNPay refund error", e);
            return false;
        }
    }









    private String getVNPayErrorMessage(String responseCode) {
        Map<String, String> errorMessages = new HashMap<>();
        errorMessages.put("07", "Trừ tiền thành công. Giao dịch bị nghi ngờ (liên quan tới lừa đảo, giao dịch bất thường).");
        errorMessages.put("09", "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng chưa đăng ký dịch vụ InternetBanking tại ngân hàng.");
        errorMessages.put("10", "Giao dịch không thành công do: Khách hàng xác thực thông tin thẻ/tài khoản không đúng quá 3 lần");
        errorMessages.put("11", "Giao dịch không thành công do: Đã hết hạn chờ thanh toán.");
        errorMessages.put("12", "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng bị khóa.");
        errorMessages.put("13", "Giao dịch không thành công do Quý khách nhập sai mật khẩu xác thực giao dịch (OTP).");
        errorMessages.put("24", "Giao dịch không thành công do: Khách hàng hủy giao dịch");
        errorMessages.put("51", "Giao dịch không thành công do: Tài khoản của quý khách không đủ số dư để thực hiện giao dịch.");
        errorMessages.put("65", "Giao dịch không thành công do: Tài khoản của Quý khách đã vượt quá hạn mức giao dịch trong ngày.");
        errorMessages.put("75", "Ngân hàng thanh toán đang bảo trì.");
        errorMessages.put("79", "Giao dịch không thành công do: KH nhập sai mật khẩu thanh toán quá số lần quy định.");
        return errorMessages.getOrDefault(responseCode, "Giao dịch thất bại");
    }


}