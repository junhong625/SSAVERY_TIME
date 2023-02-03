package com.ssafy.ssafytime.db.dto.schedule;

import com.ssafy.ssafytime.db.entity.schedule.ScheduleEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ScheduleResponseDto {
    private int date;

    private int startTime;

    private int endTime;

    private String title;

    private String subTitle;

    private String category;

    @Builder
    public ScheduleResponseDto(ScheduleEntity scheduleEntity) {
        this.date = scheduleEntity.getDate();
        this.startTime = scheduleEntity.getStartTime();
        this.endTime = scheduleEntity.getEndTime();
        this.title = scheduleEntity.getTitle();
        this.subTitle = scheduleEntity.getSubTitle();
        this.category = scheduleEntity.getCategoryEntity().getCategory();
    }
}
