package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QuserJobInfo is a Querydsl query type for userJobInfo
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QuserJobInfo extends EntityPathBase<userJobInfo> {

    private static final long serialVersionUID = -1601692463L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QuserJobInfo userJobInfo = new QuserJobInfo("userJobInfo");

    public final QJobInfoEntity jobInfoIdx;

    public final QUser userIdx;

    public QuserJobInfo(String variable) {
        this(userJobInfo.class, forVariable(variable), INITS);
    }

    public QuserJobInfo(Path<? extends userJobInfo> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QuserJobInfo(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QuserJobInfo(PathMetadata metadata, PathInits inits) {
        this(userJobInfo.class, metadata, inits);
    }

    public QuserJobInfo(Class<? extends userJobInfo> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.jobInfoIdx = inits.isInitialized("jobInfoIdx") ? new QJobInfoEntity(forProperty("jobInfoIdx")) : null;
        this.userIdx = inits.isInitialized("userIdx") ? new QUser(forProperty("userIdx")) : null;
    }

}

