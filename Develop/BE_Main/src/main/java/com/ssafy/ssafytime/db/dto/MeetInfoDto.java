package com.ssafy.ssafytime.db.dto;


import com.ssafy.ssafytime.db.entity.User;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Setter
@Getter
@ToString
public class MeetInfoDto {
    private LocalDate rezDate;
    private Double rezTime;
    private String title;
    private String category;
    private String meetUrl;
    private Long rezIdx;
    private String reject;
    private Long state;
    private String name;

}
