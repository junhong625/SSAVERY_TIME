package com.ssafy.ssafytime.dto.lunchMenu;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenuEntity;
import lombok.*;

@Getter
@ToString
public class LunchMenuResponseDto {
    private Long id;
    private String mainMenu;
    private String sideMenu;
    private int kcal;
    private String imageUrl;

    @Builder
    public LunchMenuResponseDto(LunchMenuEntity lunchMenuEntity) {
        this.id = lunchMenuEntity.getId();
        this.mainMenu = lunchMenuEntity.getMainMenu();
        this.sideMenu = lunchMenuEntity.getSideMenu();
        this.kcal = lunchMenuEntity.getKcal();
        this.imageUrl = lunchMenuEntity.getImageUrl();
    }
}
