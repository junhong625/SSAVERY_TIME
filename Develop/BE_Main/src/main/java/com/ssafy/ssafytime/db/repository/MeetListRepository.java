package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.MeetList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface MeetListRepository extends JpaRepository<MeetList,Long> {
    List<MeetList> findByStudentId(Long userId);
    List<MeetList> findByManagerId(Long userId);
    MeetList findByRezIdx(Long rezIdx);
    List<MeetList> findByRezDateAndManagerId(LocalDate rezDate , long managerId);

    List<MeetList> findAllByStudentId_UserIdx(Long userId);
    List<MeetList> findAllByManagerId_UserIdx(Long ManagerId);
}


