package com.ssafy.ssafytime.domain.notice;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "read_notice")
public class ReadNoticeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "notice_id")
    private NoticeEntity noticeEntity;

    // 유저 Entity 추가 시 주석 삭제
//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_id", referencedColumnName = "id")
//    private UserEntity userEntity;

    @Column(name = "is_read")
    private int isRead;

    @Builder
    public ReadNoticeEntity(NoticeEntity noticeEntity, int isRead) {
        this.noticeEntity = noticeEntity;
        this.isRead = isRead;
    }
}
