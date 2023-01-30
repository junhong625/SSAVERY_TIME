package com.ssafy.ssafytime.service.LunchMenu;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import com.ssafy.ssafytime.dto.LunchMenu.LunchMenuResponseDto;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public interface LunchMenuService {

    List<HashMap<String, Object>> getTodayMenu(int region);

    LunchMenuResponseDto getMenuDetail(Long id) throws Exception;

    HashMap<String, List<HashMap<String, Object>>> getWeekMenu(int region);
}
