package com.example.tutorsFinderSystem.services;

import com.example.tutorsFinderSystem.dto.response.TransactionResponse;
import com.example.tutorsFinderSystem.entities.Payment;
import com.example.tutorsFinderSystem.mapper.PaymentMapper;
import com.example.tutorsFinderSystem.repositories.PaymentRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PaymentService {
    PaymentRepository paymentRepository;

    PaymentMapper paymentMapper;

    public Page<TransactionResponse> getRecentTransactions(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<Payment> paymentPage = paymentRepository.findRecentTransactions(pageable);

        return paymentPage.map(paymentMapper::toTransactionResponse);
    }
}
