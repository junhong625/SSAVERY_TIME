package com.ssafy.ssafytime.db.entity;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@DynamicInsert // insert시 null인 column 제외
public class MeetList {
    @Id
    @Column(name = "rez_idx")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long rezIdx = null;

    @Column(name = "manager_id")
    Long managerId;

    @Column(name = "student_id")
    Long studentId;

    @Column(name = "rez_date")
    LocalDate rezDate;

    @Column(name = "rez_time")
    Long rezTime;
    @ColumnDefault("1") //default 1
    @Column(name = "state")
    Long state;

    @Column(name = "reject")
    String reject;

    @Column(name = "title")
    String title;

    @Column(name = "category")
    Long category;

    @Column(name = "meet_url")
    String meetUrl;

}
