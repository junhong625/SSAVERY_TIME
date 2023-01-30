package com.ssafy.ssafytime.dto.Notice;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class NoticeRequestDto {
    private String title;
    private String category;
    private String contentUrl;
    private String createDate;
    private String createTime;

    @Builder NoticeRequestDto(String title, String category, String contentUrl, String createDate, String createTime) {
        this.title = title;
        this.category = category;
        this.contentUrl = contentUrl;
        this.createDate = createDate;
        this.createTime = createTime;
    }
    public NoticeEntity toEntity() {
        return NoticeEntity.builder().title(title).category(category).contentUrl(contentUrl).createDate(createDate).createTime(createTime).build();
    }
}
