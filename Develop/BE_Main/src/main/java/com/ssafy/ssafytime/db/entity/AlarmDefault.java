package com.ssafy.ssafytime.db.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "alarm_default")
public class AlarmDefault {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name="user_id")
    private User userId;

    @Column(name = "notice_alarm")
    @ColumnDefault("true")
    private Boolean noticeAlarm;

    @Column(name = "survey_alarm")
    @ColumnDefault("true")
    private Boolean surveyAlarm;

    @Column(name = "consulting_alarm")
    @ColumnDefault("true")
    private Boolean consultingAlarm;

    @Builder
    public AlarmDefault(Long id, User user, Boolean noticeAlarm, Boolean surveyAlarm, Boolean consultingAlarm) {
        this.id = id;
        this.userId = user;
        this.noticeAlarm = noticeAlarm;
        this.surveyAlarm = surveyAlarm;
        this.consultingAlarm = consultingAlarm;
    }
}
