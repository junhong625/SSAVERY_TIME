package com.ssafy.ssafytime.api.service.survey;

import com.ssafy.ssafytime.db.entity.survey.Survey;
import com.ssafy.ssafytime.db.entity.survey.SurveyConduct;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.survey.SurveyConductRepository;
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
