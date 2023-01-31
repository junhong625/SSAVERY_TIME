package com.ssafy.ssafytime.db.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
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

    @Column(name = "state")
    Long state;

    @Column(name = "reject")
    String reject;

    @Column(name = "title")
    String title;

    @Column(name = "category")
    Long category;

}
