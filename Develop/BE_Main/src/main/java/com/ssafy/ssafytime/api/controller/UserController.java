package com.ssafy.ssafytime.api.controller;

//import com.ssafy.ssafytime.db.dto.AttendanceDto;
//import com.ssafy.ssafytime.db.dto.AttendanceDto;
import com.ssafy.ssafytime.api.service.AlarmDefaultServiceImpl;
import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.api.service.UserService;
//import com.ssafy.ssafytime.db.entity.AttendanceId;
import com.ssafy.ssafytime.exception.ResponseHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final AlarmDefaultServiceImpl alarmService;

    @PostMapping("/signup")
    public ResponseEntity<UserDto> signup(
            @Valid @RequestBody UserDto userDto
    ) {
        return ResponseEntity.ok(userService.signup(userDto));
    }

    @GetMapping("/my-page")
    @PreAuthorize("hasAnyRole('USER','ADMIN')")
    public ResponseEntity<UserDto> getMyUserInfo(HttpServletRequest request) {
        return ResponseEntity.ok(userService.getMyUserWithAuthorities());
    }

    @GetMapping("/user/{username}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<UserDto> getUserInfo(@PathVariable String username) {
        return ResponseEntity.ok(userService.getUserWithAuthorities(username));
    }

    @GetMapping("alarm/default/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> getAlarmSettings(@PathVariable Long userId) {
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, alarmService.getDefaultAlarmSetting(userId));
    }

    @PutMapping("alarm/notice/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateNotice(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, null);
    }

    @PutMapping("alarm/survey/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateSurvey(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, null);
    }

    @PutMapping("alarm/consulting/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateConsulting(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, null);
    }


//    @GetMapping("/attendance")
//    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
//    public ResponseEntity<AttendanceDto> getAttendance(HttpServletRequest request) {
//        Long userIdx = userService.getMyUserWithAuthorities().getUserIdx();
//        System.out.println(userIdx);
//
//        System.out.println("-----------------------여기까지는 됨---------------------");
//        return ResponseEntity.ok(userService.getAttendances(userIdx));
//    }
}


