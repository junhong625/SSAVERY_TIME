package com.ssafy.ssafytime.db.entity;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "job_info")
public class JobInfoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "start_date")
    private Long startDate;

    @Column(name = "end_date")
    private Long endDate;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "job")
    private String job;

    @Column(name = "link", nullable = true)
    private String link;

    @Builder
    public JobInfoEntity(Long startDate, Long endDate, String companyName, String job, String link) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.companyName = companyName;
        this.job = job;
        this.link = link;
    }
}
