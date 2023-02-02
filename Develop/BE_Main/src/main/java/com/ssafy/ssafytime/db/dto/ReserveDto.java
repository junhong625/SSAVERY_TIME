package com.ssafy.ssafytime.db.dto;

import com.ssafy.ssafytime.db.entity.MeetList;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
public class ReserveDto {
    private Long studentId;
    private Long managerId;
    private LocalDate rezDate;
    private Long rezTime;
    private String title;
    private Long category;

    @Builder
    public ReserveDto(Long studentId, Long managerId, LocalDate rezDate, Long rezTime, String title, Long category) {
        this.studentId = studentId;
        this.managerId = managerId;
        this.rezDate = rezDate;
        this.rezTime = rezTime;
        this.title = title;
        this.category = category;
    }

    public MeetList toEntity() {
        return MeetList.builder().studentId(studentId).managerId(managerId).rezDate(rezDate).rezTime(rezTime).title(title).category(category).build();
    }
}

