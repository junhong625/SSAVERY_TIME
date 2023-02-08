//package com.ssafy.ssafytime.db.dto.readNotice;
//
//import com.ssafy.ssafytime.db.entity.notice.ReadNoticeEntity;
//import lombok.Builder;
//import lombok.Getter;
//import lombok.ToString;
//
//@Getter
//@ToString
//public class ReadNoticeResponseDto {
//    private int isRead;
//    private Long noticeId;
//    private Long userId;
//
//    @Builder
//    public ReadNoticeResponseDto(ReadNoticeEntity readNoticeEntity) {
//        this.isRead = readNoticeEntity.getIsRead();
//        this.noticeId = readNoticeEntity.getNoticeEntity().getId();
//        this.userId = readNoticeEntity.getUserEntity().getUserIdx();
//    }
//}
