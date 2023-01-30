package com.ssafy.ssafytime.service;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.repository.NoticeRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    final NoticeRepository noticeRepository;

    @Override
    public Optional<NoticeEntity> getNotice(Long id) {
        return noticeRepository.findById(id);
    }

    @Override
    public List<NoticeEntity> getAllNotice() {
        return noticeRepository.findAll();
    }
}
