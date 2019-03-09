package com.gyl.service;

import com.gyl.commons.StatusCode;
import com.gyl.commons.UUIDString;
import com.gyl.entity.User;
import com.gyl.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    private Map<String, Object> userLogonInfo = null;

    public int add(User user) {
        user.setId(UUIDString.createId());
        user.setCreateTime(new Date(System.currentTimeMillis()));
        user.setStatus(StatusCode.USER_NOT_ACTIVE);
        return userMapper.add(user);
    }

    /**
     * 根据用户名和密码找用户
     * 把用户登录的信息封装在userLogonInfo中
     * 包含错误状态码和用户信息
     *
     * @param username
     * @param password
     */
    public Map<String, Object> checkUser(String username, String password) {
        System.out.println("UserService.checkUser......");
        userLogonInfo = new HashMap<String, Object>();
        User user = userMapper.checkUser(username);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                if (user.getStatus().equals(StatusCode.USER_NORMAL)) {
                    userLogonInfo.put("USER_STATUS", StatusCode.USER_NORMAL);
                    userLogonInfo.put("SUCCESS_LOGON", StatusCode.SUCCESS_LOGON);
                    userLogonInfo.put("user", user);
                    return userLogonInfo;
                }
                if (user.getStatus().equals(StatusCode.USER_NOT_ACTIVE)) {
                    userLogonInfo.put("USER_STATUS", StatusCode.USER_NOT_ACTIVE);
                    return userLogonInfo;
                }
                userLogonInfo.put("USER_STATUS", StatusCode.USER_FREESON);
                return userLogonInfo;
            }
            userLogonInfo.put("USER_STATUS", StatusCode.USER_PASSWORD_ERROR);
            return userLogonInfo;
        }
        userLogonInfo.put("USER_STATUS", StatusCode.USER_NOT_EXIT);
        return userLogonInfo;
    }
}
