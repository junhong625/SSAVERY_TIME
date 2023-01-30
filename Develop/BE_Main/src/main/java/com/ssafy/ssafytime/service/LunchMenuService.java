package com.ssafy.ssafytime.service;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public interface LunchMenuService {

    List<HashMap<String, Object>> getTodayMenu(int region);

    Optional<LunchMenuEntity> getMenuDetail(Long id);

    HashMap<String, List<HashMap<String, Object>>> getWeekMenu(int region);
}
