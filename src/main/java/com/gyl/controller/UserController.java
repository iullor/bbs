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

import javax.servlet.http.HttpServletRequest;
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
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String list(ModelMap map) {
        List<User> users = userService.list();
        map.addAttribute("users", users);
        return "admin/user/list";

    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.PUT)
    public String update(User user) {
        userService.selectUserById(user.getId());
        int status = userService.update(user);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") String id) {
        int stauts = userService.delete(id);
        return "redirect:/admin/user";
    }


    /**
     * 以下三个都是查询，最好把当前的user，传递过来
     * <p>
     * 后期再做优化，同过id去查user
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/loginStatus/{id}", method = RequestMethod.GET)
    public String loginStatus(@PathVariable("id") String id, ModelMap map) {
        User user = userService.selectUserById(id);
        map.addAttribute("user", user);
        return "admin/user/loginStatus";
    }


    /**
     * 查看用户基本信息
     *
     * @param id
     * @param map
     * @return
     */
    @RequestMapping(value = "/admin/user/userBaseInfo/{id}", method = RequestMethod.GET)
    public String userBaseInfo(@PathVariable("id") String id, ModelMap map) {
        User user = userService.selectUserById(id);
        map.addAttribute("user", user);
        return "admin/user/userBaseInfo";
    }

    /**
     * 后台添加的
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/admin/user/add", method = RequestMethod.POST)
    public String addUserByAdmin(User user) {
        System.out.println("admin 添加的user");
        int add = userService.add(user);
        return "redirect:/admin/user";
    }


    /**
     * 更新账户状态
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/admin/user/updateUserAccountStatus")
    public String updateUserStatus(String id, UserAccountStatus userAccountStatus) {
        User user = userService.selectUserById(id);

        /**
         * 如果前台为选中on
         */
        if (userAccountStatus.getAllowComment() != null && userAccountStatus.getAllowComment().equals("on")) {
            userAccountStatus.setAllowComment("1");
        } else {
            userAccountStatus.setAllowComment("0");
        }
        if (userAccountStatus.getAllowPost() != null && userAccountStatus.getAllowPost().equals("on")) {
            userAccountStatus.setAllowPost("1");
        } else {
            userAccountStatus.setAllowPost("0");
        }
        user.setUserAccountStatus(userAccountStatus);
        user.getUserBaseInfo();
        user.getUserLoginInfo();
        userService.update(user);
        return "redirect:/admin/user";
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
        return "redirect:/logon";
    }

}
