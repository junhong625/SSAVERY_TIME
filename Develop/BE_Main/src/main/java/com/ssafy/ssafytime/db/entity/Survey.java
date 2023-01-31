package com.ssafy.ssafytime.db.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class Survey extends BaseTimeEntity {
    @Id
    @Column(name = "survey_idx")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id = null;

    @Column(name = "survey_title")
    String title;
    Integer status;
    @Column(name = "created_at")
    LocalDateTime createdAt;
    @Column(name = "ended_at")
    LocalDateTime endedAt;
    Integer category;
}
