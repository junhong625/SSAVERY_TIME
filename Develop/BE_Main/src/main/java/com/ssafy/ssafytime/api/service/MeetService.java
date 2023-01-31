package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.MeetList;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface MeetService {
    List<MeetList> findByStudentId(Long userId);
    List<MeetList> findByManagerId(Long userId);

    MeetList findByRezIdx(Long rezIdx);
    void save(MeetList meetList);

}
