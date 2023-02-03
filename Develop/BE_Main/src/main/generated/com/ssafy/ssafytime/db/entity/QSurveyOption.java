package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QSurveyOption is a Querydsl query type for SurveyOption
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QSurveyOption extends EntityPathBase<SurveyOption> {

    private static final long serialVersionUID = 888387998L;

    public static final QSurveyOption surveyOption = new QSurveyOption("surveyOption");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath optionContent = createString("optionContent");

    public final NumberPath<Integer> optionIntensity = createNumber("optionIntensity", Integer.class);

    public QSurveyOption(String variable) {
        super(SurveyOption.class, forVariable(variable));
    }

    public QSurveyOption(Path<? extends SurveyOption> path) {
        super(path.getType(), path.getMetadata());
    }

    public QSurveyOption(PathMetadata metadata) {
        super(SurveyOption.class, metadata);
    }

}

