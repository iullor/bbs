package com.gyl.controller;

import com.gyl.commons.page.PageResult;
import com.gyl.entity.Discuss;
import com.gyl.entity.Topic;
import com.gyl.service.DiscussService;
import com.gyl.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author gyl
 */
@Controller
@SuppressWarnings("all")
public class PublicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private DiscussService discussService;

    @RequestMapping(value = "/public", method = RequestMethod.GET)
    public String list(Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 3;
        }
        List<Topic> topics = topicService.listTopics();
        //首页显示的
        List<Topic> hotTopics = topicService.listHotTopic();
        PageResult pageResult = topicService.sortPageByAdmin(topics, currentPage, pageSize);
        topics = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("topics", topics);
        model.addAttribute("hotTopics", hotTopics);
        return "/public";
    }

    /**
     * 显示话题下的所有讨论
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/public/{id}")
    public String showTopicById(@PathVariable("id") String id, Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 5;
        }
        Topic topic = topicService.selectById(id);
        List<Discuss> discusses = discussService.listByTopicId(topic.getId());
        PageResult pageResult = discussService.sortPageToDiscusses(discusses, currentPage, pageSize);
        discusses = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("topic", topic);
        model.addAttribute("discusses", discusses);
        return "/foreground/topic";
    }
}
