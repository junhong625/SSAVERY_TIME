package com.ssafy.ssafytime.api.dto;

import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.db.entity.User;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.TimeZone;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceDto {

    private Long userIdx;

    private Integer attendanceCategory;

    private TimeZone attendanceDate;


    private Set<UserDto> userDtoSet;

    public static AttendanceDto from(Attendance attendance) {
        if(attendance == null) return null;

        return AttendanceDto.builder()
                .userIdx(attendance.getUser().getUserIdx())
                .attendanceCategory(attendance.getId().getAttendanceCategory())
                .attendanceDate(attendance.getId().getAttendanceDate())
                .build();
    }
}
