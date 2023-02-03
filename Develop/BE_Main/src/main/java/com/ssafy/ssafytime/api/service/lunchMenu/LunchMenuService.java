package com.ssafy.ssafytime.api.service.lunchMenu;

import com.ssafy.ssafytime.db.dto.lunchMenu.LunchMenuResponseDto;

import java.util.HashMap;
import java.util.List;

public interface LunchMenuService {

    List<LunchMenuResponseDto> getTodayMenu(int region);

    LunchMenuResponseDto getMenuDetail(Long id);

    HashMap<String, List<LunchMenuResponseDto>> getWeekMenu(int region);
}
