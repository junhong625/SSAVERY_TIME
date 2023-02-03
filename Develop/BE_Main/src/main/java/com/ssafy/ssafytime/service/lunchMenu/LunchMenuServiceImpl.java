package com.ssafy.ssafytime.service.lunchMenu;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import com.ssafy.ssafytime.dto.lunchMenu.LunchMenuResponseDto;
import com.ssafy.ssafytime.repository.LunchMenuRepository;
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
    public HashMap<String, List<LunchMenuResponseDto>> getWeekMenu(int region) {
        LocalDate day = LocalDate.now();
        int weekValue = day.getDayOfWeek().getValue();
        // day를 월요일로 변경
        while (weekValue != 1) {
            weekValue -= 1;
            day = day.minusDays(1);
        }
        HashMap<String, List<LunchMenuResponseDto>> weekMenuList = new HashMap<>();
        for (String d : new String[]{"MON", "TUE", "WED", "THU", "FRI"}) {
            List<LunchMenuResponseDto> menuList = new ArrayList<>();
            lunchMenuRepository.findByRegionAndDate(region, day.toString().replace("-", ""))
                    .forEach((lunchMenuEntity ->
                            menuList.add(new LunchMenuResponseDto(lunchMenuEntity))));
            weekMenuList.put(d, menuList);
            day = day.plusDays(1);
        }
        return weekMenuList;
    }
        // 원본!!
//    }    @Override
//    public List<LunchMenuResponseDto> getWeekMenu(int region) {
//        LocalDate day = LocalDate.now();
//        int weekValue = day.getDayOfWeek().getValue();
//        // day를 월요일로 변경
//        while (weekValue != 1) {
//            weekValue -= 1;
//            day = day.minusDays(1);
//        }
//        String date1 = day.toString().replace("-", "");
//        String date2 = day.plusDays(5).toString().replace("-", "");
//        List<LunchMenuResponseDto> weekMenuList = new ArrayList<>();
//        lunchMenuRepository.findByRegionAndDateBetween(region, date1, date2).forEach((LunchMenuEntity) -> {
//            weekMenuList.add(new LunchMenuResponseDto(LunchMenuEntity));
//        });
//        return weekMenuList;
//    }

    @Override
    public LunchMenuResponseDto getMenuDetail(Long id) {
        Optional<LunchMenuEntity> menu = lunchMenuRepository.findById(id);
        LunchMenuEntity lunchMenuEntity = menu.get();
        return new LunchMenuResponseDto(lunchMenuEntity);
    }
}
