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

    @GetMapping("schedule/now")
    public ResponseEntity<Object> todaySchedule(@RequestParam("track_code") int trackCode) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.FOUND, scheduleService.getCurrentSchedule(trackCode));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }

    @GetMapping("schedule/week")
    public ResponseEntity<Object> weekSchedule(@RequestParam("track_code") int trackCode) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.FOUND, scheduleService.getWeekSchedule(trackCode));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.NOT_FOUND, null);
        }
    }
}
