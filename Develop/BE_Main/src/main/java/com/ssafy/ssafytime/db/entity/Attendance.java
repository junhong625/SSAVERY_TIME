package com.ssafy.ssafytime.db.entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "attendance")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@PrimaryKeyJoinColumn()
public class Attendance extends User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_idx")
    private Long userIdx;

    @Column(name = "attendance_category")
    private int attendanceCategory;

    @Column(name = "attendance_date")
    private LocalDateTime attendanceDate;

    @Column(name = "attendance_time")
    private LocalDateTime attendanceTime;






}