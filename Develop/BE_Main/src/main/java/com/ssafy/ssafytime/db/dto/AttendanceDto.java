package com.ssafy.ssafytime.db.dto;

import com.ssafy.ssafytime.db.entity.Attendance;
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
