package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.exception.ResponseHandler;
import com.ssafy.ssafytime.api.service.schedule.ScheduleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScheduleController {

    @Autowired
    ScheduleServiceImpl scheduleService;

    // required = false로 설정할 경우 해당 parameter가 들어오지 않는다고 해서 오류 발생 X
    // defaultValue = parameter가 들어오지 않을 경우 defaultValue로 대체
    @GetMapping("schedule/now")
    public ResponseEntity<Object> currentSchedule(@RequestParam("track_code") int trackCode, @RequestParam(value="interval", required = false, defaultValue="0") int interval) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, scheduleService.getCurrentSchedule(trackCode, interval));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }

    @GetMapping("schedule/week")
    public ResponseEntity<Object> weekSchedule(@RequestParam("track_code") int trackCode) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, scheduleService.getWeekSchedule(trackCode));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }
}
