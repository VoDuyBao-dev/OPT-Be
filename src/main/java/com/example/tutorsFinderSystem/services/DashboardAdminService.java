package com.example.tutorsFinderSystem.services;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.example.tutorsFinderSystem.dto.response.AdminDashboardStatsResponse;
import com.example.tutorsFinderSystem.enums.PaymentStatus;
import com.example.tutorsFinderSystem.repositories.*;
import org.springframework.stereotype.Service;

import com.example.tutorsFinderSystem.dto.response.DashboardAdminResponse;
import com.example.tutorsFinderSystem.entities.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DashboardAdminService {

    private final LearnerRepository learnerRepo;
    private final TutorRepository tutorRepo;
    private final ClassRequestRepository classRequestRepo;
    private final EbookRepository ebookRepo;
    private final RatingRepository ratingRepo;
    private final PaymentRepository paymentRepository;
    private static final BigDecimal PLATFORM_FEE_RATE = new BigDecimal("0.20"); // 20%


    public DashboardAdminResponse getDashboard() {

        long totalLearners = learnerRepo.count();
        long totalTutors = tutorRepo.count();
        long totalClassRequests = classRequestRepo.count();
        long totalEbooks = ebookRepo.count();

        // Lấy dữ liệu thô
        List<ClassRequest> requests = classRequestRepo.findAll();
        List<Ebook> ebooks = ebookRepo.findAll();
        List<Tutor> tutors = tutorRepo.findAll();
        List<Ratings> ratings = ratingRepo.findAll();

        // Thống kê ebook theo type
        Map<String, Long> ebookByType = ebooks.stream()
                .collect(Collectors.groupingBy(
                        e -> e.getType().name(),
                        Collectors.counting()
                ));

        // Top môn có nhiều tutor dạy nhất
        List<DashboardAdminResponse.SubjectCountDTO> topSubjectsByTutor =
                tutors.stream()
                        .flatMap(t -> t.getSubjects().stream())
                        .collect(Collectors.groupingBy(
                                Subject::getSubjectId,
                                Collectors.counting()
                        ))
                        .entrySet().stream()
                        .map(e -> {
                            Long id = e.getKey();
                            Long count = e.getValue();
                            String name = tutors.stream()
                                    .flatMap(t -> t.getSubjects().stream())
                                    .filter(s -> s.getSubjectId().equals(id))
                                    .findFirst()
                                    .map(Subject::getSubjectName)
                                    .orElse("Unknown");

                            return DashboardAdminResponse.SubjectCountDTO.builder()
                                    .subjectId(id)
                                    .subjectName(name)
                                    .count(count)
                                    .build();
                        })
                        .sorted((a, b) -> Long.compare(b.getCount(), a.getCount()))
                        .limit(5)
                        .toList();

        // Top môn được yêu cầu nhiều nhất
        List<DashboardAdminResponse.SubjectCountDTO> topRequestedSubjects =
                requests.stream()
                        .collect(Collectors.groupingBy(
                                cr -> cr.getSubject().getSubjectId(),
                                Collectors.counting()
                        ))
                        .entrySet().stream()
                        .map(e -> {
                            Long id = e.getKey();
                            Long count = e.getValue();
                            String name = requests.stream()
                                    .filter(r -> r.getSubject().getSubjectId().equals(id))
                                    .findFirst()
                                    .map(r -> r.getSubject().getSubjectName())
                                    .orElse("Unknown");

                            return DashboardAdminResponse.SubjectCountDTO.builder()
                                    .subjectId(id)
                                    .subjectName(name)
                                    .count(count)
                                    .build();
                        })
                        .sorted((a, b) -> Long.compare(b.getCount(), a.getCount()))
                        .limit(5)
                        .toList();

        // Rating distribution
        Map<Integer, Long> ratingDistribution = ratings.stream()
                .collect(Collectors.groupingBy(
                        r -> (int) Math.round(r.getScore()),
                        Collectors.counting()
                ));

        // Request status distribution
        Map<String, Long> requestStatusDistribution = requests.stream()
                .collect(Collectors.groupingBy(
                        r -> r.getStatus().name(),
                        Collectors.counting()
                ));

        // Tutor verification
        Map<String, Long> tutorVerificationStatus = tutors.stream()
                .collect(Collectors.groupingBy(
                        t -> t.getVerificationStatus().name(),
                        Collectors.counting()
                ));

        return DashboardAdminResponse.builder()
                .totalLearners(totalLearners)
                .totalTutors(totalTutors)
                .totalClassRequests(totalClassRequests)
                .totalEbooks(totalEbooks)
                .ebookByType(ebookByType)
                .topSubjectsByTutor(topSubjectsByTutor)
                .topRequestedSubjects(topRequestedSubjects)
                .ratingDistribution(ratingDistribution)
                .requestStatusDistribution(requestStatusDistribution)
                .tutorVerificationStatus(tutorVerificationStatus)
                .build();
    }




    public AdminDashboardStatsResponse getDashboardStats() {
        LocalDateTime now = LocalDateTime.now();

        // Tháng này: từ ngày 1 đến cuối ngày hôm nay
        LocalDateTime startOfThisMonth = now.withDayOfMonth(1)
                .withHour(0).withMinute(0).withSecond(0).withNano(0);

        LocalDateTime endOfToday = now.withHour(23).withMinute(59)
                .withSecond(59).withNano(999999999);

        // Tháng trước: từ ngày 1 đến cuối tháng
        LocalDateTime startOfLastMonth = startOfThisMonth.minusMonths(1);
        LocalDateTime endOfLastMonth = startOfThisMonth.minusNanos(1);

        // ===== TỔNG DOANH THU TẤT CẢ THỜI GIAN =====
        BigDecimal totalRevenue = paymentRepository.sumTotalAmountByStatus(
                PaymentStatus.PAID
        );

        // ===== DOANH THU THÁNG NÀY (cho tính % tăng trưởng) =====
        BigDecimal thisMonthRevenue = paymentRepository.sumAmountByStatusAndPeriod(
                PaymentStatus.PAID,
                startOfThisMonth,
                endOfToday
        );

        // ===== DOANH THU THÁNG TRƯỚC (cho tính % tăng trưởng) =====
        BigDecimal lastMonthRevenue = paymentRepository.sumAmountByStatusAndPeriod(
                PaymentStatus.PAID,
                startOfLastMonth,
                endOfLastMonth
        );

        // % tăng trưởng: so sánh tháng này vs tháng trước
        double growthPercent = calculateGrowthPercent(lastMonthRevenue, thisMonthRevenue);

        // Lợi nhuận sàn: tính từ TỔNG doanh thu
        BigDecimal platformProfit = totalRevenue.multiply(PLATFORM_FEE_RATE);

        // Gia sư active
        Long activeTutors = tutorRepo.countActiveTutors();

        // Chờ thanh toán
        BigDecimal pendingAmount = paymentRepository.sumPendingAmount();

        return AdminDashboardStatsResponse.builder()
                .totalRevenue(totalRevenue)           // ← Tổng tất cả thời gian
                .platformProfit(platformProfit)        // ← 20% của tổng doanh thu
                .activeTutors(activeTutors)
                .pendingAmount(pendingAmount)
                .revenueGrowthPercent(growthPercent)   // ← % tăng trưởng tháng này vs tháng trước
                .build();
    }

    private double calculateGrowthPercent(BigDecimal last, BigDecimal current) {
        if (last.compareTo(BigDecimal.ZERO) == 0) {
            return current.compareTo(BigDecimal.ZERO) > 0 ? 100.0 : 0.0;
        }

        return current.subtract(last)
                .divide(last, 4, RoundingMode.HALF_UP)
                .multiply(BigDecimal.valueOf(100))
                .doubleValue();
    }
}
