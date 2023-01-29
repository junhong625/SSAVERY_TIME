package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.SurveyQuestion;
import com.ssafy.ssafytime.db.repository.SurveyQuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("surveyQuestionService")
public class SurveyQuestionServiceImpl implements SurveyQuestionService{
    @Autowired
    SurveyQuestionRepository surveyQuestionRepository;


    @Override
    public List<SurveyQuestion> findAllBySurvey_IdOrderByIdAsc(long Id) {
        return surveyQuestionRepository.findAllBySurvey_IdOrderByIdAsc(Id);
    }
}
