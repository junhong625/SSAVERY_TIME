package com.ssafy.ssafytime.service.Notice;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.dto.Notice.NoticeResponseDto;

import java.util.List;
import java.util.Optional;

public interface NoticeService {

    NoticeResponseDto getNotice(Long id) throws Exception;

    List<NoticeResponseDto> getAllNotice();
}
