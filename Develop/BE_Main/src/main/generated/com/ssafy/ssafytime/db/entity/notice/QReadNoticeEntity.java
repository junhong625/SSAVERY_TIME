package com.ssafy.ssafytime.db.entity.notice;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QReadNoticeEntity is a Querydsl query type for ReadNoticeEntity
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QReadNoticeEntity extends EntityPathBase<ReadNoticeEntity> {

    private static final long serialVersionUID = -1434658408L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QReadNoticeEntity readNoticeEntity = new QReadNoticeEntity("readNoticeEntity");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final NumberPath<Integer> isRead = createNumber("isRead", Integer.class);

    public final QNoticeEntity noticeEntity;

    public final com.ssafy.ssafytime.db.entity.QUser userEntity;

    public QReadNoticeEntity(String variable) {
        this(ReadNoticeEntity.class, forVariable(variable), INITS);
    }

    public QReadNoticeEntity(Path<? extends ReadNoticeEntity> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QReadNoticeEntity(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QReadNoticeEntity(PathMetadata metadata, PathInits inits) {
        this(ReadNoticeEntity.class, metadata, inits);
    }

    public QReadNoticeEntity(Class<? extends ReadNoticeEntity> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.noticeEntity = inits.isInitialized("noticeEntity") ? new QNoticeEntity(forProperty("noticeEntity")) : null;
        this.userEntity = inits.isInitialized("userEntity") ? new com.ssafy.ssafytime.db.entity.QUser(forProperty("userEntity")) : null;
    }

}

