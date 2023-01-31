package com.ssafy.ssafytime.service.readNotice;

import com.ssafy.ssafytime.dto.readNotice.ReadNoticeResponseDto;

import java.util.List;

public interface ReadNoticeService {
    List<ReadNoticeResponseDto> getAllUnreadNotice(Long id, int isRead);
    List<ReadNoticeResponseDto> getUnreadNotice(Long uid, int isRead);
}
