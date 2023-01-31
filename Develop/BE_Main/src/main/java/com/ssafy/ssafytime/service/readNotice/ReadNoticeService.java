package com.ssafy.ssafytime.service.readNotice;

import com.ssafy.ssafytime.dto.readNotice.ReadNoticeResponseDto;

import java.util.List;

public interface ReadNoticeService {
    List<ReadNoticeResponseDto> getReadNotice(Long id, int isRead);
}
