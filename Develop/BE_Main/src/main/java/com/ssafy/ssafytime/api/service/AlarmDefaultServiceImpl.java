package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.dto.AlarmDefaultRequestDto;
import com.ssafy.ssafytime.db.dto.AlarmDefaultResponseDto;
import com.ssafy.ssafytime.db.entity.AlarmDefault;
import com.ssafy.ssafytime.db.repository.AlarmDefaultRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@RequiredArgsConstructor
@Service
public class AlarmDefaultServiceImpl implements AlarmDefaultService{

    final AlarmDefaultRepository alarmDefaultRepository;

    @Override
    public AlarmDefaultResponseDto getDefaultAlarmSetting(Long userId) {
        Optional<AlarmDefault> userAlarmSettings = alarmDefaultRepository.findById(userId);
        return new AlarmDefaultResponseDto(userAlarmSettings.get());
    }

    @Override
    public void noticeChange(Long userId) {
        Optional<AlarmDefault> userAlarmSettings = alarmDefaultRepository.findById(userId);
        AlarmDefault alarmDefault = userAlarmSettings.get();
        System.out.println(alarmDefault.getNoticeAlarm());
        System.out.println(!alarmDefault.getNoticeAlarm());
        AlarmDefaultRequestDto alarmDefaultRequestDto= new AlarmDefaultRequestDto(alarmDefault.getId(), alarmDefault.getUserId(), !alarmDefault.getNoticeAlarm(), alarmDefault.getSurveyAlarm(), alarmDefault.getConsultingAlarm());
        alarmDefaultRepository.save(alarmDefaultRequestDto.toEntity());
    }

    @Override
    public void surveyChange(Long userId) {
        Optional<AlarmDefault> userAlarmSettings = alarmDefaultRepository.findById(userId);
        AlarmDefault alarmDefault = userAlarmSettings.get();
        AlarmDefaultRequestDto alarmDefaultRequestDto= new AlarmDefaultRequestDto(alarmDefault.getId(), alarmDefault.getUserId(), alarmDefault.getNoticeAlarm(), !alarmDefault.getSurveyAlarm(), alarmDefault.getConsultingAlarm());
        alarmDefaultRepository.save(alarmDefaultRequestDto.toEntity());
    }

    @Override
    public void consultingChange(Long userId) {
        Optional<AlarmDefault> userAlarmSettings = alarmDefaultRepository.findById(userId);
        AlarmDefault alarmDefault = userAlarmSettings.get();
        AlarmDefaultRequestDto alarmDefaultRequestDto= new AlarmDefaultRequestDto(alarmDefault.getId(), alarmDefault.getUserId(), !alarmDefault.getNoticeAlarm(), alarmDefault.getSurveyAlarm(), !alarmDefault.getConsultingAlarm());
        alarmDefaultRepository.save(alarmDefaultRequestDto.toEntity());
    }
}
