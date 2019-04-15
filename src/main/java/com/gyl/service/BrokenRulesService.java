package com.gyl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.gyl.mapper.BrokenRulesMapper;
import com.gyl.entity.BrokenRules;

/**
 * 违规的信息
 *
 * @author gyl
 */
@Service
public class BrokenRulesService {

    @Autowired
    private BrokenRulesMapper brokenRulesMapper;


    public int deleteById(Integer id) {
        return brokenRulesMapper.deleteById(id);
    }


    public int insert(BrokenRules record) {
        return brokenRulesMapper.insert(record);
    }


    public BrokenRules selectById(Integer id) {
        return brokenRulesMapper.selectById(id);
    }


    public int updateById(BrokenRules record) {
        return brokenRulesMapper.updateById(record);
    }

}
