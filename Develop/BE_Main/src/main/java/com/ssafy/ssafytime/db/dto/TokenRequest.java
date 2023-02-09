package com.ssafy.ssafytime.db.dto;

import lombok.Getter;

@Getter
public class TokenRequest {

    private String token;
    private String refreshToken;
}
