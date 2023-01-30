package com.ssafy.ssafytime.service.LunchMenu;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import com.ssafy.ssafytime.dto.LunchMenu.LunchMenuResponseDto;
import com.ssafy.ssafytime.repository.LunchMenuRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@AllArgsConstructor
public class LunchMenuServiceImpl implements LunchMenuService {

    final LunchMenuRepository lunchMenuRepository;

    @Override
    public List<HashMap<String, Object>> getTodayMenu(int region) {
        System.out.printf("1 %d", region);
        LocalDate now = LocalDate.now();
        String date = now.toString().replace("-", "");
        System.out.println(date);
        List<LunchMenuEntity> menu = lunchMenuRepository.findByRegionAndDate(region, date);
        System.out.println(menu);
        ArrayList<HashMap<String, Object>> todayMenu = new ArrayList<HashMap<String, Object>>();

        menu.stream()
                .forEach(lunchMenu -> {
                    HashMap<String, Object> lunch = new HashMap<String, Object>();
                    lunch.put("id", lunchMenu.getId());
                    lunch.put("main_menu", lunchMenu.getMainMenu());
                    lunch.put("side_menu", lunchMenu.getSideMenu());
                    lunch.put("kcal", lunchMenu.getKcal());
                    lunch.put("image_url", lunchMenu.getImageUrl());
                    todayMenu.add(lunch);
                });
        return todayMenu;
    }

    @Override
    public LunchMenuResponseDto getMenuDetail(Long id) throws Exception {
        Optional<LunchMenuEntity> menu = lunchMenuRepository.findById(id);
        LunchMenuEntity lunchMenuEntity = menu.orElseThrow(() -> new Exception("점심 메뉴가 존재하지 않습니다."));
        return new LunchMenuResponseDto(lunchMenuEntity);
    }

    @Override
    public HashMap<String, List<HashMap<String, Object>>> getWeekMenu(int region) {
        LocalDate day = LocalDate.now();
        int weekValue = day.getDayOfWeek().getValue();
        // day를 월요일로 변경
        while (weekValue != 1) {
            weekValue -= 1;
            day = day.minusDays(1);
        }
        String date1 = day.toString().replace("-", "");
        String date2 = day.plusDays(5).toString().replace("-", "");
        List<LunchMenuEntity> menu = lunchMenuRepository.findByRegionAndDateBetween(region, date1, date2);
        HashMap<String, List<HashMap<String, Object>>> weekMenu = new HashMap<String, List<HashMap<String, Object>>>();
        ArrayList<HashMap<String, Object>> lunchList = new ArrayList<HashMap<String, Object>>();
        final String[] curDate = {""};
        menu.stream()
                .forEach(lunchMenu -> {
                    String date = lunchMenu.getDate();
                    if (!curDate[0].equals(date)) {
                        lunchList.clear();
                    }
                    HashMap<String, Object> lunch = new HashMap<String, Object>();
                    lunch.put("id", lunchMenu.getId());
                    lunch.put("main_menu", lunchMenu.getMainMenu());
                    lunch.put("side_menu", lunchMenu.getSideMenu());
                    lunch.put("kcal", lunchMenu.getKcal());
                    lunch.put("image_url", lunchMenu.getImageUrl());
                    lunchList.add(lunch);
                    weekMenu.put(date, (ArrayList<HashMap<String, Object>>)lunchList.clone());
                    curDate[0] = date;
                });
        return weekMenu;
    }
}
