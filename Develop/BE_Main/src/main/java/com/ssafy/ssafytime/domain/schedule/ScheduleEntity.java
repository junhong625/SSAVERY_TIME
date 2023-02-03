package com.ssafy.ssafytime.domain.schedule;

import com.ssafy.ssafytime.domain.cagetory.CategoryEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@Entity
@NoArgsConstructor
@Table(name = "schedule")
public class ScheduleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 0: 모두, 1: 파이선, 2: 자바(비전공), 3: 자바(전공), 4: 임베디드, 5: 모바일
    @Column(name = "track_code")
    private int trackCode;

    @Column(name = "date")
    private int date;

    @Column(name = "start_time")
    private int startTime;

    @Column(name = "end_time")
    private int endTime;

    @Column(name = "title")
    private String title;

    @Column(name = "sub_title")
    private String subTitle;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity categoryEntity;
}
