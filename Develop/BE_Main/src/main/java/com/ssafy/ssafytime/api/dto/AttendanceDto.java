package com.ssafy.ssafytime.api.dto;

import lombok.*;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceDto {

    private Long userIdx;

    private Integer attendanceCategory;

    private Integer sum;
}
