package com.ssafy.ssafytime.dto.readNotice;

import com.ssafy.ssafytime.domain.notice.ReadNoticeEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReadNoticeResponseDto {
    private int isRead;

    // TODO 유저 데이터 빌더에 추가
    @Builder
    public ReadNoticeResponseDto(ReadNoticeEntity readNoticeEntity) {
        this.isRead = readNoticeEntity.getIsRead();
    }
}
