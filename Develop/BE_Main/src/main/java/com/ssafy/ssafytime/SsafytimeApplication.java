package com.ssafy.ssafytime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

//스프링 시큐리티 해제 옵션
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)

//개발 종료시 해제옵션 제거
//@SpringBootApplication
public class SsafytimeApplication {

	public static void main(String[] args) {
		SpringApplication.run(SsafytimeApplication.class, args);
	}

}
