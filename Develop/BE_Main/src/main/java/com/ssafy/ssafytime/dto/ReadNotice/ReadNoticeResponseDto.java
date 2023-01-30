package com.ssafy.ssafytime.dto.ReadNotice;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.domain.notice.ReadNoticeEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReadNoticeResponseDto {
    private NoticeEntity notice;
    private int isRead;

    @Builder
    public ReadNoticeResponseDto(ReadNoticeEntity readNoticeEntity) {
        this.notice = readNoticeEntity.getNoticeEntity();
        this.isRead = readNoticeEntity.getIsRead();
    }
}
