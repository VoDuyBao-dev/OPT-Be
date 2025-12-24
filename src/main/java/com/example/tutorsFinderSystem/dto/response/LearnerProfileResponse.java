package com.example.tutorsFinderSystem.dto.response;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LearnerProfileResponse {

    private String fullName;
    private String phoneNumber;
    private String address;
    private String avatarUrl;
    private String email;
    // private String roleLabel; // Người học
}
