package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QSurveyQuestion is a Querydsl query type for SurveyQuestion
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QSurveyQuestion extends EntityPathBase<SurveyQuestion> {

    private static final long serialVersionUID = -2044475697L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QSurveyQuestion surveyQuestion = new QSurveyQuestion("surveyQuestion");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath optionList = createString("optionList");

    public final StringPath questionContent = createString("questionContent");

    public final QSurvey survey;

    public QSurveyQuestion(String variable) {
        this(SurveyQuestion.class, forVariable(variable), INITS);
    }

    public QSurveyQuestion(Path<? extends SurveyQuestion> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QSurveyQuestion(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QSurveyQuestion(PathMetadata metadata, PathInits inits) {
        this(SurveyQuestion.class, metadata, inits);
    }

    public QSurveyQuestion(Class<? extends SurveyQuestion> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.survey = inits.isInitialized("survey") ? new QSurvey(forProperty("survey")) : null;
    }

}

