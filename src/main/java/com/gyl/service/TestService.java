package com.gyl.service;

import com.gyl.entity.Test;
import com.gyl.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
    @Autowired
    private TestMapper testMapper;

    public int save(Test test) {
        System.out.println("TestService.save");
        return testMapper.save(test);
    }

}
