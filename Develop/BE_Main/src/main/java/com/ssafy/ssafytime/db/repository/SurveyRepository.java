package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.Survey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SurveyRepository extends JpaRepository<Survey, Long> {

    @Override
    List<Survey> findAll();

    @Override
    Survey save(Survey survey);
}
