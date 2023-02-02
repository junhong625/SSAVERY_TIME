package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.dto.ReserveDto;
import com.ssafy.ssafytime.db.entity.MeetList;
import net.bytebuddy.asm.Advice;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
public interface MeetService {
    List<MeetList> findByStudentId(Long userId);
    List<MeetList> findByManagerId(Long userId);

    MeetList findByRezIdx(Long rezIdx);
    void update(MeetList meetList);
    void save(ReserveDto reserveDto);
    List<Integer> findByRezDateAndManagerId(String date , long managerId);
    ArrayList<HashMap<String, Object>> getManagerInfo(Integer classNum, Integer regionCode);
}
