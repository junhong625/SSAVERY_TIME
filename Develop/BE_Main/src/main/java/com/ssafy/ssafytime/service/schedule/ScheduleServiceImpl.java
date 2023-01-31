package com.ssafy.ssafytime.service.schedule;

import com.ssafy.ssafytime.dto.schedule.ScheduleResponseDto;
import com.ssafy.ssafytime.repository.ScheduleRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{

    final ScheduleRepository scheduleRepository;

    @Override
    public List<ScheduleResponseDto> getCurrentSchedule(int trackCode) {
        String[] dateTime = LocalDateTime.now().toString().split("T");
        String date = dateTime[0].toString().replace("-", "");
        int time = Integer.parseInt(dateTime[1].replace(":", "").substring(0, 6));

        System.out.println(date);
        System.out.println(time);
        List<ScheduleResponseDto> scheduleResponseDtoList = new ArrayList<>();
        scheduleRepository.findByTrackCodeAndDateAndStartTimeLessThanAndEndTimeGreaterThan(trackCode, date, time, time).forEach((scheduleEntity -> {
            System.out.println(scheduleEntity);
            scheduleResponseDtoList.add(new ScheduleResponseDto(scheduleEntity));
        }));
        return scheduleResponseDtoList;
    }
}
