package com.ssafy.ssafytime.service.ReadNotice;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.domain.notice.ReadNoticeEntity;
import com.ssafy.ssafytime.dto.ReadNotice.ReadNoticeResponseDto;

import java.math.BigInteger;
import java.util.List;

public interface ReadNoticeService {
    List<ReadNoticeResponseDto> getReadNotice(Long id, int isRead);
}
