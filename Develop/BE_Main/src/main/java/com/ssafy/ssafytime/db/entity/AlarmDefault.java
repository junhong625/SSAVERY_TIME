package com.ssafy.ssafytime.db.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "alarm_default")
public class DefaultAlarmToggleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @Column(name="user_id")
    private User userId;

    @Column(name = "notice_alarm")
    private Boolean noticeAlarm;

    @Column(name = "survey_alarm")
    private Boolean surveyAlarm;

    @Column(name = "consulting_alarm")
    private Boolean consultingAlarm;
}
