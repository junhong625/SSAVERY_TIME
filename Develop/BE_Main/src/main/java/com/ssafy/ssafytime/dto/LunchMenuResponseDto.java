package com.ssafy.ssafytime.dto;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenu;
import lombok.*;

@Getter
@ToString
public class LunchMenuResponseDto {
    private String date;
    private int region;
    private String course;
    private String mainMenu;
    private String subMenu;
    private int cho;
    private int kcal;
    private int fat;
    private int protein;
    private int sodium;
    private String imageUrl;

    @Builder
    public LunchMenuResponseDto(LunchMenu lunchMenu) {
        this.date = lunchMenu.getDate();
        this.region = lunchMenu.getRegion();
        this.course = lunchMenu.getCourse();
        this.mainMenu = lunchMenu.getMainMenu();
        this.subMenu = lunchMenu.getSubMenu();
        this.cho = lunchMenu.getCho();
        this.kcal = lunchMenu.getKcal();
        this.fat = lunchMenu.getFat();
        this.protein = lunchMenu.getProtein();
        this.sodium = lunchMenu.getSodium();
        this.imageUrl = lunchMenu.getImageUrl();
    }
}
