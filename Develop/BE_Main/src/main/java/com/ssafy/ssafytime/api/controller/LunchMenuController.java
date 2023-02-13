package com.ssafy.ssafytime.api.controller;


import com.ssafy.ssafytime.db.dto.lunchMenu.LunchMenuResponseDto;
import com.ssafy.ssafytime.exception.ResponseHandler;
import com.ssafy.ssafytime.api.service.lunchMenu.LunchMenuServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/menu")
public class LunchMenuController {

    private final LunchMenuServiceImpl lunchMenuService;

    /* 오늘의 점심 메뉴 조회(develop_AJH)
    ================================================|| parameter ||=========================================================
    region : 지역 코드(0: 서울, 1: 부울경, 2: 구미, 3: 광주)
    0, 1, 2 -> Crawling from Welstory+
    3 -> Crawling from Freshmeal
    ========================================================================================================================
     */
    @GetMapping("/today")
    public ResponseEntity<Object> todayMenu(@RequestParam("region") int region) {
        List<LunchMenuResponseDto> menu = lunchMenuService.getTodayMenu(region);
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, menu);
    }

    /* 내일 점심 메뉴 조회(develop_AJH)
    ================================================|| parameter ||=========================================================
    region : 지역 코드(0: 서울, 1: 부울경, 2: 구미, 3: 광주)
    0, 1, 2 -> Crawling from Welstory+
    3 -> Crawling from Freshmeal
    ========================================================================================================================
     */
    @GetMapping("/tomorrow")
    public ResponseEntity<Object> tomorrowMenu(@RequestParam("region") int region) {
        List<LunchMenuResponseDto> menu = lunchMenuService.getTomorrowMenu(region);
        return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, menu);
    }

    /* 이번 주 점심 메뉴 조회 (develop_AJH)
    ================================================|| parameter ||=========================================================
    region : 지역 코드(0: 서울, 1: 부울경, 2: 구미, 3: 광주)
    0, 1, 2 -> Crawling from Welstory+
    3 -> Crawling from Freshmeal
    ========================================================================================================================
     */
    @GetMapping("/week")
    public ResponseEntity<Object> WeekMenu(@RequestParam("region") int region) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, lunchMenuService.getWeekMenu(region));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.BAD_REQUEST, null);
        }
    }

    /* 단일 점심 메뉴 세부 정보 조회(develop_AJH)
    ================================================|| parameter ||=========================================================
    id : 점심 메뉴 id
    ========================================================================================================================
     */
    @GetMapping("/detail")
    public ResponseEntity<Object> menuDetail(@RequestParam("id") Long id) {
        try {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, lunchMenuService.getMenuDetail(id));
        } catch (Exception e) {
            return ResponseHandler.generateResponse(false, e.getMessage(), HttpStatus.BAD_REQUEST, null);
        }
    }
}