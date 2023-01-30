package com.ssafy.ssafytime.service;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;

import java.util.List;
import java.util.Optional;

public interface NoticeService {

    Optional<NoticeEntity> getNotice(Long id);

    List<NoticeEntity> getAllNotice();
}
