package com.ssafy.ssafytime.db.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Builder
@Entity
@Getter
@Table(name = "refresh_token")
@NoArgsConstructor
@AllArgsConstructor
public class RefreshToken {

    @Id
    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "token")
    private String token;


    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "timeout")
    private Long timeout;



}
