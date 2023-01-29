package com.ssafy.ssafytime.api.dto;

import lombok.*;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceDto {

    private String userIdx;

    private Integer attendanceCategory;

    private LocalDateTime attendanceDate;

    private LocalDateTime attendanceTime;
}
