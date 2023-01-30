package com.ssafy.ssafytime.api.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/meet")
public class MeetController {
//    private final UserService userService;
//
//    public UserController(UserService userService) {
//        this.userService = userService;
//    }
//
////    @GetMapping("/hello")
////    public ResponseEntity<String> hello() {
////        return ResponseEntity.ok("hello");
////    }
////
////    @PostMapping("/test-redirect")
////    public void testRedirect(HttpServletResponse response) throws IOException {
////        response.sendRedirect("/api/user");
////    }
////    @GetMapping("/user/{user_name}")
////    @PreAuthorize("hasAnyRole('ADMIN')")
////    public ResponseEntity<UserDto> getUserInfo(@PathVariable String username) {
////        return ResponseEntity.ok(userService.getUserWithAuthorities(username));
////    }
//
//
////    @GetMapping("/attendance")
////    public ResponseEntity<UserDto> attendance(
////            @Valid @RequestBody UserDto userDto
////    ){
////        return ResponseEntity.ok()
////    }
//
//
//    @PostMapping("/signup")
//    public ResponseEntity<UserDto> signup(
//            @Valid @RequestBody UserDto userDto
//    ) {
//        return ResponseEntity.ok(userService.signup(userDto));
//    }
//
//
//    @GetMapping("/user")
//    @PreAuthorize("hasAnyRole('USER','ADMIN')")
//    public ResponseEntity<UserDto> getMyUserInfo(HttpServletRequest request) {
//        return ResponseEntity.ok(userService.getMyUserWithAuthorities());
//    }
}
