package com.ssafy.ssafytime.dto;

import com.ssafy.ssafytime.domain.lunchmenu.LunchMenu;
import lombok.*;

@Getter
@NoArgsConstructor
public class LunchMenuRequestDto {
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
    public LunchMenuRequestDto(String date, int region, String course, String mainMenu, String subMenu, int cho
    , int kcal, int fat, int protein, int sodium, String imageUrl) {
        this.date = date;
        this.region = region;
        this.course = course;
        this.mainMenu = mainMenu;
        this.subMenu = subMenu;
        this.cho = cho;
        this.kcal = kcal;
        this.fat = fat;
        this.protein = protein;
        this.sodium = sodium;
        this.imageUrl = imageUrl;
    }

    public LunchMenu toEntity() {
        return LunchMenu.builder().date(date).region(region).course(course).mainMenu(mainMenu).subMenu(subMenu).cho(cho).protein(protein).fat(fat).kcal(kcal).sodium(sodium).imageUrl(imageUrl).build();
    }
}
