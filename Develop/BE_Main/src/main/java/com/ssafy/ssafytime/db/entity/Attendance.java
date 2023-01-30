package com.ssafy.ssafytime.db.entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "attendance")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Attendance{

    @Id
    @Column(name = "attendance_category")
    private int attendanceCategory;
}