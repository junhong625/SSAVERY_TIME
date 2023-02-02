package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.SurveyConduct;
import com.ssafy.ssafytime.db.repository.SurveyConductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("surveyConductService")
public class SurveyConductServiceImpl implements SurveyConductService {
    @Autowired
    SurveyConductRepository surveyConductRepository;

    @Override
    public void save(SurveyConduct surveyConduct) {
        surveyConductRepository.save(surveyConduct);
    }
}
