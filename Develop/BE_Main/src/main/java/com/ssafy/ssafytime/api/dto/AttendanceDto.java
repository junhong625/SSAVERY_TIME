package com.ssafy.ssafytime.api.dto;

import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.db.entity.User;
import lombok.*;

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

    public static AttendanceDto from(Attendance attendance) {
        if(attendance == null) return null;

        return AttendanceDto.builder()
                .attendanceCategory(attendance.getAttendanceCategory())
                .build();
    }
}
