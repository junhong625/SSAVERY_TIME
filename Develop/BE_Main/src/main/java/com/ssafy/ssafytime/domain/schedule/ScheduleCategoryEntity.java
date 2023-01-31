package com.ssafy.ssafytime.domain.schedule;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "schedule_category")
public class ScheduleCategoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 1: 코딩과정, 2: 알고리즘, 3: 프로젝트, 4: 기타
    @Column(name = "category")
    private String category;
}
