package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.dto.AlarmDefaultRequestDto;
import com.ssafy.ssafytime.db.dto.AlarmDefaultResponseDto;
import org.springframework.stereotype.Service;

public interface AlarmDefaultService {
    AlarmDefaultResponseDto getDefaultAlarmSetting(Long userId);

    void noticeChange(Long userId);

    void surveyChange(Long userId);

    void consultingChange(Long userId);
}
