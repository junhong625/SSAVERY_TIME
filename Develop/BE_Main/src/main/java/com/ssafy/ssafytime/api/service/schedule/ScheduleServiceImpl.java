package com.ssafy.ssafytime.api.service.schedule;

import com.ssafy.ssafytime.db.dto.schedule.ScheduleResponseDto;
import com.ssafy.ssafytime.db.repository.ScheduleRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
@Slf4j
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{

    final ScheduleRepository scheduleRepository;

    @Override
    public ScheduleResponseDto getCurrentSchedule(int trackCode) {
        String[] dateTime = LocalDateTime.now().toString().split("T");
        int date = Integer.parseInt(dateTime[0].toString().replace("-", ""));
        int time = Integer.parseInt(dateTime[1].replace(":", "").substring(0, 2));
        System.out.println(date + ":" + time);
        return new ScheduleResponseDto(scheduleRepository.findByTrackCodeAndDateAndStartTimeLessThanEqualAndEndTimeGreaterThan(trackCode, date, time, time));
    }

    @Override
    public HashMap<Integer, List<ScheduleResponseDto>> getWeekSchedule(int trackCode) {
        LocalDate date = LocalDate.now();
        int weekDay = date.getDayOfWeek().getValue();
        if (weekDay >= 6) {
            date = date.plusDays(8 - weekDay);
        } else {
            date = date.minusDays(weekDay - 1);
        }
        HashMap<Integer, List<ScheduleResponseDto>> weekScheduleList = new HashMap<>();
        for (int d=0; d < 5; d++) {
            int dateToInt = Integer.parseInt(date.toString().replace("-", ""));
            List<ScheduleResponseDto> scheduleResponseDtoList = new ArrayList<>();
            scheduleRepository.findByTrackCodeAndDateOrderByStartTime(trackCode, dateToInt).forEach(
                    (scheduleEntity -> {
                        scheduleResponseDtoList.add(new ScheduleResponseDto(scheduleEntity));
                    })
            );
            weekScheduleList.put(d, scheduleResponseDtoList);
            date = date.plusDays(1);
        }
        return weekScheduleList;
    }
}
