package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.db.dto.notice.NoticeRequestDto;
import com.ssafy.ssafytime.db.dto.notice.NoticeResponseDto;
import com.ssafy.ssafytime.exception.ResponseHandler;
import com.ssafy.ssafytime.api.service.notice.NoticeServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("notice")
public class NoticeController {

    private final NoticeServiceImpl noticeService;

    @GetMapping("")
    public ResponseEntity<Object> recentNotice() {
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, noticeService.getCurrentNotice());
    }


    /* 단일 공지사항 조회(develop_AJH)
    id : 공지사항 id
     */
    @GetMapping("/{id}")
    public ResponseEntity<Object> notice(@PathVariable Long id) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, noticeService.getNotice(id));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }

    /* 전체 공지사항 조회(develop_AJH)
     */
    @GetMapping("/all")
    public ResponseEntity<Object> noticeAll(){
        List<NoticeResponseDto> notice = noticeService.getAllNotice();
        if (!notice.isEmpty())
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, notice);
        else
            return ResponseHandler.generateResponse(false, "EMPTY", HttpStatus.NOT_FOUND, null);
    }

    /* 공지사항 생성(develop_AJH)
    title : 제목
    category : 분류
    contentUrl : 내용 이미지 URL
     */
    @PostMapping(value = "/create", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> createNotice(@RequestBody NoticeRequestDto noticeRequestDto) {
        noticeService.save(noticeRequestDto);
        return ResponseHandler.generateResponse(true, "CREATED", HttpStatus.CREATED, null);
    }
}
