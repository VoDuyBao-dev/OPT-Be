package com.example.tutorsFinderSystem.controller.admin;

import com.example.tutorsFinderSystem.dto.ApiResponse;
import com.example.tutorsFinderSystem.dto.PageResponse;
import com.example.tutorsFinderSystem.dto.response.EbookResponse;
import com.example.tutorsFinderSystem.dto.response.TransactionResponse;
import com.example.tutorsFinderSystem.entities.Payment;
import com.example.tutorsFinderSystem.services.PaymentService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/revenue")
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RevenueController {

    PaymentService paymentService;

    @GetMapping("/transactions")
    public ApiResponse<Page<TransactionResponse>> getRecentTransactions(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {

        Page<TransactionResponse> transactions = paymentService.getRecentTransactions(page, size);

        return ApiResponse.<Page<TransactionResponse>>builder()
                .code(200)
                .message("get transactions success")
                .result(transactions)
                .build();
    }

}
