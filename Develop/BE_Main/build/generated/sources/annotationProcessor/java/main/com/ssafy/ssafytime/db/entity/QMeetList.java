package com.ssafy.ssafytime.db.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QMeetList is a Querydsl query type for MeetList
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMeetList extends EntityPathBase<MeetList> {

    private static final long serialVersionUID = 112768564L;

    public static final QMeetList meetList = new QMeetList("meetList");

    public final NumberPath<Long> category = createNumber("category", Long.class);

    public final NumberPath<Long> managerId = createNumber("managerId", Long.class);

    public final StringPath reject = createString("reject");

    public final DatePath<java.time.LocalDate> rezDate = createDate("rezDate", java.time.LocalDate.class);

    public final NumberPath<Long> rezIdx = createNumber("rezIdx", Long.class);

    public final NumberPath<Long> rezTime = createNumber("rezTime", Long.class);

    public final NumberPath<Long> state = createNumber("state", Long.class);

    public final NumberPath<Long> studentId = createNumber("studentId", Long.class);

    public final StringPath title = createString("title");

    public QMeetList(String variable) {
        super(MeetList.class, forVariable(variable));
    }

    public QMeetList(Path<? extends MeetList> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMeetList(PathMetadata metadata) {
        super(MeetList.class, metadata);
    }

}

