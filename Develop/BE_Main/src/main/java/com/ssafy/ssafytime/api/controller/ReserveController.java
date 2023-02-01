package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.service.MeetService;
import com.ssafy.ssafytime.db.dto.ReserveDto;
import com.ssafy.ssafytime.db.entity.MeetList;
import net.bytebuddy.asm.Advice;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/reserve")
public class ReserveController {

    private final MeetService meetService;
    public ReserveController(MeetService meetService){
        this.meetService = meetService;
    }

    @PostMapping(value = "/{submit}", produces = { MediaType.APPLICATION_JSON_VALUE }) // 요청을 json type의 데이터만 담고 있는 요청 처리
    public void postReserve(@RequestBody ReserveDto reserveDto) {
        meetService.save(reserveDto);
    }

    @GetMapping(value = "/{time}", produces = { MediaType.APPLICATION_JSON_VALUE }) // 요청을 json type의 데이터만 담고 있는 요청 처리
    public ResponseEntity<List<Integer>> getReserveTime(@RequestParam("date") String date, @RequestParam("managerId") long managerId) {

        List<Integer> timeList = meetService.findByRezDateAndManagerId(date, managerId);


        return new ResponseEntity(timeList, HttpStatus.OK);

    }


}
