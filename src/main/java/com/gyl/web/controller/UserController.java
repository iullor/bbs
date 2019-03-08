package com.gyl.web.controller;

import com.gyl.entity.User;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户控制的controller
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户注册
     *
     * @return
     */
    @RequestMapping(value = "/save")
    public String add(User user) {
        System.out.println("UserController.save");
        userService.add(user);
        return "redirect:/logon";
    }

    /**
     * 用户修改
     *
     * @return
     */
    @RequestMapping(value = "/update")
    public String update() {
        return "update";
    }


}
