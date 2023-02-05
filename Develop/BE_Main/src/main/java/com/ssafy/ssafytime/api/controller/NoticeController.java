package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.db.dto.notice.NoticeRequestDto;
import com.ssafy.ssafytime.db.dto.notice.NoticeResponseDto;
import com.ssafy.ssafytime.exception.ResponseHandler;
import com.ssafy.ssafytime.api.service.notice.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class NoticeController {

    @Autowired
    NoticeServiceImpl noticeService;

    @GetMapping("notice")
    public ResponseEntity<Object> notice(@RequestParam("id") Long id) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, noticeService.getNotice(id));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }

    @GetMapping("notice/all")
    public ResponseEntity<Object> noticeAll(){
        List<NoticeResponseDto> menu = noticeService.getAllNotice();
        if (!menu.isEmpty())
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, noticeService.getAllNotice());
        else
            return ResponseHandler.generateResponse(false, "EMPTY", HttpStatus.NOT_FOUND, null);
    }

    @PostMapping(value = "notice/create", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> createNotice(@RequestBody NoticeRequestDto noticeRequestDto) {
        noticeService.save(noticeRequestDto);
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.CREATED, null);
    }
}
