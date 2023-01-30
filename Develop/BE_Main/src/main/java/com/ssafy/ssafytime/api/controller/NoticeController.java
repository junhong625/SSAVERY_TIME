package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.domain.notice.NoticeEntity;
import com.ssafy.ssafytime.service.NoticeService;
import com.ssafy.ssafytime.service.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class NoticeController {

    @Autowired
    NoticeServiceImpl noticeService;

    @GetMapping("notice")
    public Optional<NoticeEntity> notice(@RequestParam("id") Long id) {
        Optional<NoticeEntity> notice = noticeService.getNotice(id);
        return notice;
    }

    @GetMapping("notice/all")
    public List<NoticeEntity> noticeAll() {
        List<NoticeEntity> notice = noticeService.getAllNotice();
        return notice;
    }
}
