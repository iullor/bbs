package com.gyl.service;

import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.gyl.mapper.BrokenRulesMapper;
import com.gyl.entity.BrokenRules;

import java.util.List;

/**
 * 违规的信息
 *
 * @author gyl
 */
@Service
public class BrokenRulesService {

    @Autowired
    private BrokenRulesMapper brokenRulesMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PostService postService;

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


    public List<BrokenRules> list() {
        List<BrokenRules> brokenRules = brokenRulesMapper.list();
        if (brokenRules != null) {
            for (BrokenRules brokenRules1 : brokenRules) {
                String userId = brokenRules1.getUserId();
                String postId = brokenRules1.getPostId();
                User user = userMapper.selectUserById(userId);
                Post post = postService.selectPostById(postId);
                brokenRules1.setUser(user);
                brokenRules1.setPost(post);
            }
        }
        return brokenRules;
    }
}
