package com.ssafy.ssafytime.api.service.schedule;

import com.ssafy.ssafytime.db.dto.schedule.ScheduleResponseDto;

import java.util.HashMap;
import java.util.List;

public interface ScheduleService {
    ScheduleResponseDto getCurrentSchedule(int trackCode);

    HashMap<Integer, List<ScheduleResponseDto>> getWeekSchedule(int trackCode);
}
