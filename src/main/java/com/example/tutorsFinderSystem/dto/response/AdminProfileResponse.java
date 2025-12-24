package com.example.tutorsFinderSystem.dto.response;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminProfileResponse {

    private String fullName;
    private String email;
    private String phoneNumber;

    private String role;       // ADMIN
    private String roleLabel;  // Quản trị viên

    private String avatarUrl;
    private String createdAt;  // format: dd/MM/yyyy
}
