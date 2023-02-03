package com.ssafy.ssafytime.api.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ExceptionResponse {
    private Boolean isSuccess;
    private String message;
    private HttpStatus status;
    private Object data;
}