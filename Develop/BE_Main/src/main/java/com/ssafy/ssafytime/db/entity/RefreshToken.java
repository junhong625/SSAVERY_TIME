package com.ssafy.ssafytime.db.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Builder
@Entity
@Getter
@Table(name = "refresh_token")
@NoArgsConstructor
@AllArgsConstructor
public class RefreshToken {

    @Id
    @Column(name = "user_idx")
    private Long userIdx;

    @Column(name = "token")
    private String token;

    @Column(name = "timeout")
    private Long timeout;



}
