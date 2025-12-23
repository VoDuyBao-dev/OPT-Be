package com.example.tutorsFinderSystem.dto.response;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TransactionResponse {

    private String transactionCode;
    private String tutorName;
    private String learnerName;
    private String subjectName;
    private BigDecimal amount;
    private String status;
    private LocalDateTime createdAt;
}

