package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.db.dto.FCMTokenDTO;
import com.ssafy.ssafytime.api.service.AlarmDefaultServiceImpl;
import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.api.request.SurveyRegisterPostReq;
import com.ssafy.ssafytime.api.service.UserService;
import com.ssafy.ssafytime.common.model.response.BaseResponseBody;
import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.db.entity.User;
import io.swagger.annotations.ApiParam;
import com.ssafy.ssafytime.exception.ResponseHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import com.ssafy.ssafytime.api.dto.AttendanceInterface;
import com.ssafy.ssafytime.db.repository.AttendanceRepository;
import io.swagger.annotations.Api;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final AlarmDefaultServiceImpl alarmService;
    private final AttendanceRepository attendanceRepository;

    public UserController(UserService userService,
                          AttendanceRepository attendanceRepository) {
        this.userService = userService;
        this.attendanceRepository = attendanceRepository;
    }

    @PostMapping("/signup")
    public ResponseEntity<Object> signup(
            @Valid @RequestBody UserDto userDto
    ) {
        UserDto user = userService.signup(userDto);
        alarmService.save(user.getId());
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, null);
    }

    @GetMapping("/my-page")
    @PreAuthorize("hasAnyRole('USER','ADMIN')")
    public ResponseEntity<UserDto> getMyUserInfo(HttpServletRequest request) {
        return ResponseEntity.ok(userService.getMyUserWithAuthorities());
    }

    @GetMapping("/{username}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<UserDto> getUserInfo(@PathVariable String username) {
        return ResponseEntity.ok(userService.getUserWithAuthorities(username));
    }

    @GetMapping("/attendance")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Map<String, Object>> getAttendance(HttpServletRequest request, @AuthenticationPrincipal User user) {

        if(user==null) System.out.println("널인데유");
        else System.out.println(user.getUserIdx());

        Long userIdx = userService.getMyUserWithAuthorities().getId();

        List<AttendanceInterface> list = attendanceRepository.findAllAttendance(userIdx);
        List<AttendanceInterface> list2 = attendanceRepository.findMonthAttendance(userIdx);

        list.addAll(list2);

        Map<String, Object> result = new HashMap<>();
        result.put("attendance", list);

        return  ResponseEntity.ok().body(result);
    }




    @PostMapping("/alarm")
    public ResponseEntity<? extends BaseResponseBody> saveFCMToken(@RequestBody @ApiParam(value="FCM 토큰", required = true) FCMTokenDTO fcmTokenDTO, @ApiIgnore Authentication authentication) {
        UserDto userDto = userService.getMyUserWithAuthorities();  // jwt 토큰을 통해 DTO불러옴
        Optional<User> user = userService.findById(userDto.getId());  // DTO 통해 User 엔티티 불러옴
        if (user.isPresent()) {  // 유저가 존재한다면
            if (userDto.getToken() == "1" || userDto.getToken() != fcmTokenDTO.getFCMToken()) {  // 해당 사용자가 FCM 토큰이 없다면
                System.out.println(fcmTokenDTO.getFCMToken());
                user.get().setToken(fcmTokenDTO.getFCMToken());  // 토큰 설정해서
                userService.save(user);  // 저장
            }
            return ResponseEntity.ok().body(BaseResponseBody.of(200, "Success"));
        } else {
            return ResponseEntity.ok().body(BaseResponseBody.of(401, "no user"));
        }
    }

    @GetMapping("alarm/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> getAlarm(@PathVariable Long userId) {
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, alarmService.getDefaultAlarmSetting(userId));
    }

    @PatchMapping("alarm/notice/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateNotice(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "UPDATE", HttpStatus.OK, null);
    }

    @PatchMapping("alarm/survey/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateSurvey(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "UPDATE", HttpStatus.OK, null);
    }

    @PatchMapping("alarm/consulting/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateConsulting(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "UPDATE", HttpStatus.OK, null);
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


