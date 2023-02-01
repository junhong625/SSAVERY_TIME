package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.db.entity.AttendanceId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AttendanceRepository extends JpaRepository<Attendance, AttendanceId> {


    Optional<Attendance> findOneByUser_UserIdx(Long userIdx);


}
