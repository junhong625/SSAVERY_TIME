package com.ssafy.ssafytime.service.notice;

import com.ssafy.ssafytime.dto.notice.NoticeResponseDto;

import java.util.List;

public interface NoticeService {

    NoticeResponseDto getNotice(Long id) throws Exception;

    List<NoticeResponseDto> getAllNotice();
}
