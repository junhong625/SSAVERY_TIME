package com.ssafy.ssafytime.api.service.schedule;

import com.ssafy.ssafytime.db.dto.schedule.ScheduleResponseDto;
import com.ssafy.ssafytime.db.repository.ScheduleRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
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
        int date = Integer.parseInt(dateTime[0].toString().replace("-", ""));
        int time = Integer.parseInt(dateTime[1].replace(":", "").substring(0, 6));

        List<ScheduleResponseDto> scheduleResponseDtoList = new ArrayList<>();
        scheduleRepository.findByTrackCodeAndDateAndStartTimeLessThanAndEndTimeGreaterThan(trackCode, date, time, time).forEach((scheduleEntity -> {
            scheduleResponseDtoList.add(new ScheduleResponseDto(scheduleEntity));
        }));
        return scheduleResponseDtoList;
    }

    @Override
    public List<ScheduleResponseDto> getWeekSchedule(int trackCode) {
        List<ScheduleResponseDto> scheduleResponseDtoList = new ArrayList<>();
        LocalDate date = LocalDate.now();
        int weekDay = date.getDayOfWeek().getValue();
        int startDate = Integer.parseInt(date.minusDays(weekDay).toString().replace("-", ""));
        int endDate = Integer.parseInt(date.plusDays(4).toString().replace("-", ""));
        scheduleRepository.findByTrackCodeAndDateLessThanAndDateGreaterThanOrderByDate(trackCode, endDate, startDate).forEach((scheduleEntity ->
                scheduleResponseDtoList.add(new ScheduleResponseDto(scheduleEntity))));

        return scheduleResponseDtoList;
    }
}
