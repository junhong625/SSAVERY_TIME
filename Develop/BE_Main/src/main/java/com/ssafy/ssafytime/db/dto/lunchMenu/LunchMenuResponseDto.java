package com.ssafy.ssafytime.db.dto.lunchMenu;

import com.ssafy.ssafytime.db.entity.lunchmenu.LunchMenuEntity;
import lombok.*;

@Getter
@ToString
public class LunchMenuResponseDto {
    private Long id;
    private String mainMenu;
    private String[] sideMenu;
    private int kcal;
    private String imageUrl;

    @Builder
    public LunchMenuResponseDto(LunchMenuEntity lunchMenuEntity) {
        this.id = lunchMenuEntity.getId();
        this.mainMenu = lunchMenuEntity.getMainMenu();
        String[] sideMenuList = lunchMenuEntity.getSideMenu().split(",");
        for (int i=0; i < sideMenuList.length; i++) {
            sideMenuList[i] = sideMenuList[i].replace(" ", "");
        }
        this.sideMenu = sideMenuList;
        this.kcal = lunchMenuEntity.getKcal();
        this.imageUrl = lunchMenuEntity.getImageUrl();
    }
}
