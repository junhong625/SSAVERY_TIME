package com.ssafy.ssafytime.service.lunchMenu;

import com.ssafy.ssafytime.dto.lunchMenu.LunchMenuResponseDto;

import java.util.HashMap;
import java.util.List;

public interface LunchMenuService {

    List<HashMap<String, Object>> getTodayMenu(int region);

    LunchMenuResponseDto getMenuDetail(Long id) throws Exception;

    HashMap<String, List<HashMap<String, Object>>> getWeekMenu(int region);
}
