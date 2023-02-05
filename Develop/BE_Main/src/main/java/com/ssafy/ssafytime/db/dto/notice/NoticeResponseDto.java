package com.ssafy.ssafytime.db.dto.notice;

import com.ssafy.ssafytime.db.entity.notice.NoticeEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
public class NoticeResponseDto {
    private Long id;
    private String title;
    private String category;
    private String contentUrl;
    private LocalDateTime createDateTime;

    @Builder
    public NoticeResponseDto(NoticeEntity noticeEntity) {
        this.id = noticeEntity.getId();
        this.title = noticeEntity.getTitle();
        this.category = noticeEntity.getCategory();
        this.contentUrl = noticeEntity.getContentUrl();

        String date = noticeEntity.getCreateDate();
        String time = noticeEntity.getCreateTime();
        int year = Integer.parseInt(date.substring(0, 4));
        int month = Integer.parseInt(date.substring(4, 6));
        int day = Integer.parseInt(date.substring(6, 8));
        int hour = Integer.parseInt(time.substring(0, 2));
        int minute = Integer.parseInt(time.substring(2, 4));
        int second = Integer.parseInt(time.substring(4, 6));
        this.createDateTime = LocalDateTime.of(year, month, day, hour, minute, second);
    }
}
