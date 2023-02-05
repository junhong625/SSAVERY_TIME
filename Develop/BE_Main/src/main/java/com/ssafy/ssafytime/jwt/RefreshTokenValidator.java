package com.ssafy.ssafytime.jwt;

import com.ssafy.ssafytime.db.entity.RefreshToken;
import com.ssafy.ssafytime.db.repository.RefreshTokenRepository;
import org.springframework.stereotype.Component;
import org.webjars.NotFoundException;

@Component
public class RefreshTokenValidator {
    private final TokenProvider tokenProvider;
    private final RefreshTokenRepository refreshTokenRepository;

    public RefreshTokenValidator(
            final TokenProvider tokenProvider,
            RefreshTokenRepository refreshTokenRepository
    ){
        this.tokenProvider = tokenProvider;
        this.refreshTokenRepository = refreshTokenRepository;
    }

    public boolean validate(final Long userIdx, final String refreshToken){
        final RefreshToken savedRefreshToken = getSavedRefreshToken(userIdx);
        return
    }


    private RefreshToken getSavedRefreshToken(final Long userIdx){
        return refreshTokenRepository.findById(userIdx)
                .orElseThrow(()-> new NotFoundException("리프레쉬 토큰을 찾을 수 없습니다."));
    }
}
