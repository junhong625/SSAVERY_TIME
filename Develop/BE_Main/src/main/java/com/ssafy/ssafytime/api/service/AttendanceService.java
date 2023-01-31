package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.api.dto.UserDto;
import com.ssafy.ssafytime.db.repository.AttendanceRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import com.ssafy.ssafytime.exception.NotFoundUserException;
import com.ssafy.ssafytime.util.SecurityUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AttendanceService {

//    private final AttendanceRepository attendanceRepository;
//    private final
//
//    public AttendanceService(AttendanceRepository attendanceRepository){
//        this.attendanceRepository = attendanceRepository;
//    }


//    @Transactional(readOnly = true)
//    public UserDto getMyUserWithAuthorities() {
//        return UserDto.from(
//                SecurityUtil.getCurrentUsername()
//                        .flatMap(userRepository::findOneWithAuthoritiesByUserEmail)
//                        .orElseThrow(() -> new NotFoundUserException("User not found"))
//        );
//    }



}
