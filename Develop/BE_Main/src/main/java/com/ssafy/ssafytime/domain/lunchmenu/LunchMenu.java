package com.ssafy.ssafytime.domain.lunchmenu;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "lunch_menu")
//@EntityListeners(AuditingEntityListener.class)
public class LunchMenu {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
//    @Column(name = "menu_id", unique = true)
    private Long id;

    @Column(name = "date", nullable = false, length = 8)
    private String date;

    @Column(name = "region", nullable = false)
    private int region;

    @Column(name = "course", nullable = true, length = 50)
    private String course;

    @Column(name = "main_menu", nullable = true, length = 100)
    private String mainMenu;

    @Column(name = "sub_menu", nullable = true, length = 500)
    private String subMenu;

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
    public LunchMenu(String date, int region, String mainMenu, String subMenu, String course, int cho, int kcal, int fat, int protein, int sodium, String imageUrl) {
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
}
