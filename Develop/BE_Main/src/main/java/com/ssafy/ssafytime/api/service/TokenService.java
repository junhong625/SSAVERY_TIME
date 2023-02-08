package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.api.dto.TokenDto;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.RefreshTokenRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import com.ssafy.ssafytime.jwt.TokenProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class TokenService {
    private final TokenProvider tokenProvider;
    private final long refreshTokenValidityInMilliseconds;
    private final RefreshTokenRepository refreshTokenRepository;
    private final UserRepository userRepository;

    public TokenService(
            final TokenProvider tokenProvider,
            final UserRepository userRepository,
            @Value("${jwt.token-validity-in-seconds}") final long refreshTokenValidityInMilliseconds,
            RefreshTokenRepository refreshTokenRepository){
        this.tokenProvider = tokenProvider;
        this.userRepository = userRepository;
        this.refreshTokenValidityInMilliseconds = refreshTokenValidityInMilliseconds;
        this.refreshTokenRepository = refreshTokenRepository;
    }

    public TokenDto createTokenDto(final Authentication authentication){
        final String accessToken = tokenProvider.createToken(authentication);
        final String refreshToken = tokenProvider.createRefreshToken();

        return new TokenDto(accessToken, refreshToken);
    }

    public void saveRefreshToken(final String userIdx, String refreshToken){
        User user = userRepository.findByUserEmail(userIdx).orElse(null);
        user.setRefreshToken(refreshToken);
        user.setTimeout(refreshTokenValidityInMilliseconds);
        userRepository.save(user);
    }

    public void invalidateRefreshToken(final Long userIdx){
        invalidateRefreshToken(userIdx.toString());
    }

    public void invalidateRefreshToken(final String userIdx){
        userRepository.deleteById(Long.valueOf(userIdx));
    }
}
