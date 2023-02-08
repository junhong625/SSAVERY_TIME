package com.ssafy.ssafytime.api.firebase;

import com.google.api.client.util.Value;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.common.net.HttpHeaders;
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
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class FcmController {

    private final String API_URL = "https://fcm.googleapis.com/v1/projects/ssafytime/messages:send";

    @Value("${project.properties.firebase-create-scoped}")
    String fireBaseCreateScoped;

    @Autowired
    firebaseCloudMessageService firebaseCloudMessageService;

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;


    @PostMapping("/fcm")
    public ResponseEntity pushMessage(@ApiIgnore Authentication authentication) throws IOException {

//        System.out.println(requestDTO.getTargetToken() + " "
//                +requestDTO.getTitle() + " " + requestDTO.getBody());

//        UserDto userDto = userService.getMyUserWithAuthorities();
//        List<String> token = new ArrayList<>();
//        List<User> users = userService.findByIsAdmin(1);
//        for(int i = 0; i < users.size(); i++) {  // 유저리스트에서
//            token.add(users.get(i).getToken());  // 토큰들 추출
//        }
//        token.add(userDto.getToken());
        firebaseCloudMessageService.sendMessageTo(
                "fE9fmDSWSzWAldDQ-3jyw9:APA91bHEo59QnioI97JE5taDjNG7iox_GmrG6jyFQpuq04UKebelseHU5vmAHqtNXiY1rpLvPX97aCpyfEU-Oc8zkLduf9Tid6QxGzSy0Vi-iSCwk1z5lX9A7wS2DecNHShSjVsmb04F",
                "hi",
                "bye");
        return ResponseEntity.ok().build();
    }

    @PostMapping("/multi/fcm")
    @ApiOperation(value = "FCM 알림보내기", notes = "<strong>FCM 알림보내기</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 400, message = "Bad Request"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity pushMultiMessage() throws IOException, FirebaseMessagingException {

        List<String> registrationTokens = Arrays.asList(
                "fE9fmDSWSzWAldDQ-3jyw9:APA91bHEo59QnioI97JE5taDjNG7iox_GmrG6jyFQpuq04UKebelseHU5vmAHqtNXiY1rpLvPX97aCpyfEU-Oc8zkLduf9Tid6QxGzSy0Vi-iSCwk1z5lX9A7wS2DecNHShSjVsmb04F",
                // ...
                "cd4x0KNwTT6kt4Atjz1YY7:APA91bHOKpw7KnRrDF09ZzKcmu8tNLWsgjo3Mdlff7W1ncRI67Z0EEXm2khW1t5hysoJxWkPo46xJtiFipVOvzhz2Km0xFrMkJE8Cs9hYyyS26Ui19CSxhonTIvoHH-zeMcM3Mij5RD6"
        );

        MulticastMessage message = MulticastMessage.builder()
                .putData("title", "850")
                .putData("content", "2:45")
                .addAllTokens(registrationTokens)
                .build();

//        String message = makeMessage(targetToken, title, body);

        OkHttpClient client = new OkHttpClient();
        okhttp3.RequestBody requestBody = RequestBody.create(message.toString(),
                MediaType.get("application/json; charset=utf-8"));
        Request request = new Request.Builder()
                .url(API_URL)
                .post(requestBody)
                .addHeader(HttpHeaders.AUTHORIZATION, "Bearer " + firebaseCloudMessageService.getAccessToken())
                .addHeader(HttpHeaders.CONTENT_TYPE, "application/json; UTF-8")
                .build();


//        Response response = client.newCall(request).execute();

        BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);
// See the BatchResponse reference documentation
// for the contents of response.
//        System.out.println(response.getSuccessCount() + " messages were sent successfully");

//
//        // 로그인되지않은 유저라면 에러보냄
//        if(authentication == null) {
//            return ResponseEntity.status(400).body(BaseResponseBody.of(400, "BadRequest"));
//        }
//        UserDto userDto = userService.getMyUserWithAuthorities();  // JWT토큰 이용해서 유저정보 가져옴
//
//        List<String> registrationTokens = new ArrayList<>();  // 알림 전송할 토큰들 담은 리스트
//        List<User> users = new ArrayList<>();  // 관리자가 아니면서 알림설정해놓은(alarm=0) 유저들 가져오는 리스트
//        users = userService.findByIsAdmin(0);
//        for(int i = 0; i < users.size(); i++) {  // 유저리스트에서
//            registrationTokens.add(users.get(i).getToken());  // 토큰들 추출
//        }
//
//        MulticastMessage message = MulticastMessage.builder()  // 다수에게 보내기 위한 메세지 생성
//                .putData("title", messageDTO.getTitle())
//                .putData("content", messageDTO.getBody())
//                .addAllTokens(registrationTokens)
//                .build();
//
//        BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);
//
//        if (response.getFailureCount() > 0) {
//            List<SendResponse> responses = response.getResponses();
//            List<String> failedTokens = new ArrayList<>();
//            for (int i = 0; i < responses.size(); i++) {
//                if (!responses.get(i).isSuccessful()) {
//                    // The order of responses corresponds to the order of the registration tokens.
//                    failedTokens.add(registrationTokens.get(i));
//                }
//            }
//        }
//        // 현재 로그인된 사용자의 토큰이 없거나 또는 업데이트됐다면 유저테이블에 토큰 저장
////        if(userDto.getToken() == null ||  !userDto.getToken().equals(tokenDTO.getTargetToken())) {
////            Optional<User> user = userService.findById(userDto.getId());
////            user.get().setToken(token);  // 토큰 저장
////            userRepository.save(user.get());  // optional에서 entity로 바꾸어서 저장해야함.
////        }
//
//
////        System.out.println(requestDTO.getTargetToken() + " "
////                +requestDTO.getTitle() + " " + requestDTO.getBody());
//
////        firebaseCloudMessageService.sendMessageTo(
////                token,
////                tokenDTO.getTitle(),  // 요청DTO로 받지말고 Back단에서 설정하기
////                tokenDTO.getBody());  // ``
//        return ResponseEntity.ok().build();
        return null;
    }

//    @PostConstruct
//    public void firebaseSetting() throws IOException {
//        GoogleCredentials googleCredentials = GoogleCredentials.fromStream(new ClassPathResource("/firebase/ssafytime-firebase-adminsdk-uq8xh-c0ce82262a.json").getInputStream())
//                .createScoped((Arrays.asList(fireBaseCreateScoped)));
//
//        FirebaseOptions secondaryAppConfig = FirebaseOptions.builder()
//                .setCredentials(googleCredentials)
//                .build();
//        if (FirebaseApp.getApps().isEmpty()) {
//            FirebaseApp.initializeApp(secondaryAppConfig);
//        }
//    }
}