package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.dto.notice.NoticeResponseDto;
import com.ssafy.ssafytime.service.notice.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class NoticeController {

    @Autowired
    NoticeServiceImpl noticeService;

    @GetMapping("notice")
    public NoticeResponseDto notice(@RequestParam("id") Long id) throws Exception {
        NoticeResponseDto notice = noticeService.getNotice(id);
        return notice;
    }

    @GetMapping("notice/all")
    public List<NoticeResponseDto> noticeAll() {
        List<NoticeResponseDto> notice = noticeService.getAllNotice();
        return notice;
    }
}
