package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.SurveyQuestion;

import java.util.List;

public interface SurveyQuestionService {
    List<SurveyQuestion> findAllBySurvey_IdOrderByIdAsc(long Id);

}
