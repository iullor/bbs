package com.gyl.controller;

import com.gyl.commons.page.PageResult;
import com.gyl.entity.Board;
import com.gyl.entity.Discuss;
import com.gyl.entity.Topic;
import com.gyl.service.BoardService;
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
 *
 */
@Controller
@SuppressWarnings("all")
public class PublicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private DiscussService discussService;

    @Autowired
    private BoardService boardService;
    @RequestMapping(value = "/public", method = RequestMethod.GET)
    public String list(Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 10;
        }
        List<Topic> topics = topicService.listTopics();
        List<Topic> hotTopicsKeywords = topicService.listHotTopicsPublic();
        //首页显示的
        List<Topic> hotTopics = topicService.listHotTopic();
        //获取所有的板块通过 每个板块中所有的贴子 数量来排序，查到最多的取前6个显示

        List<Board> hotBoards =boardService.selectHotBoardsByPosts();

        PageResult pageResult = topicService.sortPageByAdmin(topics, currentPage, pageSize);
        topics = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("topics", topics);
        model.addAttribute("hotTopicsKeywords", hotTopicsKeywords);
        model.addAttribute("hotTopics", hotTopics);
        model.addAttribute("hotBoards", hotBoards);

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
            pageSize = 10;
        }
        Topic topic = topicService.selectById(id);
        //将浏览数加1
        topic.setTopicSeen(topic.getTopicSeen() + 1);
        topicService.update(topic);

        List<Discuss> discusses = discussService.listByTopicId(topic.getId());
        PageResult pageResult = discussService.sortPageToDiscusses(discusses, currentPage, pageSize);
        discusses = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("topic", topic);
        model.addAttribute("discusses", discusses);
        return "/foreground/topic";
    }


}
