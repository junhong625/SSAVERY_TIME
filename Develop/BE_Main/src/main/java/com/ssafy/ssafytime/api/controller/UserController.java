package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.dto.AttendanceInterface;
import com.ssafy.ssafytime.api.dto.UserDto;
import com.ssafy.ssafytime.api.service.UserService;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.AttendanceRepository;
import io.swagger.annotations.Api;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

@Api(value = "유저API", tags = {"User"})
@RestController
@RequestMapping("/api/user")
public class UserController {
    private final UserService userService;
    private final AttendanceRepository attendanceRepository;

    public UserController(UserService userService,
                          AttendanceRepository attendanceRepository) {
        this.userService = userService;
        this.attendanceRepository = attendanceRepository;
    }

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

    @GetMapping("/{username}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<UserDto> getUserInfo(@PathVariable String username) {
        return ResponseEntity.ok(userService.getUserWithAuthorities(username));
    }

    @GetMapping("/attendance")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<Collection<AttendanceInterface>> getAttendance(HttpServletRequest request, @AuthenticationPrincipal User user) {

        if(user==null) System.out.println("널인데유");
        else System.out.println(user.getUserIdx());

        Long userIdx = userService.getMyUserWithAuthorities().getUserIdx();

        List<AttendanceInterface> list = attendanceRepository.findAllAttendance(userIdx);
        List<AttendanceInterface> list2 = attendanceRepository.findMonthAttendance(userIdx);

        list.addAll(list2);

        return  ResponseEntity.ok(list);
    }




}


