package com.ssafy.ssafytime.api.service.lunchMenu;

import com.ssafy.ssafytime.db.dto.lunchMenu.LunchMenuDetailResponseDto;
import com.ssafy.ssafytime.db.entity.lunchmenu.LunchMenuEntity;
import com.ssafy.ssafytime.db.dto.lunchMenu.LunchMenuResponseDto;
import com.ssafy.ssafytime.db.repository.LunchMenuRepository;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
@Slf4j
@AllArgsConstructor
public class LunchMenuServiceImpl implements LunchMenuService {

    final LunchMenuRepository lunchMenuRepository;

    @Override
    public List<LunchMenuResponseDto> getTodayMenu(int region) {
        LocalDate now = LocalDate.now();
        String date = now.toString().replace("-", "");
        List<LunchMenuResponseDto> menuList = new ArrayList<>();
        lunchMenuRepository.findByRegionAndDate(region, date).forEach((LunchMenuEntity)-> {
            menuList.add(new LunchMenuResponseDto(LunchMenuEntity));
        });
        return menuList;
    }

    @Override
    public HashMap<Integer, List<LunchMenuResponseDto>> getWeekMenu(int region) {
        LocalDate day = LocalDate.now();
        int weekValue = day.getDayOfWeek().getValue();
        // day를 월요일로 변경
        if (weekValue <= 5) {
            day = day.minusDays(weekValue-1);
        } else {
            day = day.plusDays(8 - weekValue);
        }
        HashMap<Integer, List<LunchMenuResponseDto>> weekMenuList = new HashMap<>();
        for (int d=0; d < 5; d++) {
            List<LunchMenuResponseDto> menuList = new ArrayList<>();
            lunchMenuRepository.findByRegionAndDate(region, day.toString().replace("-", ""))
                    .forEach((lunchMenuEntity ->
                            menuList.add(new LunchMenuResponseDto(lunchMenuEntity))));
            weekMenuList.put(d, menuList);
            day = day.plusDays(1);
        }
        return weekMenuList;
    }

    @Override
    public LunchMenuDetailResponseDto getMenuDetail(Long id) {
        Optional<LunchMenuEntity> menu = lunchMenuRepository.findById(id);
        return new LunchMenuDetailResponseDto(menu.get());
    }
}
