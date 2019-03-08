package com.gyl.web.controller;

import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 系统的操作控制器
 */
@Controller
public class IndexController {
    @Autowired
    private UserService userService;

    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/index")
    public String index() {
        System.out.println("IndexController.toIndex...run...");
        return "index";
    }

    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/logon")
    public String toLogon() {
        System.out.println("IndexController.toIndex...run...");
        return "logon";
    }

    /**
     * 用户登录
     *
     * @return
     */
    @RequestMapping(value = "/checkLogon")
    public String login(@RequestParam(value = "username") String username, @RequestParam(value = "password") String password, HttpServletRequest request) {

        Map<String, Object> userInfo = userService.checkUser(username, password);
        request.getSession().setAttribute("USER_STATUS", userInfo.get("USER_STATUS"));
        if (userInfo.get("user") != null) {
            request.getSession().setAttribute("user", userInfo.get("user"));
            return "redirect:/index";
        }
        return "redirect:/logon";
    }

    /**
     * 用户注销
     *
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout() {

        return "logout";
    }


    /**
     * 用户跳转到注册页面
     *
     * @return
     */
    @RequestMapping(value = "/register")
    public String toRegister() {

        return "register";
    }


    /**
     * 用户全局搜索
     *
     * @return
     */
    @RequestMapping(value = "/globalSearch")
    public String globalSearch() {

        return "search";
    }

}
