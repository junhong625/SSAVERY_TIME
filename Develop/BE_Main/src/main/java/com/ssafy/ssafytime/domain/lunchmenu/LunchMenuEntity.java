package com.ssafy.ssafytime.domain.lunchmenu;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "lunch_menu")
//@EntityListeners(AuditingEntityListener.class)
public class LunchMenuEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
//    @Column(name = "menu_id", unique = true)
    private Long id;

    // 날짜
    @Column(name = "date", nullable = false, length = 8)
    private String date;

    // 지역
    @Column(name = "region", nullable = false)
    private int region;

    // 코스 (ex : 한식, 일식, 중식 등)
    @Column(name = "course", nullable = true, length = 50)
    private String course;

    // 메인 메뉴
    @Column(name = "main_menu", nullable = true, length = 100)
    private String mainMenu;

    // 사이드 메뉴
    @Column(name = "side_menu", nullable = true, length = 500)
    private String sideMenu;

    @Column(name = "kcal", nullable = true)
    private int kcal;

    @Column(name = "cho", nullable = true)
    private int cho;

    @Column(name = "fat", nullable = true)
    private int fat;

    @Column(name = "protein", nullable = true)
    private int protein;

    @Column(name = "sodium", nullable = true)
    private int sodium;

    @Column(name = "image_url", nullable = true)
    private String imageUrl;

    @Builder
    public LunchMenuEntity(String date, int region, String mainMenu, String sideMenu, String course, int cho, int kcal, int fat, int protein, int sodium, String imageUrl) {
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
}
