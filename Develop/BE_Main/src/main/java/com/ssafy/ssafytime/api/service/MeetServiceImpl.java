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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service("meetService")
public class MeetServiceImpl implements MeetService{
    @Autowired
    MeetListRepository meetListRepository;
    @Autowired
    MeetUpdateRepository meetUpdateRepository;
    @Autowired
    UserRepository userRepository;

    // 날짜와 매니저의 id정보를 가지고 해당 날짜에 신청되어 있는 시간 정보 리스트를 반환
    @Override
    public List<Double> findByRezDateAndManagerId(String date , Long managerId){
        LocalDate day = LocalDate.parse(date, DateTimeFormatter.ISO_DATE);
        ArrayList<Double> timeList = new ArrayList<Double>();
        User manager = userRepository.findById(managerId).get();
        meetListRepository.findByRezDateAndManagerId(day, manager).forEach(
                s-> timeList.add(s.getRezTime())
        );

        return timeList;
    }

    // 교육생 본인의 반번호와 지역코드를 사용하여 해당하는 매니저들의 정보 호출
    @Override
    public ArrayList<HashMap<String, Object>> getManagerInfo(Integer classNum, Integer regionCode){

        List<User> userList = userRepository.findByClassNumAndRegionCode(classNum, regionCode);

        ArrayList<HashMap<String, Object>> manager = new ArrayList<HashMap<String, Object>>();

        userList.stream()
                .forEach(user -> {

                    HashMap<String, Object> info = new HashMap<String, Object>();
                    if(user.getIsAdmin()!=0) {

                        info.put("user_name", user.getUserName());
                        info.put("user_img", user.getUserImg());
                        info.put("is_admin", user.getIsAdmin());
                        info.put("user_idx", user.getUserIdx());
                        manager.add(info);
                    }

                });
        return manager;
    }

    // 예약 정보와 상대의 이름을 호출 ( 교육생 기준 )
    @Override
    public List<MeetInfoDto> findAllByStudentId_UserIdx(Long userId) {
        List<MeetList> member = meetListRepository.findAllByStudentId_UserIdx(userId);

        ArrayList<MeetInfoDto> manager = new ArrayList<MeetInfoDto>();

        // 현재 시간
        String[] dateTime = LocalDateTime.now().toString().split("T");
        int nowDate = Integer.parseInt(dateTime[0].toString().replace("-", ""));
        int nowHour = Integer.parseInt(dateTime[1].split(":")[0]);
        int nowMin = Integer.parseInt(dateTime[1].split(":")[1]);
        int nowTime;
        if(nowMin > 30){
            nowTime = nowHour + 1;
        }
        else{
            nowTime = nowHour;
        }

        member.forEach(m->{
                // 종료시간이 지났다면


                // 관리자의 이름을 뽑아서 추출
                MeetInfoDto meetInfoDto = new MeetInfoDto();
                meetInfoDto.setName(m.getManagerId().getUserName());
                meetInfoDto.setMeetUrl(m.getMeetUrl());
                meetInfoDto.setReject(m.getReject());
                meetInfoDto.setTitle(m.getTitle());

                meetInfoDto.setRezTime(m.getRezTime());
                meetInfoDto.setRezDate(m.getRezDate());

                // 시간이 지났으면 state 4(종료)로 변경
                if(nowDate >= Integer.parseInt(m.getRezDate().toString().replace("-", "")) && nowTime >= m.getRezTime() ) {
                    m.setState(4L); // 4(종료) (entity)
                    meetUpdateRepository.save(m);// 4(종료) (db)
                }
                meetInfoDto.setState(m.getState());
                meetInfoDto.setCategory(m.getCategory());
                meetInfoDto.setRezIdx(m.getRezIdx());
                meetInfoDto.setSubTime(m.getSubTime());

                manager.add(meetInfoDto);
            }
        );

        return manager;
    }
    // 예약 정보와 상대의 이름을 호출 ( 매니저 기준 )
    @Override
    public List<MeetInfoDto> findAllByManagerId_UserIdx(Long userId) {
        List<MeetList> member = meetListRepository.findAllByManagerId_UserIdx(userId);

        ArrayList<MeetInfoDto> manager = new ArrayList<MeetInfoDto>();

        // 현재 시간
        String[] dateTime = LocalDateTime.now().toString().split("T");
        int nowDate = Integer.parseInt(dateTime[0].toString().replace("-", ""));
        int nowHour = Integer.parseInt(dateTime[1].split(":")[0]);
        int nowMin = Integer.parseInt(dateTime[1].split(":")[1]);
        int nowTime;
        if(nowMin > 30){
            nowTime = nowHour + 1;
        }
        else{
            nowTime = nowHour;
        }

        member.forEach(m->{
                    // 교육생의 이름을 뽑아서 추출
                    MeetInfoDto meetInfoDto = new MeetInfoDto();
                    meetInfoDto.setName(m.getStudentId().getUserName());
                    meetInfoDto.setMeetUrl(m.getMeetUrl());
                    meetInfoDto.setReject(m.getReject());
                    meetInfoDto.setTitle(m.getTitle());
                    meetInfoDto.setRezTime(m.getRezTime());
                    meetInfoDto.setRezDate(m.getRezDate());
                    // 시간이 지났으면 state 4(종료)로 변경
                    if(nowDate >= Integer.parseInt(m.getRezDate().toString().replace("-", "")) && nowTime >= m.getRezTime() ) {
                        m.setState(4L); // 4(종료) (entity)
                        meetUpdateRepository.save(m);// 4(종료) (db)
                    }
                    meetInfoDto.setState(m.getState());
                    meetInfoDto.setCategory(m.getCategory());
                    meetInfoDto.setRezIdx(m.getRezIdx());
                    meetInfoDto.setSubTime(m.getSubTime());

                    manager.add(meetInfoDto);
                }
        );


        return manager;
    }

    // 예약된 상담정보 호출
    @Override
    public MeetList findByRezIdx(Long rezIdx){
        return meetListRepository.findByRezIdx(rezIdx);
    }

    // 예약 정보 수정 ( 거절 사유에 사용 )
    @Override
    public void update(MeetList meetList){ meetUpdateRepository.save(meetList);}
    
    // 예약 입력
    @Override
    public void save(ReserveDto reserveDto) {

        User std = userRepository.findById(reserveDto.getStudentId()).get();
        User manager = userRepository.findById(reserveDto.getManagerId()).get();

        String[] timeSplit = reserveDto.getRezTime().split(":");
        Double rezTime = Double.parseDouble(timeSplit[0]) + ((Double.parseDouble(timeSplit[1]) / 6) * 0.1);

        meetUpdateRepository.save(reserveDto.toEntity(std, manager, rezTime));
    }

}
