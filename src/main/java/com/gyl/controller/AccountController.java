package com.gyl.controller;

import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gyl
 */
@Controller
public class AccountController {
    @Autowired
    private UserService userService;

    @RequestMapping("/account/{id}")
    public String list(@PathVariable("id") String id) {
        userService.selectUserById(id);
        return "/account";
    }

    @RequestMapping("/account/active/{id}")
    public String active(@PathVariable("id") String id) {
        int status = userService.activeAccountById(id);
        return "redirect:/logon";
    }

    /**
     * 提醒用户去查看有下邮箱激活账号
     *
     * @return
     */
    @RequestMapping("/account/activeInfo")
    public String activeInfo() {
        return "/acount_active_info";
    }
}
