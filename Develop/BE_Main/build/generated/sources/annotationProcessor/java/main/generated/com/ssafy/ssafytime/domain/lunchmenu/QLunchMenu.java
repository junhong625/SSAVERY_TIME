package com.ssafy.ssafytime.domain.lunchmenu;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QLunchMenu is a Querydsl query type for LunchMenu
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QLunchMenu extends EntityPathBase<LunchMenu> {

    private static final long serialVersionUID = -389309554L;

    public static final QLunchMenu lunchMenu = new QLunchMenu("lunchMenu");

    public final NumberPath<Integer> cho = createNumber("cho", Integer.class);

    public final StringPath course = createString("course");

    public final StringPath date = createString("date");

    public final NumberPath<Integer> fat = createNumber("fat", Integer.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath imageUrl = createString("imageUrl");

    public final NumberPath<Integer> kcal = createNumber("kcal", Integer.class);

    public final StringPath mainMenu = createString("mainMenu");

    public final NumberPath<Integer> protein = createNumber("protein", Integer.class);

    public final NumberPath<Integer> region = createNumber("region", Integer.class);

    public final NumberPath<Integer> sodium = createNumber("sodium", Integer.class);

    public final StringPath subMenu = createString("subMenu");

    public QLunchMenu(String variable) {
        super(LunchMenu.class, forVariable(variable));
    }

    public QLunchMenu(Path<? extends LunchMenu> path) {
        super(path.getType(), path.getMetadata());
    }

    public QLunchMenu(PathMetadata metadata) {
        super(LunchMenu.class, metadata);
    }

}

