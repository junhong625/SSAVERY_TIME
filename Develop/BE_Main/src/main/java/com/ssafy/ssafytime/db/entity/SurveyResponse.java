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
@IdClass(SurveyResponseKey.class)
public class SurveyResponse implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(name = "user_idx")
    private User userIdx;

    @Id
    @ManyToOne
    @JoinColumn(name = "survey_idx")
    private Survey surveyIdx;

    @Id
    @ManyToOne
    @JoinColumn(name = "question_idx")
    private SurveyQuestion questionIdx;

    private String response;

}