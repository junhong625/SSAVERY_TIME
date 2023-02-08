package com.ssafy.ssafytime.db.dto;

import com.ssafy.ssafytime.db.entity.AlarmDefault;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AlarmDefaultResponseDto {
    private Boolean noticeAlarm;
    private Boolean surveyAlarm;
    private Boolean consultingAlarm;

    @Builder
    public AlarmDefaultResponseDto(AlarmDefault alarmDefault) {
        this.noticeAlarm = alarmDefault.getNoticeAlarm();
        this.surveyAlarm = alarmDefault.getSurveyAlarm();
        this.consultingAlarm = alarmDefault.getConsultingAlarm();
    }
}
