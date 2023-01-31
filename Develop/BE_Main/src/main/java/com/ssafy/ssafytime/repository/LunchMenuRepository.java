package com.ssafy.ssafytime.repository;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LunchMenuRepository extends JpaRepository<LunchMenuEntity, Long> {
    List<LunchMenuEntity> findByRegionAndDate (int region, String date);

    List<LunchMenuEntity> findByRegionAndDateBetween(int region, String date1, String date2);
}