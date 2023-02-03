package com.ssafy.ssafytime.dto.schedule;

import com.ssafy.ssafytime.domain.schedule.ScheduleEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ScheduleResponseDto {
    private int trackCode;

    private int date;

    private int startTime;

    private int endTime;

    private String title;

    private String subTitle;

    private String category;

    @Builder
    public ScheduleResponseDto(ScheduleEntity scheduleEntity) {
        this.trackCode = scheduleEntity.getTrackCode();
        this.date = scheduleEntity.getDate();
        this.startTime = scheduleEntity.getStartTime();
        this.endTime = scheduleEntity.getEndTime();
        this.title = scheduleEntity.getTitle();
        this.subTitle = scheduleEntity.getSubTitle();
        this.category = scheduleEntity.getCategoryEntity().getCategory();
    }
}
