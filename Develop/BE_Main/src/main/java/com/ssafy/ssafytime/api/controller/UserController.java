package com.ssafy.ssafytime.api.controller;

//import com.ssafy.ssafytime.api.dto.AttendanceDto;
//import com.ssafy.ssafytime.api.dto.AttendanceDto;
import com.ssafy.ssafytime.db.dto.FCMTokenDTO;
import com.ssafy.ssafytime.api.service.AlarmDefaultServiceImpl;
import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.api.request.SurveyRegisterPostReq;
import com.ssafy.ssafytime.api.service.UserService;
//import com.ssafy.ssafytime.db.entity.AttendanceId;
import com.ssafy.ssafytime.common.model.response.BaseResponseBody;
import com.ssafy.ssafytime.db.entity.User;
import io.swagger.annotations.ApiParam;
import com.ssafy.ssafytime.exception.ResponseHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Optional;

@RequiredArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final AlarmDefaultServiceImpl alarmService;

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

    @GetMapping("/user/{username}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<UserDto> getUserInfo(@PathVariable String username) {
        return ResponseEntity.ok(userService.getUserWithAuthorities(username));
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

    /* 유저 기본 알람 on/off 상태 조회
    ================================================|| parameter ||=========================================================
    userId : 사용자 학번(user_idx)
    ========================================================================================================================
     */
    @GetMapping("alarm/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> getAlarm(@PathVariable Long userId) {
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, alarmService.getDefaultAlarmSetting(userId));
    }

    /* 유저 공지사항 알림 on/off 변경
    ================================================|| parameter ||=========================================================
    userId : 사용자 학번(user_idx)
    ========================================================================================================================
     */
    @PatchMapping("alarm/notice/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateNotice(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "UPDATE", HttpStatus.OK, null);
    }

    /* 유저 설문조사 알림 on/off 변경
    ================================================|| parameter ||=========================================================
    userId : 사용자 학번(user_idx)
    ========================================================================================================================
     */
    @PatchMapping("alarm/survey/{userId}")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Object> updateSurvey(@PathVariable Long userId) {
        alarmService.noticeChange(userId);
        return ResponseHandler.generateResponse(true, "UPDATE", HttpStatus.OK, null);
    }

    /* 유저 상담 알림 on/off 변경
    ================================================|| parameter ||=========================================================
    userId : 사용자 학번(user_idx)
    ========================================================================================================================
     */
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


