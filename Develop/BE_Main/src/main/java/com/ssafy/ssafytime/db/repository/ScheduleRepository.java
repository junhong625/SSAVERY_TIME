package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.schedule.ScheduleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduleRepository extends JpaRepository<ScheduleEntity, Long> {
    List<ScheduleEntity> findByTrackCodeAndDateAndStartTimeLessThanAndEndTimeGreaterThan(int trackCode, int date, int startTime, int endTime);

    List<ScheduleEntity> findByTrackCodeAndDateOrderByStartTime(int trackCode, int date);
}
