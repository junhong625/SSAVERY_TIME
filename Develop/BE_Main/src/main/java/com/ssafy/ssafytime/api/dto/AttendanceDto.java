package com.ssafy.ssafytime.api.dto;

import com.ssafy.ssafytime.db.entity.Attendance;
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

    private Long userIdx;

    private Integer attendanceCategory;

    private LocalDate attendanceDate;

    private LocalDate attendanceTime;

    public static AttendanceDto from(Attendance attendance) {
        if(attendance == null) return null;

        return AttendanceDto.builder()
                .userIdx(attendance.getId().getUserIdx())
                .attendanceCategory(attendance.getId().getAttendanceCategory())
                .attendanceDate(attendance.getId().getAttendanceDate())
                .build();
    }
}
