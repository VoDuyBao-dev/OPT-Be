package com.example.tutorsFinderSystem.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class MonthlyRevenueResponse {
    private String month;       // YYYY-MM
    private BigDecimal revenue;
    private BigDecimal profit;
}
