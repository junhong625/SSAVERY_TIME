package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.dto.notice.NoticeResponseDto;
import com.ssafy.ssafytime.exception.ResponseHandler;
import com.ssafy.ssafytime.service.notice.NoticeServiceImpl;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public ResponseEntity<Object> notice(@RequestParam("id") Long id) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.FOUND, noticeService.getNotice(id));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }

    @GetMapping("notice/all")
    public ResponseEntity<Object> noticeAll(){
        List<NoticeResponseDto> menu = noticeService.getAllNotice();
        if (!menu.isEmpty())
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.FOUND, noticeService.getAllNotice());
        else
            return ResponseHandler.generateResponse(false, "EMPTY", HttpStatus.NOT_FOUND, null);
    }
}
