package com.ssafy.ssafytime.db.dto.lunchMenu;

import com.ssafy.ssafytime.db.entity.lunchmenu.LunchMenuEntity;
import lombok.*;

@Getter
@NoArgsConstructor
public class LunchMenuRequestDto {
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
    public LunchMenuRequestDto(String date, int region, String course, String mainMenu, String sideMenu, int cho
    , int kcal, int fat, int protein, int sodium, String imageUrl) {
        this.date = date;
        this.region = region;
        this.course = course;
        this.mainMenu = mainMenu;
        this.sideMenu = sideMenu;
        this.cho = cho;
        this.kcal = kcal;
        this.fat = fat;
        this.protein = protein;
        this.sodium = sodium;
        this.imageUrl = imageUrl;
    }

    public LunchMenuEntity toEntity() {
        return LunchMenuEntity.builder().date(date).region(region).course(course).mainMenu(mainMenu).sideMenu(sideMenu).cho(cho).protein(protein).fat(fat).kcal(kcal).sodium(sodium).imageUrl(imageUrl).build();
    }
}
