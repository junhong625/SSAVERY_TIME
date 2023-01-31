package com.ssafy.ssafytime.repository;

import com.ssafy.ssafytime.domain.schedule.ScheduleCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduleCategoryRepository extends JpaRepository<ScheduleCategoryEntity, Long> {
}
