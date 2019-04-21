package com.gyl.controller;

import com.alibaba.fastjson.JSON;
import com.gyl.entity.Panel;
import com.gyl.entity.Post;
import com.gyl.entity.Topic;
import com.gyl.service.PanelService;
import com.gyl.service.PostService;
import com.gyl.service.TopicService;
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
    private PanelService panelService;

    @Autowired
    private PostService postService;

    @Autowired
    private TopicService topicService;

    /**
     * 页面跳转到首页
     *
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model) {
        List<Panel> panels = panelService.listBoardsAreaPosts();
        List<Post> hotPosts = postService.listHotPosts(0);
        List<Topic> hotTopics = topicService.listHotTopic();
        //转成json格式
        Object hotPostsString = JSON.toJSONString(hotPosts);
        model.addAttribute("panels", panels);
        model.addAttribute("hotPosts", hotPosts);
        model.addAttribute("hotTopics", hotTopics);
        return "index";
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
