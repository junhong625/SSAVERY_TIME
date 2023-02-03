package com.ssafy.ssafytime.repository;

import com.ssafy.ssafytime.domain.notice.ReadNoticeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReadNoticeRepository extends JpaRepository<ReadNoticeEntity, Long> {
    List<ReadNoticeEntity> findByNoticeEntity_IdAndIsRead(Long id, int isRead);
    List<ReadNoticeEntity> findByUserEntity_UserIdxAndIsRead(Long uid, int isRead);
}
