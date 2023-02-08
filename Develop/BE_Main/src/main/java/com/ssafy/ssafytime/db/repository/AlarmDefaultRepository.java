package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.AlarmDefault;
import com.ssafy.ssafytime.db.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AlarmDefaultRepository extends JpaRepository<AlarmDefault, Long> {

    List<AlarmDefault> findAllBySurveyAlarm(boolean chk);  // 설문 알림 설정 되어있는 유저들만 반환

    List<AlarmDefault> findAllByConsultingAlarm(boolean chk);

    List<AlarmDefault> findAllByNoticeAlarm(boolean chk);
}
