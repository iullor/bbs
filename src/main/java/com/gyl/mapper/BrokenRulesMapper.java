package com.gyl.mapper;

import com.gyl.entity.BrokenRules;
import org.springframework.stereotype.Repository;

@Repository
public interface BrokenRulesMapper {
    int deleteById(Integer id);

    int insert(BrokenRules record);

    BrokenRules selectById(Integer id);

    int updateById(BrokenRules record);
}