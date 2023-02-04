package com.ssafy.ssafytime.api.firebase;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class TokenDTO {
    private String targetToken;
    private String title;
    private String body;

    @Builder TokenDTO(String targetToken, String title, String body) {
        this.targetToken = targetToken;
        this.title = title;
        this.body = body;
    }


}
