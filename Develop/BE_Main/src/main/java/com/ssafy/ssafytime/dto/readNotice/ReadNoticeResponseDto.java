package com.ssafy.ssafytime.dto.readNotice;

import com.ssafy.ssafytime.domain.notice.ReadNoticeEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReadNoticeResponseDto {
    private int isRead;
    private Long noticeId;
    private Long userId;

    // TODO 유저 데이터 빌더에 추가
    @Builder
    public ReadNoticeResponseDto(ReadNoticeEntity readNoticeEntity) {
        this.isRead = readNoticeEntity.getIsRead();
        this.noticeId = readNoticeEntity.getNoticeEntity().getId();
        this.userId = readNoticeEntity.getUserEntity().getUserIdx();
    }
}
