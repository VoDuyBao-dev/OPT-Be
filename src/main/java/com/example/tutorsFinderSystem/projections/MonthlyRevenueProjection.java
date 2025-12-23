package com.example.tutorsFinderSystem.projections;

import java.math.BigDecimal;

public interface MonthlyRevenueProjection {
    Integer getYear();
    Integer getMonth();
    BigDecimal getRevenue();
}