package com.example.tutorsFinderSystem.dto.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminRejectTutorRequest {
    @NotBlank(message = "Reason_required")
    private String reason;
}
