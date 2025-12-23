package com.example.tutorsFinderSystem.repositories;

import com.example.tutorsFinderSystem.entities.ClassRequest;
import com.example.tutorsFinderSystem.entities.Payment;
import com.example.tutorsFinderSystem.enums.PaymentStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

    Optional<Payment> findByVnpTxnRef(String vnpTxnRef);

    boolean existsByClassRequest(ClassRequest classRequest);
    Optional<Payment> findByClassRequest(ClassRequest classRequest);

    @Query("""
    SELECT p FROM Payment p
    JOIN FETCH p.classRequest cr
    JOIN FETCH cr.tutor t
    JOIN FETCH cr.learner l
    JOIN FETCH cr.subject s
    ORDER BY p.createdAt DESC
""")
    Page<Payment> findRecentTransactions(Pageable pageable);

    // Tổng doanh thu theo thời gian & trạng thái
    @Query("""
        SELECT COALESCE(SUM(p.amount), 0)
        FROM Payment p
        WHERE p.paymentStatus = :status
          AND p.createdAt BETWEEN :start AND :end
    """)
    BigDecimal sumAmountByStatusAndPeriod(
            PaymentStatus status,
            LocalDateTime start,
            LocalDateTime end
    );

    // Tổng tiền chờ thanh toán
    @Query("""
        SELECT COALESCE(SUM(p.amount), 0)
        FROM Payment p
        WHERE p.paymentStatus = 'PENDING'
    """)
    BigDecimal sumPendingAmount();



}
