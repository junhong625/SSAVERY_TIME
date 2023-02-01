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

    private String userIdx;

    private Integer attendanceCategory;

    private LocalDateTime attendanceDate;

    private LocalDateTime attendanceTime;

//    public static AttendanceDto from(Attendance attendance) {
//        if(attendance == null) return null;
//
//        return AttendanceDto.builder()
//                .userIdx(attendance.getUser().getUserIdx())
//                .attendanceCategory(attendance.getId().getAttendanceCategory())
//                .attendanceDate(attendance.getId().getAttendanceDate())
//                .build();
//    }
}
