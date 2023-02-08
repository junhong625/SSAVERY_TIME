package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyConduct;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.SurveyConductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service("surveyConductService")
public class SurveyConductServiceImpl implements SurveyConductService {
    @Autowired
    SurveyConductRepository surveyConductRepository;

    @Override
    public void save(SurveyConduct surveyConduct) {
        surveyConductRepository.save(surveyConduct);
    }

    @Override
    public Optional<Survey> findByUserIdxAndSurveyIdx(User user, Survey survey) {
        return surveyConductRepository.findByUserIdxAndSurveyIdx(user, survey);
    }
}
