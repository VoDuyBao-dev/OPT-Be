package com.example.tutorsFinderSystem.dto.response;

import com.example.tutorsFinderSystem.dto.common.WeeklyScheduleDTO;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class OfficialClassPreviewResponse {


    private Long classRequestId;

    private BigDecimal totalAmount;
    private int totalSessions;

    private String tutorName;
    private String subjectName;

    private LocalDate startDate;
    private LocalDate endDate;

    private List<WeeklyScheduleDTO> schedules;
    private String additionalNotes;
}

