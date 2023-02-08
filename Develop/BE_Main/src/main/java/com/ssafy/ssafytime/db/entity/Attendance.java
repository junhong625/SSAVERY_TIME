package com.ssafy.ssafytime.db.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "attendance")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Attendance{

    @EmbeddedId
    private AttendanceId id;

    @MapsId("userIdx")
    @ManyToOne
    @JoinColumn(name = "user_idx")
    public User user;

}