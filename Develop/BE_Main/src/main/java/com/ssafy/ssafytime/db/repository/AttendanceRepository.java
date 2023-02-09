package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.dto.AttendanceInterface;
import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.db.entity.AttendanceId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AttendanceRepository extends JpaRepository<Attendance, AttendanceId> {

    @Query(value = "select a.attendance_category as category, count(a.attendance_category) as count " +
            "from attendance a " +
            "where a.user_idx = :userIdx and (a.attendance_category = 3 or a.attendance_category = 4) " +
            "group by a.user_idx, a.attendance_category", nativeQuery = true)
    List<AttendanceInterface>findAllAttendance(@Param("userIdx") Long userIdx);


    @Query(value = "select a.attendance_category as category, count(a.attendance_category) as count " +
            "from attendance a " +
            "where a.user_idx = :userIdx and month(now()) = month(a.attendance_date) and (a.attendance_category != 3 and a.attendance_category != 4) " +
            "group by a.user_idx, a.attendance_category", nativeQuery = true)
    List<AttendanceInterface>findMonthAttendance(@Param("userIdx") Long userIdx);



}
