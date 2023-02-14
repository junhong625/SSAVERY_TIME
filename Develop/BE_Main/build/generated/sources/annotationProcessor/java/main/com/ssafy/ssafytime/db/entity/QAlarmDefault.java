package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QAlarmDefault is a Querydsl query type for AlarmDefault
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QAlarmDefault extends EntityPathBase<AlarmDefault> {

    private static final long serialVersionUID = 1422782431L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QAlarmDefault alarmDefault = new QAlarmDefault("alarmDefault");

    public final BooleanPath consultingAlarm = createBoolean("consultingAlarm");

    public final BooleanPath noticeAlarm = createBoolean("noticeAlarm");

    public final BooleanPath surveyAlarm = createBoolean("surveyAlarm");

    public final QUser user;

    public final NumberPath<Long> userId = createNumber("userId", Long.class);

    public QAlarmDefault(String variable) {
        this(AlarmDefault.class, forVariable(variable), INITS);
    }

    public QAlarmDefault(Path<? extends AlarmDefault> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QAlarmDefault(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QAlarmDefault(PathMetadata metadata, PathInits inits) {
        this(AlarmDefault.class, metadata, inits);
    }

    public QAlarmDefault(Class<? extends AlarmDefault> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new QUser(forProperty("user")) : null;
    }

}

