package com.example.tutorsFinderSystem.services;

import com.example.tutorsFinderSystem.dto.response.MonthlyRevenueResponse;
import com.example.tutorsFinderSystem.dto.response.RevenueBySubjectResponse;
import com.example.tutorsFinderSystem.enums.PaymentStatus;
import com.example.tutorsFinderSystem.exceptions.AppException;
import com.example.tutorsFinderSystem.exceptions.ErrorCode;
import com.example.tutorsFinderSystem.repositories.PaymentRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RevenueService {

    PaymentRepository paymentRepository;

    static BigDecimal PLATFORM_FEE_RATE = new BigDecimal("0.20");

    public List<MonthlyRevenueResponse> getRevenueLast6Months() {

        LocalDate now = LocalDate.now();

        LocalDate startDate = now.minusMonths(5).withDayOfMonth(1);
        LocalDate endDate = now.withDayOfMonth(now.lengthOfMonth());

        LocalDateTime start = startDate.atStartOfDay();
        LocalDateTime end = endDate.atTime(23, 59, 59);

        var projections = paymentRepository.getMonthlyRevenue(
                PaymentStatus.PAID,
                start,
                end
        );

        // Map key: YYYY-MM
        Map<String, BigDecimal> revenueMap = new HashMap<>();
        for (var p : projections) {
            String key = String.format("%04d-%02d", p.getYear(), p.getMonth());
            revenueMap.put(key, p.getRevenue());
        }

        // Đảm bảo đủ 6 tháng (kể cả tháng không có doanh thu)
        List<MonthlyRevenueResponse> result = new ArrayList<>();

        for (int i = 5; i >= 0; i--) {
            LocalDate date = now.minusMonths(i);
            String key = String.format("%04d-%02d", date.getYear(), date.getMonthValue());

            BigDecimal revenue = revenueMap.getOrDefault(key, BigDecimal.ZERO);
            BigDecimal profit = revenue.multiply(PLATFORM_FEE_RATE);

            result.add(new MonthlyRevenueResponse(key, revenue, profit));
        }

        return result;
    }

    public List<RevenueBySubjectResponse> getRevenueBySubject(String range) {

        LocalDateTime end = LocalDateTime.now();
        LocalDateTime start = calculateStartDate(range, end);

        var projections = paymentRepository.sumRevenueBySubject(PaymentStatus.PAID, start, end);

        BigDecimal totalRevenue = projections.stream()
                .map(p -> p.getAmount())
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return projections.stream()
                .map(p -> new RevenueBySubjectResponse(
                        p.getSubject(),
                        p.getAmount(),
                        calculatePercent(p.getAmount(), totalRevenue)
                ))
                .toList();
    }

    private LocalDateTime calculateStartDate(String range, LocalDateTime end) {
        return switch (range) {
            case "7d" -> end.minusDays(7);
            case "30d" -> end.minusDays(30);
            case "90d" -> end.minusDays(90);
            default -> throw new AppException(ErrorCode.INVALID_DATE_RANGE);
        };
    }

    private double calculatePercent(BigDecimal amount, BigDecimal total) {
        if (total.compareTo(BigDecimal.ZERO) == 0) return 0;
        return amount
                .multiply(BigDecimal.valueOf(100))
                .divide(total, 2, RoundingMode.HALF_UP)
                .doubleValue();
    }
}
