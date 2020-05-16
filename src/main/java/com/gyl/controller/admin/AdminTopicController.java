package com.gyl.controller.admin;

import com.gyl.commons.page.PageResult;
import com.gyl.entity.Topic;
import com.gyl.service.TopicService;
import net.sf.jsqlparser.statement.select.Top;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 *
 */
@Controller
@SuppressWarnings("all")
public class AdminTopicController {

    @Autowired
    private TopicService topicService;


    @RequestMapping(value = "/admin/topic", method = RequestMethod.GET)
    public String list(Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 5;
        }
        List<Topic> topics = topicService.list();
        //首页显示的
        List<Topic> hotTopics = topicService.listHotTopic();
        PageResult pageResult = topicService.sortPageByAdmin(topics, currentPage, pageSize);
        topics = pageResult.getNewPage();

        model.addAttribute("pageResult", pageResult);
        model.addAttribute("topics", topics);
        model.addAttribute("hotTopics", hotTopics);
        return "admin/topic/list";
    }

    @RequestMapping(value = "/admin/topic/input/0", method = RequestMethod.GET)
    public String input() {
        return "admin/topic/edit";
    }


    @RequestMapping(value = "/admin/topic/update", method = RequestMethod.POST)
    public String update(Topic topic) {
        Topic topic1 = topicService.selectById(topic.getId());
        topic1.setLevel(topic.getLevel());
        int update = topicService.update(topic1);
        //发送消息
        return "redirect:/admin/topic";
    }

    @RequestMapping(value = "/admin/topic/search", method = RequestMethod.GET)
    public String searchByTopicTitle(String topicTitle, Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 5;
        }
        List<Topic> topics = topicService.listByTopicTitle(topicTitle);
        //首页显示的
        List<Topic> hotTopics = topicService.listHotTopic();
        PageResult pageResult = topicService.sortPageByAdmin(topics, currentPage, pageSize);
        topics = pageResult.getNewPage();

        model.addAttribute("pageResult", pageResult);
        model.addAttribute("topics", topics);
        model.addAttribute("hotTopics", hotTopics);
        return "admin/topic/list";
    }

}
