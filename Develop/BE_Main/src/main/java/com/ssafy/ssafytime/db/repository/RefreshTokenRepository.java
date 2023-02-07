package com.ssafy.ssafytime.db.repository;

import com.ssafy.ssafytime.db.entity.RefreshToken;
import com.ssafy.ssafytime.db.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Long> {
    Optional<User> findByRefreshToken(String refreshToken);
    Optional<User> findRefreshTokenByUserEmail(String refreshToken);

}
