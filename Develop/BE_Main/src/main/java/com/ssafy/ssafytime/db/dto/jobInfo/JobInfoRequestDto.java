package com.ssafy.ssafytime.db.dto.jobInfo;

import com.ssafy.ssafytime.db.entity.JobInfoEntity;
import com.ssafy.ssafytime.db.entity.User;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class JobInfoRequestDto {
    private Long startDate;
    private Long endDate;
    private String companyName;
    private String job;
    private String link;

    @Builder
    public JobInfoRequestDto(Long startDate, Long endDate, String companyName, String job, String link) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.companyName = companyName;
        this.job = job;
        this.link = link;
    }

    public JobInfoEntity toEntity() {
        return JobInfoEntity.builder().startDate(startDate).endDate(endDate).companyName(companyName).job(job).link(link).build();
    }
}
