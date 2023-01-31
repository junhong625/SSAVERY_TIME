package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.response.AllQuestionRes;
import com.ssafy.ssafytime.api.response.AllSurveyRes;
import com.ssafy.ssafytime.api.service.SurveyOptionService;
import com.ssafy.ssafytime.api.service.SurveyQuestionService;
import com.ssafy.ssafytime.api.service.SurveyService;
import com.ssafy.ssafytime.common.model.response.BaseResponseBody;
import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyOption;
import com.ssafy.ssafytime.db.entity.SurveyQuestion;
import com.ssafy.ssafytime.db.repository.SurveyOptionRepository;
import com.ssafy.ssafytime.db.repository.SurveyQuestionRepository;
import com.ssafy.ssafytime.db.repository.SurveyRepository;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    SurveyRepository surveyRepository;
    @Autowired
    SurveyQuestionRepository surveyQuestionRepository;
    @Autowired
    SurveyOptionRepository surveyOptionRepository;

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

}