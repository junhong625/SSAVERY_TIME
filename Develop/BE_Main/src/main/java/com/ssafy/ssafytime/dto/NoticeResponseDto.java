package com.ssafy.ssafytime.dto;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
public class NoticeResponseDto {
    private String title;
    private String category;
    private String contentUrl;
    private String createDate;
    private String createTime;

    @Builder
    NoticeResponseDto(NoticeEntity noticeEntity) {
        this.title = noticeEntity.getTitle();
        this.category = noticeEntity.getCategory();
        this.contentUrl = noticeEntity.getContentUrl();
        this.createDate = noticeEntity.getCreateDate();
        this.createTime = noticeEntity.getCreateTime();
    }
}
