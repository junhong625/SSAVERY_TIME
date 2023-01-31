package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.repository.SurveyResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("SurveyResponseService")
public class SurveyResponseServiceImpl implements SurveyResponseService{
    @Autowired
    SurveyResponseRepository surveyResponseRepository;
}
