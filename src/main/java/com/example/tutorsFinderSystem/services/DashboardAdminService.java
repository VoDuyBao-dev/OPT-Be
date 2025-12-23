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

        LocalDateTime startOfThisMonth =
                now.withDayOfMonth(1).withHour(0).withMinute(0).withSecond(0);

        LocalDateTime startOfLastMonth =
                startOfThisMonth.minusMonths(1);

        LocalDateTime endOfLastMonth =
                startOfThisMonth.minusSeconds(1);

        //Doanh thu
        BigDecimal thisMonthRevenue = paymentRepository.sumAmountByStatusAndPeriod(PaymentStatus.PAID, startOfThisMonth, now);

        BigDecimal lastMonthRevenue = paymentRepository.sumAmountByStatusAndPeriod(
                        PaymentStatus.PAID,
                        startOfLastMonth,
                        endOfLastMonth
                );

        //% tăng trưởng
        double growthPercent = calculateGrowthPercent(lastMonthRevenue, thisMonthRevenue);

        //Lợi nhuận sàn
        BigDecimal platformProfit = thisMonthRevenue.multiply(PLATFORM_FEE_RATE);

        //Gia sư active
        Long activeTutors = tutorRepo.countActiveTutors();

        //Chờ thanh toán
        BigDecimal pendingAmount = paymentRepository.sumPendingAmount();

        return AdminDashboardStatsResponse.builder()
                .totalRevenue(thisMonthRevenue)
                .platformProfit(platformProfit)
                .activeTutors(activeTutors)
                .pendingAmount(pendingAmount)
                .revenueGrowthPercent(growthPercent)
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
