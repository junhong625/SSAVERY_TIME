package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.service.jobInfo.JobInfoService;
import com.ssafy.ssafytime.api.service.jobInfo.JobInfoServiceImpl;
import com.ssafy.ssafytime.db.dto.jobInfo.JobInfoRequestDto;
import com.ssafy.ssafytime.db.dto.jobInfo.JobInfoResponseDto;
import com.ssafy.ssafytime.db.entity.JobInfoEntity;
import com.ssafy.ssafytime.exception.ResponseHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("job")
public class JobInfoController {

    private final JobInfoServiceImpl jobInfoService;

    @PostMapping("/create")
    public ResponseEntity<Object> createJobInfo(@RequestBody HashMap<String, Object> jobInfo) {
        jobInfoService.save(jobInfo);
        return ResponseHandler.generateResponse(true, "CREATED", HttpStatus.CREATED, null);
    }

    @GetMapping("/")
    public ResponseEntity<Object> getAllJobInfo() {
        List<JobInfoResponseDto> jobInfoList = jobInfoService.getAllJobInfo();
        if (!jobInfoList.isEmpty()) {
            return ResponseHandler.generateResponse(true, "OK", HttpStatus.OK, jobInfoList);
        } else {
            return ResponseHandler.generateResponse(false, "NULL", HttpStatus.NOT_FOUND, null);
        }
    }
}
