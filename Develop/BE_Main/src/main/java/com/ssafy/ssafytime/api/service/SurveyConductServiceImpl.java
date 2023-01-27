package com.ssafy.ssafytime.api.service;

import com.ssafy.ssafytime.db.repository.SurveyConductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("surveyConductService")
public class SurveyConductServiceImpl implements SurveyConductService {
    @Autowired
    SurveyConductRepository surveyConductRepository;
}
