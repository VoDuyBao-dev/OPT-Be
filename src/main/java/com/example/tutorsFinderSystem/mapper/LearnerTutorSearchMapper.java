package com.example.tutorsFinderSystem.mapper;

import com.example.tutorsFinderSystem.dto.common.SubjectDTO;
// import com.example.tutorsFinderSystem.dto.common.SubjectDTO;
import com.example.tutorsFinderSystem.dto.response.TutorSearchItemResponse;
import com.example.tutorsFinderSystem.entities.Subject;
import com.example.tutorsFinderSystem.entities.Tutor;
import com.example.tutorsFinderSystem.entities.User;

// import java.util.Collection;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

// import java.util.List;

@Mapper(componentModel = "spring")
public interface LearnerTutorSearchMapper {

    @Mapping(source = "tutor.tutorId", target = "tutorId")
    @Mapping(source = "tutor.user.userId", target = "userId")
    @Mapping(source = "tutor.user.fullName", target = "fullName")
    @Mapping(source = "tutor.gender", target = "gender")
    @Mapping(source = "tutor.address", target = "address")
    @Mapping(source = "tutor.university", target = "university")
    @Mapping(source = "tutor.educationalLevel", target = "educationalLevel")
    @Mapping(source = "tutor.pricePerHour", target = "pricePerHour")
    @Mapping(target = "avatarUrl", expression = "java(buildAvatarUrl(tutor.getUser()))")
    @Mapping(source = "subject", target = "subject")
    TutorSearchItemResponse toItem(Tutor tutor, Subject subject);

    default SubjectDTO map(Subject subject) {
        if (subject == null)
            return null;

        return SubjectDTO.builder()
                .subjectId(subject.getSubjectId())
                .subjectName(subject.getSubjectName())
                .build();
    }
    // List<TutorSearchItemResponse> toItems(List<Tutor> tutors);

    // default List<SubjectDTO> mapSubjects(Collection<Subject> subjects) {
    // if (subjects == null || subjects.isEmpty()) {
    // return List.of();
    // }

    // return subjects.stream()
    // .map(s -> SubjectDTO.builder()
    // .subjectId(s.getSubjectId())
    // .subjectName(s.getSubjectName())
    // .build())
    // .toList();
    // }

    default String buildAvatarUrl(User user) {
        if (user == null || user.getAvatarImage() == null)
            return null;

        String avatar = user.getAvatarImage();

        if (!avatar.contains("http")) {
            return "http://localhost:8080/tutorsFinder/drive/view/" + avatar;
        }

        if (avatar.contains("id=")) {
            String id = avatar.substring(avatar.indexOf("id=") + 3);
            int idx = id.indexOf("&");
            if (idx != -1)
                id = id.substring(0, idx);

            return "http://localhost:8080/tutorsFinder/drive/view/" + id;
        }

        return avatar;
    }
}
