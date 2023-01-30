package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.dto.ReadNotice.ReadNoticeResponseDto;
import com.ssafy.ssafytime.service.ReadNotice.ReadNoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@RestController
public class ReadNoticeController {

    @Autowired
    ReadNoticeServiceImpl readNoticeService;

    @GetMapping("notice/read")
    public List<ReadNoticeResponseDto> notReadNotice(@RequestParam("id") Long id, @RequestParam("is_read") int isRead) throws Exception {
        List<ReadNoticeResponseDto> readNoticeResponseDtoList = readNoticeService.getReadNotice(id, isRead);
        return readNoticeResponseDtoList;
    }
}
