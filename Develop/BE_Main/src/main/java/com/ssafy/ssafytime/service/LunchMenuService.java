package com.ssafy.ssafytime.service;

import java.util.HashMap;
import java.util.List;

public interface LunchMenuService {

    public List<HashMap<String, Object>> getTodayMenu(int region);

    public HashMap<String, List<HashMap<String, Object>>> getWeekMenu(int region);
}
