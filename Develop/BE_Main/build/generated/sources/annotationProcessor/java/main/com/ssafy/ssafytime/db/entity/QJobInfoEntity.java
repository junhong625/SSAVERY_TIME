package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QJobInfoEntity is a Querydsl query type for JobInfoEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QJobInfoEntity extends EntityPathBase<JobInfoEntity> {

    private static final long serialVersionUID = 1834174079L;

    public static final QJobInfoEntity jobInfoEntity = new QJobInfoEntity("jobInfoEntity");

    public final StringPath companyName = createString("companyName");

    public final NumberPath<Long> endDate = createNumber("endDate", Long.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath job = createString("job");

    public final StringPath link = createString("link");

    public final NumberPath<Long> startDate = createNumber("startDate", Long.class);

    public QJobInfoEntity(String variable) {
        super(JobInfoEntity.class, forVariable(variable));
    }

    public QJobInfoEntity(Path<? extends JobInfoEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QJobInfoEntity(PathMetadata metadata) {
        super(JobInfoEntity.class, metadata);
    }

}

