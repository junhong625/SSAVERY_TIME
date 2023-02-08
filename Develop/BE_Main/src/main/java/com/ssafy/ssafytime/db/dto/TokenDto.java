package com.ssafy.ssafytime.db.dto;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TokenDto {

    private String token;

    private String refreshToken;
}
