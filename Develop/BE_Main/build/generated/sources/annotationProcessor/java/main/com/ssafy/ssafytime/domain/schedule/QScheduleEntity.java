package com.ssafy.ssafytime.domain.schedule;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QScheduleEntity is a Querydsl query type for ScheduleEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QScheduleEntity extends EntityPathBase<ScheduleEntity> {

    private static final long serialVersionUID = -1238301477L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QScheduleEntity scheduleEntity = new QScheduleEntity("scheduleEntity");

    public final com.ssafy.ssafytime.domain.cagetory.QCategoryEntity categoryEntity;

    public final StringPath date = createString("date");

    public final StringPath endTime = createString("endTime");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath startTime = createString("startTime");

    public final StringPath subTitle = createString("subTitle");

    public final StringPath title = createString("title");

    public final NumberPath<Integer> trackCode = createNumber("trackCode", Integer.class);

    public QScheduleEntity(String variable) {
        this(ScheduleEntity.class, forVariable(variable), INITS);
    }

    public QScheduleEntity(Path<? extends ScheduleEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QScheduleEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QScheduleEntity(PathMetadata metadata, PathInits inits) {
        this(ScheduleEntity.class, metadata, inits);
    }

    public QScheduleEntity(Class<? extends ScheduleEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.categoryEntity = inits.isInitialized("categoryEntity") ? new com.ssafy.ssafytime.domain.cagetory.QCategoryEntity(forProperty("categoryEntity")) : null;
    }

}

