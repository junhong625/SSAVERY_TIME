package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.dto.MeetInfoDto;
import com.ssafy.ssafytime.db.dto.ReserveDto;
import com.ssafy.ssafytime.db.entity.MeetList;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.MeetListRepository;
import com.ssafy.ssafytime.db.repository.MeetUpdateRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service("meetService")
public class MeetServiceImpl implements MeetService{
    @Autowired
    MeetListRepository meetListRepository;
    @Autowired
    MeetUpdateRepository meetUpdateRepository;
    @Autowired
    UserRepository userRepository;

    @Override
    public List<Double> findByRezDateAndManagerId(String date , long managerId){
        LocalDate day = LocalDate.parse(date, DateTimeFormatter.ISO_DATE);
        ArrayList<Double> timeList = new ArrayList<Double>();

        meetListRepository.findByRezDateAndManagerId(day, managerId).forEach(
                s-> timeList.add(s.getRezTime())
        );

        return timeList;
    }
    @Override
    public ArrayList<HashMap<String, Object>> getManagerInfo(Integer classNum, Integer regionCode){

        List<User> userList = userRepository.findByClassNumAndRegionCode(classNum, regionCode);

        ArrayList<HashMap<String, Object>> manager = new ArrayList<HashMap<String, Object>>();

        userList.stream()
                .forEach(user -> {
                    HashMap<String, Object> info = new HashMap<String, Object>();
                    info.put("user_name", user.getUserName());
                    info.put("user_img", user.getUserImg());
                    info.put("is_admin", user.getIsAdmin());
                    info.put("user_idx", user.getUserIdx());
                    manager.add(info);
                });
        return manager;
    }

    @Override
    public List<MeetInfoDto> findAllByStudentId_UserIdx(Long userId) {
        List<MeetList> member = meetListRepository.findAllByStudentId_UserIdx(userId);

        ArrayList<MeetInfoDto> manager = new ArrayList<MeetInfoDto>();

        member.forEach(m->{
                // 관리자의 이름을 뽑아서 추출
                MeetInfoDto meetInfoDto = new MeetInfoDto();
                meetInfoDto.setName(m.getManagerId().getUserName());
                meetInfoDto.setMeetUrl(m.getMeetUrl());
                meetInfoDto.setReject(m.getReject());
                meetInfoDto.setTitle(m.getTitle());
                meetInfoDto.setRezTime(m.getRezTime());
                meetInfoDto.setRezDate(m.getRezDate());
                meetInfoDto.setState(m.getState());
                meetInfoDto.setCategory(m.getCategory());
                meetInfoDto.setRezIdx(m.getRezIdx());

                manager.add(meetInfoDto);
            }
        );

        return manager;
    }

    @Override
    public List<MeetInfoDto> findAllByManagerId_UserIdx(Long userId) {
        List<MeetList> member = meetListRepository.findAllByManagerId_UserIdx(userId);

        ArrayList<MeetInfoDto> manager = new ArrayList<MeetInfoDto>();

        member.forEach(m->{
                    // 교육생의 이름을 뽑아서 추출
                    MeetInfoDto meetInfoDto = new MeetInfoDto();
                    meetInfoDto.setName(m.getStudentId().getUserName());
                    meetInfoDto.setMeetUrl(m.getMeetUrl());
                    meetInfoDto.setReject(m.getReject());
                    meetInfoDto.setTitle(m.getTitle());
                    meetInfoDto.setRezTime(m.getRezTime());
                    meetInfoDto.setRezDate(m.getRezDate());
                    meetInfoDto.setState(m.getState());
                    meetInfoDto.setCategory(m.getCategory());
                    meetInfoDto.setRezIdx(m.getRezIdx());

                    manager.add(meetInfoDto);
                }
        );


        return manager;
    }

    @Override
    public MeetList findByRezIdx(Long rezIdx){
        return meetListRepository.findByRezIdx(rezIdx);
    }

    @Override
    public void update(MeetList meetList){ meetUpdateRepository.save(meetList);}

    @Override
    public void save(ReserveDto reserveDto) {
        meetUpdateRepository.save(reserveDto.toEntity());
    }

}
