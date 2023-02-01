package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.dto.UserDto;
import com.ssafy.ssafytime.api.request.SurveyRegisterPostReq;
import com.ssafy.ssafytime.api.response.AllQuestionRes;
import com.ssafy.ssafytime.api.response.AllSurveyRes;
import com.ssafy.ssafytime.api.service.SurveyOptionService;
import com.ssafy.ssafytime.api.service.SurveyQuestionService;
import com.ssafy.ssafytime.api.service.SurveyService;
import com.ssafy.ssafytime.api.service.UserService;
import com.ssafy.ssafytime.common.model.response.BaseResponseBody;
import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyOption;
import com.ssafy.ssafytime.db.entity.SurveyQuestion;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.SurveyOptionRepository;
import com.ssafy.ssafytime.db.repository.SurveyQuestionRepository;
import com.ssafy.ssafytime.db.repository.SurveyRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import com.ssafy.ssafytime.jdbc_connection.DbConnector;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Api(value = "설문 API", tags = {"Survey"})
@RestController
@RequestMapping("/api/v1/surveys")
public class SurveyController {

    @Qualifier("surveyService")
    @Autowired
    SurveyService surveyService;
    @Qualifier("surveyQuestionService")
    @Autowired
    SurveyQuestionService surveyQuestionService;
    @Autowired
    SurveyOptionService surveyOptionService;
    @Autowired
    UserService userService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    SurveyRepository surveyRepository;
    @Autowired
    SurveyQuestionRepository surveyQuestionRepository;
    @Autowired
    SurveyOptionRepository surveyOptionRepository;

    public static int cnt = 0;  // 이벤트 스케줄러의 제목에 넣을 count변수 선언!

    @GetMapping("/survey")
    @ApiOperation(value = "설문 전체 조회", notes = "<strong>설문 전체 조회</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<List<AllSurveyRes>> getSurvey() {


        List<Survey> surveyList = (List<Survey>) surveyService.findAll();  // 전체 설문 조회
        if(surveyList.size() == 0) {
            return ResponseEntity.status(204).body(null);
        }
        else {
            List<AllSurveyRes> allSurveyRes = AllSurveyRes.of(surveyList);  // AllSurveyRes 리스트 타입으로 바꿈
            return ResponseEntity.ok().body(allSurveyRes);
        }
    }

    @GetMapping("/survey/questions/{Id}")
    @ApiOperation(value = "해당설문의 질문 전체 조회", notes = "<strong>해당 설문의 질문 전체 조회</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<List<AllQuestionRes>> getQuestion(@PathVariable("Id") int Id) {


        List<SurveyQuestion> questionList = (List<SurveyQuestion>) surveyQuestionService.findAllBySurvey_IdOrderByIdAsc(Id);  // 해당 설문의 전체 질문 조회

        if(questionList.size() == 0) {
            return ResponseEntity.status(204).body(null);
        }
        else {
            List<AllQuestionRes> allQuestionRes = AllQuestionRes.of(questionList);  // AllSurveyRes 리스트 타입으로 바꿈
            return ResponseEntity.ok().body(allQuestionRes);
        }
    }

    @GetMapping("/survey/options/{Id}")
    @ApiOperation(value = "설문 선지 내용 조회", notes = "<strong>설문 선지 내용 조회</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<Optional<SurveyOption>> getOption(@PathVariable("Id") Long Id) {
        Optional<SurveyOption> surveyOption = surveyOptionService.findById(Id);
        if(surveyOption.isPresent()) {
            return ResponseEntity.ok().body(surveyOption);
        } else {
            return ResponseEntity.status(204).body(null);
        }
    }

    @PostMapping("/survey")
    @ApiOperation(value = "설문 등록", notes = "<strong>설문 등록</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<? extends BaseResponseBody> registerSurvey(@RequestBody @ApiParam(value="설문 등록 정보", required = true) SurveyRegisterPostReq surveyRegisterPostReq) {  // 설문 등록 API
        Survey survey = new Survey();

        String title = surveyRegisterPostReq.getTitle();
        Integer status = surveyRegisterPostReq.getStatus();
        LocalDateTime createdAt = surveyRegisterPostReq.getCreatedAt();
        LocalDateTime endedAt = surveyRegisterPostReq.getEndedAt();
        Integer category = surveyRegisterPostReq.getCategory();

        survey.setCategory(category);
        survey.setTitle(title);
        survey.setStatus(status);
        survey.setEndedAt(endedAt);
        survey.setCreatedAt(createdAt);

        surveyService.save(survey);  // create

        try {
            DbConnector.main(createdAt, endedAt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ResponseEntity.status(200).body(BaseResponseBody.of(200, "Success"));
    }

    @PostMapping("/survey/conduct/{surveyId}")
    @ApiOperation(value = "설문 완료 ", notes = "<strong>설문 완료</strong>")
    @ApiResponses({
            @ApiResponse(code = 200, message = "성공"),
            @ApiResponse(code = 204, message = "No Content"),
            @ApiResponse(code = 401, message = "인증 실패"),
            @ApiResponse(code = 404, message = "사용자 없음"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    public ResponseEntity<? extends BaseResponseBody> surveyConduct(@PathVariable("surveyId") Long Id, @ApiIgnore Authentication authentication) {

        UserDto user = userService.getMyUserWithAuthorities();
        return null;
    }
}