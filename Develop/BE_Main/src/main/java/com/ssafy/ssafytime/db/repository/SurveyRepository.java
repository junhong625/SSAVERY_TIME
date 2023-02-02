package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.Survey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SurveyRepository extends JpaRepository<Survey, Long> {

    @Override
    List<Survey> findAll();

    @Override
    Optional<Survey> findById(Long Id);

    @Override
    Survey save(Survey survey);
}
