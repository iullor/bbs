package com.gyl.web.controller;

import com.gyl.entity.User;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 用户控制的controller
 *
 * @author gyl
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * admin的操作
     */
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String list(ModelMap map) {
        List<User> users = userService.list();
        map.addAttribute("users", users);
        return "admin/user/list";

    }

    @RequestMapping(value = "/user", method = RequestMethod.PUT)
    public String update(User user) {
        userService.selectUserById(user.getId());
        int status = userService.update(user);
        return "redirect:/user";
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") String id) {
        int stauts = userService.delete(id);
        return "redirect:/user";
    }


    /**
     * 以下三个都是查询，最好把当前的user，传递过来
     * <p>
     * 后期再做优化，同过id去查user
     *
     * @return
     */
    @RequestMapping(value = "/user/loginStatus/{id}", method = RequestMethod.GET)
    public String loginStatus(@PathVariable("id") String id, ModelMap map) {
        User user = userService.selectUserById(id);
        map.addAttribute("user", user);
        return "admin/user/loginStatus";
    }

    /**
     * 更新账户状态
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/user/updateUserAccountStatus")
    public String updateUserStatus(User user) {
        User user1 = userService.selectUserById(user.getId());
        user1.setUserAccountStatus(user.getUserAccountStatus());
        userService.update(user1);
        return "redirect:/user";
    }


    @RequestMapping(value = "/user/userBaseInfo/{id}", method = RequestMethod.GET)
    public String userBaseInfo(@PathVariable("id") String id, ModelMap map) {
        User user = userService.selectUserById(id);
        map.addAttribute("user", user);
        return "admin/user/userBaseInfo";
    }

    /**
     * 用户注册
     *
     * @return
     */
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String add(User user) {
        System.out.println("普通注册的用户");
        int add = userService.add(user);
        return "redirect:/logon";
    }

    /**
     * 后台添加的
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public String addUserByAdmin(User user) {
        System.out.println("admin 添加的user");
        int add = userService.add(user);
        return "redirect:/user";
    }


}
