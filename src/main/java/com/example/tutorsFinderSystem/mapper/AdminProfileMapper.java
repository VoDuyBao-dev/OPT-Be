package com.example.tutorsFinderSystem.mapper;

import com.example.tutorsFinderSystem.dto.response.AdminProfileResponse;
import com.example.tutorsFinderSystem.entities.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.time.format.DateTimeFormatter;

@Mapper(componentModel = "spring")
public interface AdminProfileMapper {

    DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Mapping(target = "role", expression = "java(extractMainRole(user))")
    @Mapping(target = "roleLabel", expression = "java(buildRoleLabel(user))")
    @Mapping(target = "createdAt", expression = "java(user.getCreatedAt() != null ? user.getCreatedAt().format(FORMATTER) : null)")
    // @Mapping(target = "avatarUrl", source = "avatarImage")
    @Mapping(target = "avatarUrl", expression = "java(buildAvatarUrl(user))")
    AdminProfileResponse toResponse(User user);

    // ===== helper methods =====

    default String extractMainRole(User user) {
        if (user.getRoles() == null || user.getRoles().isEmpty()) {
            return null;
        }
        return user.getRoles().iterator().next(); // ADMIN
    }

    default String buildRoleLabel(User user) {
        String role = extractMainRole(user);
        if ("ADMIN".equals(role))
            return "Quản trị viên";
        if ("TUTOR".equals(role))
            return "Gia sư";
        if ("PARENT".equals(role))
            return "Người học";
        return role;
    }

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
