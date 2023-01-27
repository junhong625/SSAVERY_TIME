package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.SurveyResponse;
import com.ssafy.ssafytime.db.entity.SurveyResponseKey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface SurveyResponseRepository extends JpaRepository<SurveyResponse, SurveyResponseKey> {
}
