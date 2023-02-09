package com.ssafy.ssafytime.db.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class TokenResponse {
    private final String token;
    private final String refreshToken;


}
