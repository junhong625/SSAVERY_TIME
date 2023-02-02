package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.dto.schedule.ScheduleResponseDto;
import com.ssafy.ssafytime.service.schedule.ScheduleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

// TODO schedule response 수정 필요
@RestController
public class ScheduleController {

    @Autowired
    ScheduleServiceImpl scheduleService;

    @GetMapping("schedule/now")
    public ResponseEntity<List<ScheduleResponseDto>> todaySchedule(@RequestParam("track_code") int trackCode) {
        return ResponseEntity.ok(scheduleService.getCurrentSchedule(trackCode));
    }

    @GetMapping("schedule/week")
    public ResponseEntity<List<ScheduleResponseDto>> weekSchedule(@RequestParam("track_code") int trackCode) {
        return ResponseEntity.ok(scheduleService.getWeekSchedule(trackCode));
    }
}
