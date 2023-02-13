package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.entity.RefreshToken;
import com.ssafy.ssafytime.db.repository.RefreshTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
public class SchedulerService {
    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    @Scheduled(cron = "0 0 5 * * *")
    @Transactional
    public void run(){
        LocalDateTime time = LocalDateTime.now();

        refreshTokenRepository.deleteByExpiredAt(time);
        System.out.println("만료된 리프레시 토큰 삭제해버렸어요~~");
    }

}
