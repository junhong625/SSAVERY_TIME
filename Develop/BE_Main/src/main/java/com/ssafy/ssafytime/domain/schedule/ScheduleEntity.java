package com.ssafy.ssafytime.domain.schedule;

import com.ssafy.ssafytime.domain.cagetory.CategoryEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.checkerframework.checker.units.qual.C;

import javax.persistence.*;

@Getter
@Entity
@NoArgsConstructor
@Table(name = "schedule")
public class ScheduleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "track_code")
    private int trackCode;

    @Column(name = "date")
    private String date;

    @Column(name = "start_time")
    private String startTime;

    @Column(name = "end_time")
    private String endTime;

    @Column(name = "title")
    private String title;

    @Column(name = "sub_title")
    private String subTitle;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity categoryEntity;
}
