package com.ssafy.ssafytime.db.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.TimeZone;

@Embeddable
@EqualsAndHashCode
@Getter
public class AttendanceId implements Serializable {

    private Long userIdx;

    @Column(name = "attendance_category")
    private int attendanceCategory;

    @Column(name = "attendance_date")
    private TimeZone attendanceDate;

}
