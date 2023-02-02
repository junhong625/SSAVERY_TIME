package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.api.request.SurveyRegisterPostReq;
import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.repository.SurveyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service("surveyService")
public class SurveyServiceImpl implements SurveyService{
    @Autowired
    SurveyRepository surveyRepository;

    @Override
    public List<Survey> findAll() {
        return surveyRepository.findAll();
    }

    @Override
    public Optional<Survey> findById(Long Id) {
        return surveyRepository.findById(Id);
    }

//    @Override
//    public List<Survey> findByStatus(Integer Status) {
//        return null;
//    }

    @Override
    public void save(Survey survey) {
        surveyRepository.save(survey);
    }
}
