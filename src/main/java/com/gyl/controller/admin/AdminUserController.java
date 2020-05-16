package com.gyl.controller.admin;

import com.gyl.commons.page.PageResult;
import com.gyl.entity.BrokenRules;
import com.gyl.entity.User;
import com.gyl.entity.UserAccountStatus;
import com.gyl.service.BrokenRulesService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 管理员对用户的控制
 *
 *
 */
@Controller
public class AdminUserController {


    @Autowired
    private UserService userService;
    @Autowired
    private BrokenRulesService brokenRulesService;

    /**
     * admin的操作
     */
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String list(ModelMap map, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 5;
        }
        List<User> users = userService.list();
        PageResult pageResult = userService.sortPageByAdmin(users, currentPage, pageSize);
        users = pageResult.getNewPage();
        map.addAttribute("pageResult", pageResult);
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
        UserAccountStatus userAccountStatus1 = user.getUserAccountStatus();
        /**
         * 如果前台为选中on
         */
        if (userAccountStatus.getAllowComment() != null && userAccountStatus.getAllowComment().equals("on")) {
            userAccountStatus1.setAllowComment("1");
        } else {
            userAccountStatus1.setAllowComment("0");
        }
        if (userAccountStatus.getAllowPost() != null && userAccountStatus.getAllowPost().equals("on")) {
            userAccountStatus1.setAllowPost("1");
        } else {
            userAccountStatus1.setAllowPost("0");
        }
        userAccountStatus1.setStatus(userAccountStatus.getStatus());
        userAccountStatus1.setWarningInfo(userAccountStatus.getWarningInfo());

        user.setUserAccountStatus(userAccountStatus1);
        int status = userService.update(user);
        return "redirect:/admin/user";
    }

    /**
     * 违规用户
     *
     * @return
     */
    @RequestMapping("/admin/user/brokeRolesUser")
    public String brokeRolesUser(Model model) {
        List<BrokenRules> brokenRulesUsers = brokenRulesService.list();
        model.addAttribute("brokenRulesUsers", brokenRulesUsers);
        return "/admin/user/brokenRulesUsersList";
    }


    /**
     * 通过用户的名字去查找
     *
     * @return
     */
    @RequestMapping(value = "/admin/user/searchByNickName", method = RequestMethod.GET)
    public String searchByNickName(String nickName,ModelMap map) {
        //默认值
        int currentPage = 1;
        int pageSize = 5;
        List<User> users = userService.selectUsersByNickName(nickName);
        PageResult pageResult = userService.sortPageByAdmin(users, currentPage, pageSize);
        users = pageResult.getNewPage();
        map.addAttribute("pageResult", pageResult);
        map.addAttribute("users", users);
        return "admin/user/list";

    }


}
