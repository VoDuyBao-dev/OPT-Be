package com.example.tutorsFinderSystem.repositories;

import com.example.tutorsFinderSystem.entities.ClassRequest;
import com.example.tutorsFinderSystem.entities.Learner;
import com.example.tutorsFinderSystem.entities.Subject;
import com.example.tutorsFinderSystem.entities.Tutor;
import com.example.tutorsFinderSystem.enums.ClassRequestStatus;
import com.example.tutorsFinderSystem.enums.ClassRequestType;
import com.example.tutorsFinderSystem.enums.DayOfWeek;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.data.domain.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassRequestRepository extends JpaRepository<ClassRequest, Long> {

	List<ClassRequest> findAll();

	@Query("""
			    SELECT COUNT(cr)
			    FROM ClassRequest cr
			    WHERE cr.tutor.tutorId = :tutorId
			      AND cr.status = 'PENDING'
			""")
	int countNewRequests(Long tutorId);

	Page<ClassRequest> findByTutor_TutorIdAndStatusIn(Long tutorId, List<ClassRequestStatus> statuses,
			Pageable pageable);

	Page<ClassRequest> findByTutor_TutorIdAndTypeAndStatusIn(
			Long tutorId,
			ClassRequestType type,
			List<ClassRequestStatus> statuses,
			Pageable pageable);

	Page<ClassRequest> findByTutor_TutorId(Long tutorId, Pageable pageable);

	Page<ClassRequest> findByTutor_TutorIdAndStatus(
			Long tutorId,
			ClassRequestStatus status,
			Pageable pageable);

	Page<ClassRequest> findByTutor_TutorIdAndType(
			Long tutorId,
			ClassRequestType type,
			Pageable pageable);

	Page<ClassRequest> findByTutor_TutorIdAndStatusAndType(
			Long tutorId,
			ClassRequestStatus status,
			ClassRequestType type,
			Pageable pageable);

	Page<ClassRequest> findByLearner_User_Email(String email, Pageable pageable);

	@Query("""
			    SELECT COUNT(cr) > 0
			    FROM ClassRequest cr
			    WHERE cr.learner = :learner
			      AND cr.tutor = :tutor
			      AND cr.subject = :subject
			      AND cr.type = :type
			      AND cr.status IN :statuses
			""")
	boolean existsDuplicateTrial(
			@Param("learner") Learner learner,
			@Param("tutor") Tutor tutor,
			@Param("subject") Subject subject,
			@Param("type") ClassRequestType type,
			@Param("statuses") List<ClassRequestStatus> statuses);

	@Query("""
			    SELECT COUNT(cr) > 0
			    FROM ClassRequest cr
			    WHERE cr.learner = :learner
			      AND cr.tutor = :tutor
			      AND cr.subject = :subject
			      AND cr.type = :type
			      AND cr.status = com.example.tutorsFinderSystem.enums.ClassRequestStatus.PENDING
			""")
	boolean existsPendingTrialSameSubject(
			@Param("learner") Learner learner,
			@Param("tutor") Tutor tutor,
			@Param("subject") Subject subject,
			@Param("type") ClassRequestType type);

	@Query("""
			    SELECT cr
			    FROM ClassRequest cr
			    JOIN RequestSchedule rs ON rs.classRequest = cr
			    WHERE cr.tutor.tutorId = :tutorId
			      AND cr.status = com.example.tutorsFinderSystem.enums.ClassRequestStatus.CONFIRMED
			      AND cr.requestId <> :currentRequestId
			      AND cr.startDate <= :endDate
			      AND cr.endDate >= :startDate
			      AND rs.dayOfWeek = :dayOfWeek
			      AND NOT (
			            :endTime <= rs.startTime
			         OR :startTime >= rs.endTime
			      )
			""")
	List<ClassRequest> findConflictingRequests(
			@Param("tutorId") Long tutorId,
			@Param("currentRequestId") Long currentRequestId,
			@Param("startDate") LocalDate startDate,
			@Param("endDate") LocalDate endDate,
			@Param("dayOfWeek") DayOfWeek dayOfWeek,
			@Param("startTime") LocalTime startTime,
			@Param("endTime") LocalTime endTime);

	@Query("""
			    SELECT COUNT(cr)
			    FROM ClassRequest cr
			    WHERE cr.tutor.tutorId = :tutorId
			      AND cr.status = com.example.tutorsFinderSystem.enums.ClassRequestStatus.CONFIRMED
			      AND FUNCTION('YEARWEEK', cr.startDate, 1)
			          = FUNCTION('YEARWEEK', CURRENT_DATE(), 1)
			""")
	int countWeeklyConfirmedClasses(@Param("tutorId") Long tutorId);

}
