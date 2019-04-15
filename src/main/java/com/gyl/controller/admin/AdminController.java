package com.gyl.controller.admin;

import com.gyl.entity.Panel;
import com.gyl.entity.User;
import com.gyl.service.BoardService;
import com.gyl.service.PanelService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * admin 的控制
 *
 * @author gyl
 */

@Controller
public class AdminController {


    @Autowired
    private UserService userService;
    @Autowired
    private PanelService panelService;
    @Autowired
    private BoardService boardService;

    /**
     * 登录验证登录页面
     *
     * @return
     */
    @RequestMapping(value = "/admin/chcekLogon", method = RequestMethod.POST)
    public String checkLogon(String username, String password, HttpServletRequest request) {
        if (username != null && password != null) {
            User user = userService.adminLogon(username, password);
            if (user != null) {
                request.getSession().setAttribute("ADMIN_USER", user);
                int role = user.getUserAccountStatus().getRole();
                return "redirect:/admin/main";
            } else {
                return "redirect:/admin/logon";
            }
        }
        return "redirect:/admin/logon";
    }


    /**
     * 注销登录
     *
     * @return
     */
    @RequestMapping(value = "/admin/logout")
    public String logoutAdmin(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/admin/logon";
    }


    /**
     *
     */
    @RequestMapping(value = "/admin/main")
    public String main() {
        return "/admin/main";
    }

    /**
     * 前往admin 登录页面
     *
     * @return
     */
    @RequestMapping("/admin/logon")
    public String resetPassowrd() {
        return "/admin_logon";
    }
}
