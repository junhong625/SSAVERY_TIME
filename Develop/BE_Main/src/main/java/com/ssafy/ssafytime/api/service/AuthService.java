package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.api.dto.TokenDto;
import com.ssafy.ssafytime.jwt.RefreshTokenValidator;
import com.ssafy.ssafytime.jwt.TokenProvider;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    private final RefreshTokenValidator refreshTokenValidator;
    private final TokenProvider tokenProvider;
    private final TokenService tokenService;

    public AuthService(
        final RefreshTokenValidator refreshTokenValidator,
        final TokenProvider tokenProvider,
        final TokenService tokenService
    ){
        this.refreshTokenValidator = refreshTokenValidator;
        this.tokenService = tokenService;
        this.tokenProvider = tokenProvider;
    }

    public TokenDto refreshToken(final TokenDto tokenDto){
        final String accessToken = tokenDto.getToken();
        final String refreshToken = tokenDto.getRefreshToken();

        final Authentication authentication = tokenProvider.getAuthentication(accessToken);




    }

    private void validateRefreshToken(final String userIdx, String refreshToken){
        if(!refreshTokenValidator.validate(userIdx,refreshToken)){
            tokenService.
        }
    }


}

