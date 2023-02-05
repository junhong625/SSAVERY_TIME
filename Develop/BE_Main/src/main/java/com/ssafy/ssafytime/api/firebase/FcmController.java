//package com.ssafy.ssafytime.api.firebase;
//
//import com.ssafy.ssafytime.api.dto.UserDto;
//import com.ssafy.ssafytime.api.service.UserService;
//import com.ssafy.ssafytime.common.model.response.BaseResponseBody;
//import com.ssafy.ssafytime.db.entity.SurveyConduct;
//import com.ssafy.ssafytime.db.entity.User;
//import com.ssafy.ssafytime.db.repository.UserRepository;
//import io.swagger.annotations.ApiOperation;
//import io.swagger.annotations.ApiResponse;
//import io.swagger.annotations.ApiResponses;
//import lombok.RequiredArgsConstructor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.Authentication;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RestController;
//import springfox.documentation.annotations.ApiIgnore;
//
//import java.io.IOException;
//import java.util.Optional;
//
//@RestController
//@RequiredArgsConstructor
//public class FcmController {
//
//    private final firebaseCloudMessageService firebaseCloudMessageService;
//
//    @Autowired
//    UserService userService;
//
//    @Autowired
//    UserRepository userRepository;
//
////    @PostMapping("/api/fcm")
////    @ApiOperation(value = "FCM 토큰 ", notes = "<strong>FCM 토큰</strong>")
////    @ApiResponses({
////            @ApiResponse(code = 200, message = "성공"),
////            @ApiResponse(code = 204, message = "No Content"),
////            @ApiResponse(code = 400, message = "Bad Request"),
////            @ApiResponse(code = 401, message = "인증 실패"),
////            @ApiResponse(code = 404, message = "사용자 없음"),
////            @ApiResponse(code = 500, message = "서버 오류")
////    })
////    public ResponseEntity pushMessage(@RequestBody TokenDTO tokenDTO, @ApiIgnore Authentication authentication) throws IOException {
////
////        String token = tokenDTO.getTargetToken();  // 받아온 토큰!!
////
////        // 로그인되지않은 유저라면 에러보냄
////        if(authentication == null) {
////            return ResponseEntity.status(400).body(BaseResponseBody.of(400, "BadRequest"));
////        }
////        UserDto userDto = userService.getMyUserWithAuthorities();  // JWT토큰 이용해서 유저정보 가져옴
////
////        // 현재 로그인된 사용자의 토큰이 없거나 또는 업데이트됐다면 유저테이블에 토큰 저장
////        if(userDto.getToken() == null ||  !userDto.getToken().equals(tokenDTO.getTargetToken())) {
////            Optional<User> user = userService.findById(userDto.getId());
////            user.get().setToken(token);  // 토큰 저장
////            userRepository.save(user.get());  // optional에서 entity로 바꾸어서 저장해야함.
////        }
////
//////        System.out.println(requestDTO.getTargetToken() + " "
//////                +requestDTO.getTitle() + " " + requestDTO.getBody());
////
////        firebaseCloudMessageService.sendMessageTo(
////                token,
////                requestDTO.getTitle(),  // 요청DTO로 받지말고 Back단에서 설정하기
////                requestDTO.getBody());  // ``
////        return ResponseEntity.ok().build();
////    }
//}