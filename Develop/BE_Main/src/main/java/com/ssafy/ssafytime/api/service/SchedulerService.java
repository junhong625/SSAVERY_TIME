package com.ssafy.ssafytime.api.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class SchedulerService {

    @Scheduled(cron = "0/10 * * * * *")
    public void run(){
        System.out.println("10초에 1번");
    }

}
