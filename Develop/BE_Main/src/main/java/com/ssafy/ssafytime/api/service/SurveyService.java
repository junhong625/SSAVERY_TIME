package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.api.request.SurveyRegisterPostReq;
import com.ssafy.ssafytime.db.entity.Survey;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;


public interface SurveyService {

    List<Survey> findAll();
}
