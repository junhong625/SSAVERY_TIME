package com.ssafy.ssafytime.db.dto.jobInfo;

import com.ssafy.ssafytime.db.entity.JobInfoEntity;
import com.ssafy.ssafytime.db.entity.User;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class JobInfoResponseDto {
    private Long startDate;
    private Long endDate;
    private String companyName;
    private String job;
    private String link;

    @Builder
    public JobInfoResponseDto(JobInfoEntity jobInfo) {
        this.startDate = jobInfo.getStartDate();
        this.endDate = jobInfo.getEndDate();
        this.companyName = jobInfo.getCompanyName();
        this.job = jobInfo.getJob();
        this.link = jobInfo.getLink();
    }
}
