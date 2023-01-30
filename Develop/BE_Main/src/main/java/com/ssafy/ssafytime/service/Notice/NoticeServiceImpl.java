package com.ssafy.ssafytime.service.Notice;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.dto.Notice.NoticeResponseDto;
import com.ssafy.ssafytime.repository.NoticeRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    final NoticeRepository noticeRepository;

    @Override
    public NoticeResponseDto getNotice(Long id) throws Exception {
        Optional<NoticeEntity> notice = noticeRepository.findById(id);
        NoticeEntity noticeEntity = notice.orElseThrow(() -> new Exception("공지사항이 없습니다."));
        return new NoticeResponseDto(noticeEntity);
    }

    @Override
    public List<NoticeResponseDto> getAllNotice() {
        List<NoticeResponseDto> noticeList = new ArrayList<>();
        noticeRepository.findAll().forEach(noticeEntity -> {
            noticeList.add(new NoticeResponseDto(noticeEntity));
        });
        return noticeList;
    }
}
