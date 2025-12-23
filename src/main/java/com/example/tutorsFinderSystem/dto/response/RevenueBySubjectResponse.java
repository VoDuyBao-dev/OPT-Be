package com.example.tutorsFinderSystem.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class RevenueBySubjectResponse {
    private String subject;
    private BigDecimal amount;
    private Double percent;
}