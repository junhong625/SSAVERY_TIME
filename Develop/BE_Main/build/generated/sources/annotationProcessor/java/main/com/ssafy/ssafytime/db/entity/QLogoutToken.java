package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QLogoutToken is a Querydsl query type for LogoutToken
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QLogoutToken extends EntityPathBase<LogoutToken> {

    private static final long serialVersionUID = -769183872L;

    public static final QLogoutToken logoutToken = new QLogoutToken("logoutToken");

    public final DateTimePath<java.time.LocalDateTime> expiredAt = createDateTime("expiredAt", java.time.LocalDateTime.class);

    public final StringPath token = createString("token");

    public final StringPath userEmail = createString("userEmail");

    public QLogoutToken(String variable) {
        super(LogoutToken.class, forVariable(variable));
    }

    public QLogoutToken(Path<? extends LogoutToken> path) {
        super(path.getType(), path.getMetadata());
    }

    public QLogoutToken(PathMetadata metadata) {
        super(LogoutToken.class, metadata);
    }

}

