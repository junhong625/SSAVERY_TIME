package com.ssafy.ssafytime.repository;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LunchMenuRepository extends JpaRepository<LunchMenu, Long> {
    List<LunchMenu> findByRegionAndDate (int region, String date);

    List<LunchMenu> findByRegionAndDateBetween(int region, String date1, String date2);
}