package com.example.tutorsFinderSystem.services;

import com.example.tutorsFinderSystem.dto.common.RelatedClassDTO;
import com.example.tutorsFinderSystem.dto.response.CompletedClassResponse;
import com.example.tutorsFinderSystem.entities.ClassEntity;
import com.example.tutorsFinderSystem.entities.Learner;
import com.example.tutorsFinderSystem.entities.Tutor;
import com.example.tutorsFinderSystem.entities.User;
import com.example.tutorsFinderSystem.enums.ClassStatus;
import com.example.tutorsFinderSystem.exceptions.AppException;
import com.example.tutorsFinderSystem.exceptions.ErrorCode;
import com.example.tutorsFinderSystem.mapper.ClassesMapper;
import com.example.tutorsFinderSystem.repositories.*;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ClassEntityService {
    ClassRepository classRepository;
    ClassesMapper classesMapper;
    UserService userService;
    LearnerRepository learnerRepository;
    RatingsRepository ratingsRepository;
    TutorRepository tutorRepository;


    //    Lấy danh sách lớp học liên quan dựa trên môn học và gia sư
    @Transactional(readOnly = true)
    public List<RelatedClassDTO> getRelatedClasses(
            Long subjectId,
            Long tutorId,
            int limit
    ) {

        if (subjectId == null && tutorId == null) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        Pageable pageable = PageRequest.of(0, limit);

        return classRepository
                .findRelatedClasses(subjectId, tutorId, pageable)
                .stream()
                .map(classesMapper::toRelatedClassDTO)
                .toList();
    }

    @Transactional(readOnly = true)
    public List<RelatedClassDTO> getRelatedTutors(
            Long subjectId,
            Long tutorId,
            int limit
    ) {

        if (subjectId == null && tutorId == null) {
            throw new AppException(ErrorCode.INVALID_REQUEST);
        }

        Pageable pageable = PageRequest.of(0, limit);
        List<Tutor> tutors;

        if (subjectId != null) {
            // Ưu tiên tìm theo môn
            tutors = tutorRepository.findTutorsBySubject(subjectId, pageable);
        } else {
            // Tìm các gia sư cùng môn với tutor hiện tại
            tutors = tutorRepository.findRelatedTutorsByTutor(tutorId, pageable);
        }

        return tutors.stream()
                .map(classesMapper::toRelatedClassDTOFromTutor)
                .toList();
    }


    public List<CompletedClassResponse> getCompletedClassesForLearner() {

        User user = userService.getCurrentUser();

        Learner learner = learnerRepository
                .findByUser_Email(user.getEmail())
                .orElseThrow(() -> new AppException(ErrorCode.LEARNER_USER_NOT_FOUND));

        //Lấy các lớp COMPLETED của learner
        List<ClassEntity> classes = classRepository
                .findByStatusAndClassRequest_Learner(
                        ClassStatus.COMPLETED,
                        learner
                );

        return classes.stream()
                .map(c -> {
                    boolean canRate =
                            !ratingsRepository.existsByClassEntity_ClassId(c.getClassId());

                    return classesMapper.toCompletedClassResponse(c, canRate);
                })
                .toList();


    }


}
