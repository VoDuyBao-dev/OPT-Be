package com.example.tutorsFinderSystem.dto.response;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminDashboardStatsResponse {

    private BigDecimal totalRevenue;        // Tổng doanh thu
    private BigDecimal platformProfit;      // Lợi nhuận sàn
    private Long activeTutors;               // Gia sư active
    private BigDecimal pendingAmount;        // Chờ thanh toán

    private Double revenueGrowthPercent;     // % tăng trưởng doanh thu
}
