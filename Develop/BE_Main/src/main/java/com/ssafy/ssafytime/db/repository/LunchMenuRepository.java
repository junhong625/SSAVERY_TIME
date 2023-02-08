package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.lunchmenu.LunchMenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LunchMenuRepository extends JpaRepository<LunchMenuEntity, Long> {
    List<LunchMenuEntity> findByRegionAndDate (int region, String date);
}