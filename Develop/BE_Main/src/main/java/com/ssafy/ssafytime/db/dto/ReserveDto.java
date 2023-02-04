package com.ssafy.ssafytime.db.dto;

import com.ssafy.ssafytime.db.entity.MeetList;
import com.ssafy.ssafytime.db.entity.User;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
public class ReserveDto {
    private User studentId;
    private User managerId;
    private LocalDate rezDate;
    private Double rezTime; // 11:30 이런 식으로 들어올 거임 ( 돌려줄 땐 11.5 로 넘겨주자)
    private String title;
    private String category;

    @Builder
    public ReserveDto(User studentId, User managerId, LocalDate rezDate, String rezTime, String title, String category) {
        this.studentId = studentId;
        this.managerId = managerId;
        this.rezDate = rezDate;
        String[] timeSplit = rezTime.split(":");
        this.rezTime = Double.parseDouble(timeSplit[0]) + ((Double.parseDouble(timeSplit[1]) / 6) * 0.1);
        this.title = title;
        this.category = category;
    }

    public MeetList toEntity() {

        return MeetList.builder().studentId(studentId).managerId(managerId).rezDate(rezDate).rezTime(rezTime).title(title).category(category).build();
    }
}

