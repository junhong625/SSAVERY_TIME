package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.SurveyOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository

public interface SurveyOptionRepository extends JpaRepository<SurveyOption, Long> {
    Optional<SurveyOption> findById(Long Id);

    List<SurveyOption> findAllById(Long Id);
}
