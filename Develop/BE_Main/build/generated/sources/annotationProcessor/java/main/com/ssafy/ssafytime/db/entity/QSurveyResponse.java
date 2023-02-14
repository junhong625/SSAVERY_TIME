package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QSurveyResponse is a Querydsl query type for SurveyResponse
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QSurveyResponse extends EntityPathBase<SurveyResponse> {

    private static final long serialVersionUID = -1218928854L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QSurveyResponse surveyResponse = new QSurveyResponse("surveyResponse");

    public final QSurveyQuestion questionIdx;

    public final StringPath response = createString("response");

    public final QSurvey surveyIdx;

    public final QUser userIdx;

    public QSurveyResponse(String variable) {
        this(SurveyResponse.class, forVariable(variable), INITS);
    }

    public QSurveyResponse(Path<? extends SurveyResponse> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QSurveyResponse(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QSurveyResponse(PathMetadata metadata, PathInits inits) {
        this(SurveyResponse.class, metadata, inits);
    }

    public QSurveyResponse(Class<? extends SurveyResponse> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.questionIdx = inits.isInitialized("questionIdx") ? new QSurveyQuestion(forProperty("questionIdx"), inits.get("questionIdx")) : null;
        this.surveyIdx = inits.isInitialized("surveyIdx") ? new QSurvey(forProperty("surveyIdx")) : null;
        this.userIdx = inits.isInitialized("userIdx") ? new QUser(forProperty("userIdx")) : null;
    }

}

