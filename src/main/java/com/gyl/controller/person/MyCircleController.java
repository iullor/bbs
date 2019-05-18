package com.gyl.controller.person;

import com.gyl.entity.*;
import com.gyl.service.CollectionService;
import com.gyl.service.PostService;
import com.gyl.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author gyl
 */
@Controller
public class MyCircleController {
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private PostService postService;
 @Autowired
    private TopicService topicService;

    @RequestMapping("/person/myCircle")
    public String list(HttpServletRequest request, Model model) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Collection> myFocusUsers = collectionService.listMyCollectionUser(currentUser.getId());
        //根据当前人的id，获取所有关注人的帖子，并按时间排序
        List<Post> posts = postService.getMyFocusPosts(currentUser.getId());
        //同样，找到关注人发的发起的话题
        List<Topic> topics = topicService.getFocusUserTopic(currentUser.getId());
        model.addAttribute("myFocusUsers", myFocusUsers);
        model.addAttribute("posts", posts);
        model.addAttribute("topics", topics);
        return "/person/myCircle";
    }

}
