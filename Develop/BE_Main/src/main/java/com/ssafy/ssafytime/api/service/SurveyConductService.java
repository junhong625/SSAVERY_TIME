package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyConduct;
import com.ssafy.ssafytime.db.entity.User;

import java.util.Optional;

public interface SurveyConductService {
    void save(SurveyConduct surveyConduct);

    Optional<Survey> findByUserIdxAndSurveyIdx(User user, Survey survey);


}
