package com.ssafy.ssafytime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;


@EnableJpaAuditing
@SpringBootApplication
public class SsafytimeApplication {

	public static void main(String[] args) {
		SpringApplication.run(SsafytimeApplication.class, args);
	}

}
