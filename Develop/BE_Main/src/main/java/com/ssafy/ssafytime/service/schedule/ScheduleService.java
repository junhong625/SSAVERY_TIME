package com.ssafy.ssafytime.service.schedule;

import com.ssafy.ssafytime.dto.schedule.ScheduleResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ScheduleService {
    List<ScheduleResponseDto> getCurrentSchedule(int trackCode);
}
