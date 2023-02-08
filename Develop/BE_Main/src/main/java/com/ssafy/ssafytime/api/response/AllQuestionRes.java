package com.ssafy.ssafytime.api.response;

import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyOption;
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
import java.util.Map;

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
            , example = "{}"
    )
    @ApiParam(value = "선지 리스트", required = true)
    private List<SurveyOption> optionList;


}