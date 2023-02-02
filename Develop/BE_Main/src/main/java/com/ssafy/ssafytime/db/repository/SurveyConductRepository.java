package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.SurveyConduct;
import com.ssafy.ssafytime.db.entity.SurveyConductKey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface SurveyConductRepository extends JpaRepository<SurveyConduct, SurveyConductKey> {
    @Override
    SurveyConduct save(SurveyConduct surveyConduct);
}
