package com.ssafy.ssafytime.db.dto.lunchMenu;

import com.ssafy.ssafytime.db.entity.lunchmenu.LunchMenuEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;
import java.time.LocalDate;

@Getter
@ToString
public class LunchMenuDetailResponseDto {
    /* 날짜 데이터가 필요할 경우 주석 제거
    private LocalDate date; */
    private int region;
    private String course;
    private String mainMenu;
    private String sideMenu;
    private int cho;
    private int kcal;
    private int fat;
    private int protein;
    private int sodium;
    private String imageUrl;

    @Builder
    public LunchMenuDetailResponseDto(LunchMenuEntity lunchMenuEntity) {
        /* 날짜 데이터가 필요할 경우 주석 제거
        String date = lunchMenuEntity.getDate();
        int year = Integer.parseInt(date.substring(0, 4));
        int month = Integer.parseInt(date.substring(4, 6));
        int day = Integer.parseInt(date.substring(6, 8));
        this.date = LocalDate.of(year, month, day);
         */
        this.region = lunchMenuEntity.getRegion();
        this.course = lunchMenuEntity.getCourse();
        this.mainMenu = lunchMenuEntity.getMainMenu();
        this.sideMenu = lunchMenuEntity.getSideMenu();
        this.cho = lunchMenuEntity.getCho();
        this.kcal = lunchMenuEntity.getKcal();
        this.fat = lunchMenuEntity.getFat();
        this.protein = lunchMenuEntity.getProtein();
        this.sodium = lunchMenuEntity.getSodium();
        this.imageUrl = lunchMenuEntity.getImageUrl();
    }
}
