package com.ssafy.ssafytime.api.service;

import com.google.firebase.messaging.*;
import com.ssafy.ssafytime.api.firebase.MessageDTO;
import com.ssafy.ssafytime.db.dto.AlarmDefaultRequestDto;
import com.ssafy.ssafytime.db.dto.AlarmDefaultResponseDto;
import com.ssafy.ssafytime.db.entity.AlarmDefault;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.AlarmDefaultRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class AlarmDefaultServiceImpl implements AlarmDefaultService{

    final UserRepository userRepository;
    final AlarmDefaultRepository alarmDefaultRepository;

    @Override
    public AlarmDefaultResponseDto getDefaultAlarmSetting(Long userId) {
        Optional<AlarmDefault> userAlarmSettings = alarmDefaultRepository.findById(userId);
        return new AlarmDefaultResponseDto(userAlarmSettings.get());
    }

    public List<String> getUserTokens(int chk, MessageDTO messageDTO) {
        List<String> registrationTokens = new ArrayList<>();  // 알림 보낼 토큰들
        List<AlarmDefaultResponseDto> alarmList = new ArrayList<>();
        switch(chk) {
            case 1:  // 설문
                alarmList = this.findAllBySurveyAlarm(true);  // 설문 설정해놓은 알람들 DTO 리스트 가져옴
            case 2:
                alarmList = this.findAllByNoticeAlarm(true);  // 공지 설정해놓은 알람들 DTO 리스트 가져옴
            case 3:
                alarmList = this.findAllByConsultingAlarm(true);  // 상담 설정해놓은 알람들 DTO 리스트 가져옴
            default:
                break;

        }

        List<User> users = new ArrayList<>();  // 관리자가 아니면서 알림설정해놓은(alarm=0) 유저들 가져오는 리스트
        for(int i = 0; i < alarmList.size(); i++) {  // alarmDto로 받아온 리스트를
            users.add(alarmList.get(i).getUser());  // 유저로 바꿔서 리스트에 넣음
        }
        for(int i = 0; i < users.size(); i++) {  // 유저리스트에서
            registrationTokens.add(users.get(i).getToken());  // 토큰들 추출
        }
        return registrationTokens;
    }

    @Override
    public Integer sendMultiAlarms(Notification notification, List<String> registrationTokens) throws FirebaseMessagingException {
        MulticastMessage message = MulticastMessage.builder()  // 다수에게 보내기 위한 메세지 생성
                .setNotification(notification)  // 꼭 넣어주기...
                .putData("title", "hi")
                .putData("content", "hi")
                .addAllTokens(registrationTokens)
                .build();
        BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);  // 결과 리턴

        if (response.getFailureCount() > 0) {
            List<SendResponse> responses = response.getResponses();
            List<String> failedTokens = new ArrayList<>();
            for (int i = 0; i < responses.size(); i++) {
                if (!responses.get(i).isSuccessful()) {
                    // The order of responses corresponds to the order of the registration tokens.
                    failedTokens.add(registrationTokens.get(i));
                }
            }
        }
        return response.getFailureCount();  // 실패한 토큰 수
    }


    @Override
    public List<AlarmDefaultResponseDto> findAllBySurveyAlarm(boolean chk) {  // 상담 알림 켜놓은 사람들의 DTO리스트 반환
        List<AlarmDefault> userFromAlarm = alarmDefaultRepository.findAllBySurveyAlarm(chk);
        List<AlarmDefaultResponseDto> list = new ArrayList<>();
        for(int i = 0; i < userFromAlarm.size(); i++) {
            list.add(new AlarmDefaultResponseDto(userFromAlarm.get(i)));
        }
        return list;
    }

    public List<AlarmDefaultResponseDto> findAllByConsultingAlarm(boolean chk) {  // 상담 알림 켜놓은 사람들의 DTO리스트 반환
        List<AlarmDefault> userFromAlarm = alarmDefaultRepository.findAllByConsultingAlarm(chk);
        List<AlarmDefaultResponseDto> list = new ArrayList<>();
        for(int i = 0; i < userFromAlarm.size(); i++) {
            list.add(new AlarmDefaultResponseDto(userFromAlarm.get(i)));
        }
        return list;
    }

    public List<AlarmDefaultResponseDto> findAllByNoticeAlarm(boolean chk) {  // 공지사항 알림 켜놓은 사람들의 DTO리스트 반환
        List<AlarmDefault> userFromAlarm = alarmDefaultRepository.findAllByNoticeAlarm(chk);
        List<AlarmDefaultResponseDto> list = new ArrayList<>();
        for(int i = 0; i < userFromAlarm.size(); i++) {
            list.add(new AlarmDefaultResponseDto(userFromAlarm.get(i)));
        }
        return list;
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

    @Override
    public void save(Long userId) {
        AlarmDefaultRequestDto alarmDefaultRequestDto = new AlarmDefaultRequestDto();
        alarmDefaultRequestDto.setUser(userRepository.findById(userId).get());
        alarmDefaultRepository.save(alarmDefaultRequestDto.toEntity());
    }
}
