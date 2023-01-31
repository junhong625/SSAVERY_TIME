package com.ssafy.ssafytime.api.response;

import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyQuestion;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiParam;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 전체 설문 조회
 */
@Getter
@Setter
@ApiModel("SurveyResponse")
public class AllQuestionRes {

    @ApiModelProperty(
            name = "questionContent"
            , example = "질문내용"
    )
    @ApiParam(value = "질문 내용", required = true)
    private String questionContent;

    @ApiModelProperty(
            name = "optionList"
            , example = "{1,2}"
    )
    @ApiParam(value = "선지 리스트", required = true)
    private String optionList;

    public static List<AllQuestionRes> of(List<SurveyQuestion> allQuestion) {

        List<AllQuestionRes> allQuestionRes = new ArrayList<>();  // 응답으로 보낼 전체질문리스트

        for(int i = 0; i < allQuestion.size(); i++) {
            SurveyQuestion question = allQuestion.get(i);  // 받아온 질문리스트 중 i번째 설문
            AllQuestionRes questionRes = new AllQuestionRes();  // 현재 response 클래스 형식으로 클래스 하나 만듦
            questionRes.setQuestionContent(question.getQuestionContent());  // 받아온 리스트를 조회해가며 i번째 질문의 내용을 받아옴
            questionRes.setOptionList(question.getOptionList());
            allQuestionRes.add(questionRes);  // 응답리스트에 추가
        }

        return allQuestionRes;
    }
}