package com.gyl.mapper;

import com.gyl.entity.Test;
import org.springframework.stereotype.Repository;

@Repository
public interface TestMapper {
    int save(Test test);
}
