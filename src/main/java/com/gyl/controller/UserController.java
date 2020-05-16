package com.gyl.controller;

import com.gyl.entity.User;
import com.gyl.entity.UserAccountStatus;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 用户注册登录
 * controller
 *
 *
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
        request.getSession().removeAttribute("CURRENT_USER");
        return "redirect:/logon";
    }


    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/logon")
    public String logon(HttpServletRequest request) {
        //首先移除掉,清除之前的提示信息
        request.getSession().removeAttribute("USER_STATUS");
        return "logon";
    }

    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/toLogon")
    public String toLogon(HttpServletRequest request) {
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
        //重新设置
        request.getSession().setAttribute("USER_STATUS", userInfo.get("USER_STATUS"));
        User user = (User) userInfo.get("user");
        if (user != null) {
            request.getSession().setAttribute("CURRENT_USER", userInfo.get("user"));
            //更新用户的访问时间
            user.getUserLoginInfo().setAccessTime(new Date(System.currentTimeMillis()));
            //访问次数加1
            user.getUserLoginInfo().setAccessNum(user.getUserLoginInfo().getAccessNum() + 1);
            //获取用户的访问ip地址
            String ipAddress = UserController.getIPAddress(request);
            user.getUserLoginInfo().setIpAdreess(ipAddress);
            int state = userService.update(user);
            return "redirect:/index";
        }
        return "redirect:/toLogon";
    }


    /**
     * 用户注销
     *
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        try {
            //清空session
            User user = (User) request.getSession().getAttribute("CURRENT_USER");
            //记录离开时间
            user.getUserLoginInfo().setLeftTime(new Date(System.currentTimeMillis()));
            int status = userService.update(user);
            request.getSession().invalidate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:/logon";
        }
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

    //获取用户的真实ip地址
    public static String getIPAddress(HttpServletRequest request) {
        String ip = null;

        //X-Forwarded-For：Squid 服务代理
        String ipAddresses = request.getHeader("X-Forwarded-For");

        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
            //Proxy-Client-IP：apache 服务代理
            ipAddresses = request.getHeader("Proxy-Client-IP");
        }

        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
            //WL-Proxy-Client-IP：weblogic 服务代理
            ipAddresses = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
            //HTTP_CLIENT_IP：有些代理服务器
            ipAddresses = request.getHeader("HTTP_CLIENT_IP");
        }

        if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
            //X-Real-IP：nginx服务代理
            ipAddresses = request.getHeader("X-Real-IP");
        }

        //有些网络通过多层代理，那么获取到的ip就会有多个，一般都是通过逗号（,）分割开来，并且第一个ip为客户端的真实IP
        if (ipAddresses != null && ipAddresses.length() != 0) {
            ip = ipAddresses.split(",")[0];
        }

        //还是不能获取到，最后再通过request.getRemoteAddr();获取
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 在发帖前检查是否登录
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/postCheckLogin", method = RequestMethod.GET)
    public Integer postCheckLogin(HttpServletRequest request) {
        Object current_user = request.getSession().getAttribute("CURRENT_USER");
        if (current_user != null) {
            return 1;
        }
        return 0;
    }

    @RequestMapping(value = "/user/resetPassword", method = RequestMethod.POST)
    public String resetPassword(String username, String email) {
        //根据用户名和邮箱对密码进行重置
        int status = userService.resetPassword(username, email);
        return "redirect:/logon";
    }


}
