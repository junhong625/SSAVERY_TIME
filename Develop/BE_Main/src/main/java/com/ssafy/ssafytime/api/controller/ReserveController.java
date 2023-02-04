package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.service.MeetService;
import com.ssafy.ssafytime.db.dto.ReserveDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/reserve")
public class ReserveController {

    private final MeetService meetService;
    public ReserveController(MeetService meetService){
        this.meetService = meetService;
    }
    @GetMapping(value = "/info", produces = { MediaType.APPLICATION_JSON_VALUE }) // 요청을 json type의 데이터만 담고 있는 요청 처리
    public ResponseEntity<Map<String, Object>> getManagerInfo(@RequestParam("classNum") Integer classNum, @RequestParam("regionCode") Integer regionCode) {
        return new ResponseEntity(meetService.getManagerInfo(classNum, regionCode), HttpStatus.OK);
    }

    @PostMapping(value = "/submit", produces = { MediaType.APPLICATION_JSON_VALUE }) // 요청을 json type의 데이터만 담고 있는 요청 처리
    public void postReserve(@RequestBody ReserveDto reserveDto) {
        meetService.save(reserveDto);
    }

    @GetMapping(value = "/time", produces = { MediaType.APPLICATION_JSON_VALUE }) // 요청을 json type의 데이터만 담고 있는 요청 처리
    public ResponseEntity<Map<String,List<Double>>> getReserveTime(@RequestParam("date") String date, @RequestParam("managerId") long managerId) {

        List<Double> timeList = meetService.findByRezDateAndManagerId(date, managerId);
        Map<String, List> map = new HashMap<>();
        map.put("time", timeList);
        return new ResponseEntity(map, HttpStatus.OK);

    }


}
