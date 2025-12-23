package com.example.tutorsFinderSystem.controller.payment;

import com.example.tutorsFinderSystem.dto.ApiResponse;
import com.example.tutorsFinderSystem.dto.request.CreatePaymentRequest;
import com.example.tutorsFinderSystem.dto.request.RefundRequest;
import com.example.tutorsFinderSystem.dto.response.VNPAYResponse;
import com.example.tutorsFinderSystem.services.VNPAYService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payment/vnpay")
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE)
public class VNPAYController {
    final VNPAYService vnpayService;


    @PostMapping("/create")
    public ApiResponse<VNPAYResponse> createPayment(
            @RequestBody CreatePaymentRequest request,
            HttpServletRequest httpServletRequest
    ) {
        VNPAYResponse response = vnpayService.createVNPAYPayment(request, httpServletRequest);

        return ApiResponse.<VNPAYResponse>builder()
                .code(200)
                .message("Tạo link thanh toán thành công")
                .result(response)
                .build();
    }

//    fix phần callback của vnpay

    @GetMapping("/callback")
    public String vnpayCallback(HttpServletRequest request) {

        log.info("Received VNPAY callback");

        VNPAYResponse response = vnpayService.handleVNPayCallback(request);

        // Redirect về frontend web (React)
        // VD: http://localhost:3000/payment/result?status=success
        return "redirect:http://localhost:3000/payment/result"
                + "?code=" + response.getCode()
                + "&message=" + response.getMessage();
    }

    //    hoàn tiền
//    @PostMapping("/refund")
//    public ApiResponse<VNPAYResponse> refund(
//            @RequestBody RefundRequest requestRefund, HttpServletRequest request
//    ) {
//
//        VNPAYResponse response = vnpayService.refundWhenTutorReject( requestRefund.getClassRequestId(),
//                requestRefund.getReason(), request);
//
//        return ApiResponse.<VNPAYResponse>builder()
//                .code(200)
//                .result(response)
//                .build();
//    }

}
