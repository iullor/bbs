package com.gyl.controller;

import com.gyl.entity.Collection;
import com.gyl.entity.Post;
import com.gyl.entity.Topic;
import com.gyl.entity.User;
import com.gyl.service.CollectionService;
import com.gyl.service.PostService;
import com.gyl.service.TopicService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 */
@Controller
public class AccountController {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private TopicService topicService;

    /**
     * 个人信息的展示
     *
     * @return
     */
    @RequestMapping("/account/{id}")
    public String show(@PathVariable("id") String id, Model model) {
        //个人基本的显示
        User user = userService.selectUserById(id);
        //贴子数，粉丝数
        int postCount = postService.countPostsByUserId(id);
        int fansCount = collectionService.countFansByUserId(id);
        List<Post> posts = collectionService.listMyCollectionPosts(id);
        List<Collection> focusUsers = collectionService.listMyCollectionUser(id);
        List<Topic> topics = topicService.selectByUserId(id);
        model.addAttribute("user", user);
        model.addAttribute("postCount", postCount);
        model.addAttribute("fansCount", fansCount);
        model.addAttribute("posts", posts);
        model.addAttribute("focusUsers", focusUsers);
        model.addAttribute("topics", topics);
        return "/person/basic/show";
    }

    /**
     * 修改简介
     *
     * @param id
     * @param introduce
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/account/updateIntroduce", method = RequestMethod.POST)
    public int updateIntroduce(String id, String introduce) {
        int status = userService.updateIntroduce(id, introduce);
        return status;
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
