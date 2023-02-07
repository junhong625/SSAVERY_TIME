package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QSurveyConduct is a Querydsl query type for SurveyConduct
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QSurveyConduct extends EntityPathBase<SurveyConduct> {

    private static final long serialVersionUID = -324199109L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QSurveyConduct surveyConduct = new QSurveyConduct("surveyConduct");

    public final QSurvey surveyIdx;

    public final QUser userIdx;

    public QSurveyConduct(String variable) {
        this(SurveyConduct.class, forVariable(variable), INITS);
    }

    public QSurveyConduct(Path<? extends SurveyConduct> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QSurveyConduct(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QSurveyConduct(PathMetadata metadata, PathInits inits) {
        this(SurveyConduct.class, metadata, inits);
    }

    public QSurveyConduct(Class<? extends SurveyConduct> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.surveyIdx = inits.isInitialized("surveyIdx") ? new QSurvey(forProperty("surveyIdx")) : null;
        this.userIdx = inits.isInitialized("userIdx") ? new QUser(forProperty("userIdx")) : null;
    }

}

