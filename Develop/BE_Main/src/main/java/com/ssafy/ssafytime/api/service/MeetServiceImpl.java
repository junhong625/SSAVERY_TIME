package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.MeetList;
import com.ssafy.ssafytime.db.repository.MeetListRepository;
import com.ssafy.ssafytime.db.repository.MeetUpdateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service("meetService")
public class MeetServiceImpl implements MeetService{
    @Autowired
    MeetListRepository meetListRepository;
    @Autowired
    MeetUpdateRepository meetUpdateRepository;

    @Override
    public List<MeetList> findByStudentId(Long userId){
        return meetListRepository.findByStudentId(userId);
    }
    @Override
    public List<MeetList> findByManagerId(Long userId){
        return meetListRepository.findByManagerId(userId);
    }

    @Override
    public MeetList findByRezIdx(Long rezIdx){ return meetListRepository.findByRezIdx(rezIdx);}

    @Override
    public void save(MeetList meetList){ meetUpdateRepository.save(meetList);}
}
