package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.service.MeetService;
import com.ssafy.ssafytime.db.entity.MeetList;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/meet")
public class MeetController {
    private final MeetService meetService;

    public MeetController(MeetService meetService){
        this.meetService = meetService;
    }

    // 회원번호로 한명의 회원 조회
    @GetMapping(value = "/{userId}/{code}", produces = { MediaType.APPLICATION_JSON_VALUE }) // 요청을 json type의 데이터만 담고 있는 요청 처리
    public ResponseEntity<List<MeetList>> getMember(@PathVariable("userId") Long userId, @PathVariable("code") int code) {

        // 교육생
        if(code==0){
            // Optional : 'null일 수도 있는 객체'를 감싸는 일종의 Wrapper 클래스
            List<MeetList> member = meetService.findByStudentId(userId);
            return new ResponseEntity(member, HttpStatus.OK);
        }
        // 관리자
        else if(code==1){
            // Optional : 'null일 수도 있는 객체'를 감싸는 일종의 Wrapper 클래스
            List<MeetList> member = meetService.findByManagerId(userId);
            return new ResponseEntity(member, HttpStatus.OK);
        }
        return null;
    }

    // 거절사유 등록
    @PutMapping("/update")
    public void putReject(@RequestParam("rez_idx") Long rezIdx, @RequestParam("reject") String reject) {

        MeetList member = meetService.findByRezIdx(rezIdx);
        // 거절상태
        member.setState(3L);
        // 거절사유
        member.setReject(reject);
        meetService.update(member);

    }

}