package com.gyl.controller;

import com.alibaba.fastjson.JSON;
import com.gyl.entity.Panel;
import com.gyl.entity.Post;
import com.gyl.service.PanelService;
import com.gyl.service.PostService;
import com.gyl.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 系统的操作控制器
 */
@Controller
public class IndexController {
    @Autowired
    private UserService userService;
    @Autowired
    private PanelService panelService;

    @Autowired
    private PostService postService;

    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model) {
        List<Panel> panels = panelService.listBoardsAreaPosts();
        List<Post> hotPosts = postService.listHotPosts(0);
        //转成json格式
        Object hotPostsString = JSON.toJSONString(hotPosts);
        model.addAttribute("panels", panels);
        model.addAttribute("hotPosts", hotPosts);
        //model.addAttribute("hotPostsString", hotPostsString);
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
     * 用户全局搜索
     *
     * @return
     */
    @RequestMapping(value = "/globalSearch")
    public String globalSearch() {

        return "search";
    }

}
