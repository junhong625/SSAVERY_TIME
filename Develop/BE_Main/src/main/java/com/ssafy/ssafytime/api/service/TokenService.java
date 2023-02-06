package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.api.dto.TokenDto;
import com.ssafy.ssafytime.db.repository.UserRepository;
import com.ssafy.ssafytime.jwt.TokenProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class TokenService {
    private final TokenProvider tokenProvider;
    private final UserRepository userRepository;
    private final long refreshTokenValidityInMilliseconds;

    public TokenService(
            final TokenProvider tokenProvider,
            final UserRepository userRepository,
            @Value("${jwt.token-validity-in-seconds}") final long refreshTokenValidityInMilliseconds
    ){
        this.tokenProvider = tokenProvider;
        this.userRepository = userRepository;
        this.refreshTokenValidityInMilliseconds = refreshTokenValidityInMilliseconds;
    }

    public TokenDto createTokenDto(final Authentication authentication){
        final String accessToken = tokenProvider.createToken(authentication);
        final String refreshToken = tokenProvider.createRefreshToken();

        return new TokenDto(accessToken, refreshToken);
    }
}
