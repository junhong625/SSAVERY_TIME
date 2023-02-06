package com.ssafy.ssafytime.api.service.notice;

import com.ssafy.ssafytime.db.dto.notice.NoticeRequestDto;
import com.ssafy.ssafytime.db.entity.notice.NoticeEntity;
import com.ssafy.ssafytime.db.dto.notice.NoticeResponseDto;
import com.ssafy.ssafytime.db.repository.NoticeRepository;
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
    public NoticeResponseDto getNotice(Long id){
        Optional<NoticeEntity> notice = noticeRepository.findById(id);
        NoticeEntity noticeEntity = notice.get();
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

    @Override
    public void save(NoticeRequestDto noticeRequestDto) {
        noticeRepository.save(noticeRequestDto.toEntity());
    }
}
