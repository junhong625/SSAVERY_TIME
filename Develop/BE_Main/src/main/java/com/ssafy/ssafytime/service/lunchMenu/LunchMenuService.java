package com.ssafy.ssafytime.service.lunchMenu;

import com.ssafy.ssafytime.dto.lunchMenu.LunchMenuResponseDto;

import java.util.HashMap;
import java.util.List;

public interface LunchMenuService {

    List<LunchMenuResponseDto> getTodayMenu(int region);

    LunchMenuResponseDto getMenuDetail(Long id);

    HashMap<String, List<LunchMenuResponseDto>> getWeekMenu(int region);
}
