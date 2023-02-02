package com.ssafy.ssafytime.api.service;

import java.util.Collections;
import java.util.Optional;

import com.ssafy.ssafytime.api.dto.UserDto;
import com.ssafy.ssafytime.db.entity.Authority;
import com.ssafy.ssafytime.db.entity.User;
import com.ssafy.ssafytime.db.repository.UserRepository;
import com.ssafy.ssafytime.exception.DuplicateUserException;
import com.ssafy.ssafytime.exception.NotFoundUserException;
import com.ssafy.ssafytime.util.SecurityUtil;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
//    private final AttendanceRepository attendanceRepository;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder
//                       AttendanceRepository attendanceRepository
    ) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
//        this.attendanceRepository = attendanceRepository;
    }

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
    public UserDto getUserWithAuthorities(String username) {

        return UserDto.from(userRepository.findOneWithAuthoritiesByUserEmail(username).orElse(null));
    }

    @Transactional(readOnly = true)
    public UserDto getMyUserWithAuthorities() {
        return UserDto.from(
                SecurityUtil.getCurrentUsername()
                        .flatMap(userRepository::findOneWithAuthoritiesByUserEmail)
                        .orElseThrow(() -> new NotFoundUserException("User not found"))
        );
    }

    public Optional<User> findById(Long Id) {
        return userRepository.findById(Id);
    }

}
