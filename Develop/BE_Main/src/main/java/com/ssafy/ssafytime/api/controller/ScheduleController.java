package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.dto.schedule.ScheduleResponseDto;
import com.ssafy.ssafytime.service.schedule.ScheduleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ScheduleController {

    @Autowired
    ScheduleServiceImpl scheduleService;

    @GetMapping("schedule/now")
    public List<ScheduleResponseDto> todaySchedule(@RequestParam("track_code") int trackCode) {
        List<ScheduleResponseDto> scheduleResponseDtoList = scheduleService.getCurrentSchedule(trackCode);
        return scheduleResponseDtoList;
    }

    @GetMapping("schedule/week")
    public List<ScheduleResponseDto> weekSchedule(@RequestParam("track_code") int trackCode) {
        List<ScheduleResponseDto> scheduleResponseDtoList = scheduleService.getWeekSchedule(trackCode);
        return scheduleResponseDtoList;
    }
}
