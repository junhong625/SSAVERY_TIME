package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.Survey;
import com.ssafy.ssafytime.db.entity.SurveyConduct;
import com.ssafy.ssafytime.db.entity.SurveyConductKey;
import com.ssafy.ssafytime.db.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository

public interface SurveyConductRepository extends JpaRepository<SurveyConduct, SurveyConductKey> {
    @Override
    SurveyConduct save(SurveyConduct surveyConduct);

    Optional<Survey> findByUserIdxAndSurveyIdx(User user, Survey survey);
}
