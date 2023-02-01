package com.ssafy.ssafytime.api.controller;

//import com.ssafy.ssafytime.api.dto.AttendanceDto;
//import com.ssafy.ssafytime.api.dto.AttendanceDto;
import com.ssafy.ssafytime.api.dto.UserDto;
import com.ssafy.ssafytime.api.service.UserService;
//import com.ssafy.ssafytime.db.entity.AttendanceId;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

//    @GetMapping("/hello")
//    public ResponseEntity<String> hello() {
//        return ResponseEntity.ok("hello");
//    }
//
//    @PostMapping("/test-redirect")
//    public void testRedirect(HttpServletResponse response) throws IOException {
//        response.sendRedirect("/api/user");
//    }

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


