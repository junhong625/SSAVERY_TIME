package com.ssafy.ssafytime.domain.notice;

import com.ssafy.ssafytime.db.entity.User;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "read_notice")
// TODO 유저 id 컬럼 추가 ManyToOne
public class ReadNoticeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "notice_id")
    private NoticeEntity noticeEntity;

    // 유저 Entity 추가 시 주석 삭제
    @ManyToOne
    @JoinColumn(name = "user_idx")
    private User userEntity;

    @Column(name = "is_read")
    @ColumnDefault("0")
    private int isRead;

    @Builder
    public ReadNoticeEntity(NoticeEntity noticeEntity, User userEntity, int isRead) {
        this.noticeEntity = noticeEntity;
        this.userEntity = userEntity;
        this.isRead = isRead;
    }
}
