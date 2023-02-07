package com.ssafy.ssafytime.api.controller;

import com.ssafy.ssafytime.api.dto.LoginDto;
import com.ssafy.ssafytime.api.dto.TokenDto;
import com.ssafy.ssafytime.api.service.AuthService;
import com.ssafy.ssafytime.api.service.TokenService;
import com.ssafy.ssafytime.api.service.UserService;
import com.ssafy.ssafytime.jwt.JwtFilter;
import com.ssafy.ssafytime.jwt.TokenProvider;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/api")
public class AuthController {
    private final TokenProvider tokenProvider;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;

    private final UserService userService;
    private final TokenService tokenService;
    private final AuthService authService;

    public AuthController(TokenProvider tokenProvider, TokenService tokenService, UserService userService, AuthenticationManagerBuilder authenticationManagerBuilder, final AuthService authService) {
        this.tokenProvider = tokenProvider;
        this.authenticationManagerBuilder = authenticationManagerBuilder;
        this.authService = authService;
        this.tokenService = tokenService;
        this.userService = userService;
    }


    /*
     이메일, 비밀번호 입력으로 authenticationToken객체를 생성하고 authenticate메소드가 실행될때
     customuserdetailservice의 loadbyusername메소드가 실행
      그결과 값으로 authentication 객체를 생성후 SecurityContext에 저장하고
      createtoken메소드를 통해 JWT 토큰 생성
      토큰을 Response header에도 넣어주고 response body에도 넣어서 반환
     */
    @PostMapping("/login")
    public ResponseEntity<TokenDto> authorize(@Valid @RequestBody LoginDto loginDto) {

        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(loginDto.getUserEmail(), loginDto.getPassword());



        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);

        TokenDto tokenDto = tokenService.createTokenDto(authentication);



        tokenService.saveRefreshToken(authentication.getName(), tokenDto.getRefreshToken());

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add(JwtFilter.AUTHORIZATION_HEADER, "Bearer " + tokenDto.getToken());
        return new ResponseEntity<>(tokenDto, httpHeaders, HttpStatus.OK);
    }


    @PostMapping("/refresh-token")
    public ResponseEntity<TokenDto> refreshToken(@Valid @RequestBody final TokenDto tokenDto){
        final TokenDto tokenDto1 = authService.refreshToken(tokenDto);

        final HttpHeaders httpHeaders = new HttpHeaders();
        System.out.println("=--=-=-=-=-=-=-==-=-여기에요 여기-==--=-=-=-=-=");
        httpHeaders.setBearerAuth(tokenDto1.getToken());

        return new ResponseEntity<>(tokenDto1, httpHeaders, HttpStatus.OK);
    }



}
