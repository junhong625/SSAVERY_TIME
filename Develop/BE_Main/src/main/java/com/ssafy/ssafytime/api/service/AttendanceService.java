package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.repository.AttendanceRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;

    public AttendanceService(AttendanceRepository attendanceRepository){
        this.attendanceRepository = attendanceRepository;
    }



}
