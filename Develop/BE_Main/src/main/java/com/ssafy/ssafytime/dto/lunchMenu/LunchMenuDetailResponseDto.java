package com.ssafy.ssafytime.dto.lunchMenu;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import lombok.*;

@Getter
@ToString
public class LunchMenuResponseDto {
    private String date;
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
    public LunchMenuResponseDto(LunchMenuEntity lunchMenuEntity) {
        this.date = lunchMenuEntity.getDate();
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
