package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttendanceRepository extends JpaRepository<Attendance, Long> {


}
