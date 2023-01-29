package com.ssafy.ssafytime.db.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.checkerframework.checker.units.qual.C;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@IdClass(SurveyConductKey.class)
public class SurveyConduct implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(name = "user_idx")
    private User userIdx;

    @Id
    @ManyToOne
    @JoinColumn(name = "survey_idx")
    private Survey surveyIdx;

}