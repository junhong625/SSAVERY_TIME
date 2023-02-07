package com.ssafy.ssafytime.api.firebase;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.*;
import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.api.service.UserService;
import com.ssafy.ssafytime.common.model.response.BaseResponseBody;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.UserRepository;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import lombok.Value;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.kurento.jsonrpc.client.JsonRpcClient.log;

@RestController
@RequiredArgsConstructor
public class FcmController {


    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    private final FirebaseCloudMessageService firebaseCloudMessageService;

    private final String API_URL = "https://fcm.googleapis.com/v1/projects/ssafytime/messages:send";



    @PostMapping("/fcm")
    public ResponseEntity pushMessage(@RequestBody MessageDTO messageDTO) throws IOException, FirebaseMessagingException{
//        System.out.println(requestDTO.getTargetToken() + " "
//                +requestDTO.getTitle() + " " + requestDTO.getBody());

        UserDto userDto = userService.getMyUserWithAuthorities();  // JWT토큰 이용해서 유저정보 가져옴
//        List<User> user = userService.findByIsAdminAndAlarm(1, 0);

        String registrationTokens = userDto.getToken();
//                = new ArrayList<>();  // 알림 전송할 토큰들 담은 리스트

//        for(int i = 0; i < 1; i++) {  // 유저리스트에서
////            registrationTokens.add(user.get(i).getToken());  // 토큰들 추출
//            registrationTokens = user.get(i).getToken();
//        }
//        for(int i = 0; i < registrationTokens.size(); i++)
//            System.out.println(registrationTokens.get(i));


        firebaseCloudMessageService.sendMessageTo(
                registrationTokens,
                messageDTO.getTitle(),
                messageDTO.getBody());
        return ResponseEntity.ok().build();
    }

    @PostMapping("/api/fcm")
    @ApiOperation(value = "FCM 알림보내기", notes = "<strong>FCM 알림보내기</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 400, message = "Bad Request"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity pushMessage(@RequestBody MessageDTO messageDTO, @ApiIgnore Authentication authentication) throws IOException, FirebaseMessagingException {
        // 로그인되지않은 유저라면 에러보냄
        if(authentication == null) {
            return ResponseEntity.status(400).body(BaseResponseBody.of(400, "BadRequest"));
        }
        UserDto userDto = userService.getMyUserWithAuthorities();  // JWT토큰 이용해서 유저정보 가져옴

        List<String> registrationTokens = new ArrayList<>();  // 알림 전송할 토큰들 담은 리스트
        List<User> users = new ArrayList<>();  // 관리자가 아니면서 알림설정해놓은(alarm=0) 유저들 가져오는 리스트
        users = userService.findByIsAdminAndAlarm(1, 0);
        for(int i = 0; i < users.size(); i++) {  // 유저리스트에서
            registrationTokens.add(users.get(i).getToken());  // 토큰들 추출
        }

        MulticastMessage message = MulticastMessage.builder()  // 다수에게 보내기 위한 메세지 생성
                .putData("title", messageDTO.getTitle())
                .putData("content", messageDTO.getBody())
                .addAllTokens(registrationTokens)
                .build();

//        BatchResponse response =
        FirebaseMessaging.getInstance().sendMulticastAsync(message);

//        if (response.getFailureCount() > 0) {
//            List<SendResponse> responses = response.getResponses();
//            List<String> failedTokens = new ArrayList<>();
//            for (int i = 0; i < responses.size(); i++) {
//                if (!responses.get(i).isSuccessful()) {
//                    // The order of responses corresponds to the order of the registration tokens.
//                    failedTokens.add(registrationTokens.get(i));
//                }
//            }
//            log.info(failedTokens.get(0));
//        }

        // 현재 로그인된 사용자의 토큰이 없거나 또는 업데이트됐다면 유저테이블에 토큰 저장
//        if(userDto.getToken() == null ||  !userDto.getToken().equals(tokenDTO.getTargetToken())) {
//            Optional<User> user = userService.findById(userDto.getId());
//            user.get().setToken(token);  // 토큰 저장
//            userRepository.save(user.get());  // optional에서 entity로 바꾸어서 저장해야함.
//        }


//        System.out.println(requestDTO.getTargetToken() + " "
//                +requestDTO.getTitle() + " " + requestDTO.getBody());

//        firebaseCloudMessageService.sendMessageTo(
//                token,
//                tokenDTO.getTitle(),  // 요청DTO로 받지말고 Back단에서 설정하기
//                tokenDTO.getBody());  // ``
        return ResponseEntity.ok().build();
    }
}