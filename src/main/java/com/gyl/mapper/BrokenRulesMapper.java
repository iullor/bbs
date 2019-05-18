package com.gyl.mapper;

import com.gyl.entity.BrokenRules;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BrokenRulesMapper {
    int deleteById(Integer id);

    int insert(BrokenRules record);

    BrokenRules selectById(Integer id);

    int updateById(BrokenRules record);

    /**
     * 查出来用户违规的信息
     * @return
     */
    List<BrokenRules> list();
}