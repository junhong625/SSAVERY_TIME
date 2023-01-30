package com.ssafy.ssafytime.domain.notice;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@Entity
@Table(name = "notice")
public class NoticeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 제목
    @Column(name = "title", nullable = false)
    private String title;

    // 분류
    @Column(name = "category", nullable = false)
    private String category;

    // 첨부 파일
//    @Column(name = "attachments", nullable = false)
//    private String attachments;

    // SSAFY측에 저장된 공지사항 Image URL
    @Column(name = "content_url", nullable = false)
    private String contentUrl;

    // 생성날짜
    @Column(name = "create_date", nullable = false)
    private String createDate;

    // 생성시간
    @Column(name = "create_time", nullable = false)
    private String createTime;
}
