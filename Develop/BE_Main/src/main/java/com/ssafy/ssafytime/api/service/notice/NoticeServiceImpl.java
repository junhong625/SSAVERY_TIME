package com.ssafy.ssafytime.api.service.notice;

import com.ssafy.ssafytime.db.dto.notice.NoticeRequestDto;
import com.ssafy.ssafytime.db.entity.notice.NoticeEntity;
import com.ssafy.ssafytime.db.dto.notice.NoticeResponseDto;
import com.ssafy.ssafytime.db.repository.NoticeRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

    final NoticeRepository noticeRepository;

    @Override
    public NoticeResponseDto getCurrentNotice() {
        List<NoticeEntity> notice = noticeRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));
        return new NoticeResponseDto(notice.get(0));
    }

    @Override
    public NoticeResponseDto getNotice(Long id){
        Optional<NoticeEntity> notice = noticeRepository.findById(id);
        return new NoticeResponseDto(notice.get());
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
        String[] dateTime = LocalDateTime.now().toString().split("T");
        noticeRequestDto.setCreateDate(dateTime[0].replace("-", ""));
        noticeRequestDto.setCreateTime(dateTime[1].replace(":", "").substring(0, 6));
        System.out.println(noticeRequestDto.getCreateDate());
        System.out.println(noticeRequestDto.getCreateTime());
        noticeRepository.save(noticeRequestDto.toEntity());
    }
}
