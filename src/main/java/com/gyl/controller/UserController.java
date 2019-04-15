package com.gyl.controller;

import com.gyl.entity.User;
import com.gyl.entity.UserAccountStatus;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 用户注册登录
 * controller
 *
 * @author gyl
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户注册,发送一条激活邮件
     *
     * @return
     */
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String add(User user) {
        System.out.println("普通注册的用户");
        int add = userService.add(user);
        return "redirect:/account/activeInfo";
    }


    @RequestMapping(value = "/user/updateAccount", method = RequestMethod.PUT)
    public String updateAccount(User user, HttpServletRequest request) {
        User user1 = userService.selectUserById(user.getId());
        user1.setUsername(user.getUsername());
        if (user.getPassword() != null && user.getPassword() != "") {
            user1.setPassword(user.getPassword());
        }
        user1.setNickName(user.getNickName());
        user1.setEmail(user.getEmail());
        user1.getUserBaseInfo().setHeadImage(user.getUserBaseInfo().getHeadImage());
        int status = userService.update(user1);
        request.getSession().invalidate();
        return "redirect:/account/activeInfo";
    }

    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/logon")
    public String toLogon() {

        return "logon";
    }

    /**
     * 用户登录
     *
     * @return
     */
    @RequestMapping(value = "/checkLogon", method = RequestMethod.GET)
    public String login(@RequestParam(value = "username") String username, @RequestParam(value = "password") String password, HttpServletRequest request) {

        Map<String, Object> userInfo = userService.checkUser(username, password);
        request.getSession().setAttribute("USER_STATUS", userInfo.get("USER_STATUS"));
        if (userInfo.get("user") != null) {
            request.getSession().setAttribute("CURRENT_USER", userInfo.get("user"));
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
    public String logout(HttpServletRequest request) {
        //清空session
        request.getSession().invalidate();
        return "logon";
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
     * 重置密码
     *
     * @return
     */
    @RequestMapping("/resetPassword")
    public String resetPassowrd() {
        return "/reset_password";
    }

}
