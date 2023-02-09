package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.dto.TokenDto;
import com.ssafy.ssafytime.jwt.RefreshTokenValidator;
import com.ssafy.ssafytime.jwt.TokenProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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

        validateRefreshToken(authentication.getName(), refreshToken);


        final TokenDto tokenDto1 = tokenService.createTokenDto(authentication);

        tokenService.saveRefreshToken(authentication.getName(), tokenDto1.getRefreshToken());

        return tokenDto1;

    }

    private void validateRefreshToken(final String userIdx, String refreshToken){
        if(!refreshTokenValidator.validate(userIdx,refreshToken)){
            tokenService.invalidateRefreshToken(userIdx);
            throw new BadCredentialsException("리프레쉬 토큰이 유효하지 않습니다.");
        }
    }


}
