package com.ssafy.ssafytime.api.service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.api.dto.AttendanceDto;
import com.ssafy.ssafytime.db.dto.TokenDto;
import com.ssafy.ssafytime.db.dto.UserDto;
import com.ssafy.ssafytime.db.entity.Attendance;
import com.ssafy.ssafytime.db.entity.AttendanceId;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import com.ssafy.ssafytime.db.entity.Authority;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.AttendanceRepository;
import com.ssafy.ssafytime.db.repository.RefreshTokenRepository;
import com.ssafy.ssafytime.db.repository.UserRepository;
import com.ssafy.ssafytime.exception.DuplicateUserException;
import com.ssafy.ssafytime.exception.NotFoundUserException;
import com.ssafy.ssafytime.jwt.TokenProvider;
import com.ssafy.ssafytime.util.SecurityUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final TokenProvider tokenProvider;
    private final AttendanceRepository attendanceRepository;
    private final RefreshTokenRepository refreshTokenRepository;

    public UserService(UserRepository userRepository, TokenProvider tokenProvider, PasswordEncoder passwordEncoder,
                       AttendanceRepository attendanceRepository,
                       RefreshTokenRepository refreshTokenRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.tokenProvider = tokenProvider;
        this.attendanceRepository = attendanceRepository;
        this.refreshTokenRepository = refreshTokenRepository;
    }


    /**
     * UserEmail로 중복확인후 Authority와 User정보를 생성해 DB에 저장
     * @param userDto
     * @return
     */
    @Transactional
    public UserDto signup(UserDto userDto) {
        if (userRepository.findOneWithAuthoritiesByUserEmail(userDto.getUserEmail()).orElse(null) != null) {
            throw new DuplicateUserException("이미 가입되어 있는 유저입니다.");
        }

        Authority authority = Authority.builder()
                .authorityName("ROLE_USER")
                .build();

        User user = User.builder()

                .userName(userDto.getUserName())
                .password(passwordEncoder.encode(userDto.getPassword()))
                .userEmail(userDto.getUserEmail())
                .trackCode(userDto.getTrackCode())
                .regionCode(userDto.getRegionCode())
                .authorities(Collections.singleton(authority))
                .build();

        return UserDto.from(userRepository.save(user));
    }

    @Transactional(readOnly = true)
    public UserDto getUserWithAuthorities(String userEmail) {

        return UserDto.from(userRepository.findOneWithAuthoritiesByUserEmail(userEmail).orElse(null));
    }

    @Transactional(readOnly = true)
    public UserDto getMyUserWithAuthorities() {
        return UserDto.from(
                SecurityUtil.getCurrentUsername()
                        .flatMap(userRepository::findOneWithAuthoritiesByUserEmail)
                        .orElseThrow(() -> new NotFoundUserException("User not found"))
        );
    }

    @Transactional
    public void logout(TokenDto tokenDto){
        tokenProvider.validateAccessToken(tokenDto.getToken());

        Authentication authentication = tokenProvider.getAuthentication(tokenDto.getToken());

        String userEmail = authentication.getName();

        refreshTokenRepository.findRefreshTokenByUserEmail(userEmail);





    }

    public Optional<User> findById(Long Id) {
        return userRepository.findById(Id);
    }

    public Long count() {
        return userRepository.count();
    }

//    public List<User> findByIsAdminAndAlarm(int isAdmin, int alarm) {
//        return userRepository.findByIsAdminAndAlarm(isAdmin, alarm);
//    }

    public void save(Optional<User> user) {
        userRepository.save(user.get());
    }
}
