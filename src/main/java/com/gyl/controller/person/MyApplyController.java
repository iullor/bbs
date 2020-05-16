package com.gyl.controller.person;

import com.gyl.entity.*;

import com.gyl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 我的申请
 * <p>
 * 版主，区主，贴子置顶，公版显示我的分区
 *
 *
 */
@Controller
public class MyApplyController {
    @Autowired
    private OptionService optionService;

    @Autowired
    private PostService postService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private TopicService topicService;

    /**
     * 申请进度
     *
     * @return
     */
    @RequestMapping(value = "/person/apply/progress", method = RequestMethod.GET)
    public String applyProgress(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Option> myApplies = optionService.selectByApplyUserId(user.getId());
        model.addAttribute("myApplies", myApplies);
        return "/person/apply/apply_progress";
    }

    /**
     * 申请贴子置顶的编辑页
     *
     * @return
     */
    @RequestMapping(value = "/person/apply", method = RequestMethod.GET)
    public String applyEdit() {
        return "/person/apply/apply";
    }


    /**
     * 发送一条申请
     *
     * @return
     */
    @RequestMapping(value = "/person/apply", method = RequestMethod.POST)
    public String apply(Option option, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        option.setApplyUserId(user.getId());
        int i = optionService.insert(option);
        return "redirect:/person/apply/progress";
    }

    /**
     * 根据用户选择的类型来查询出来申请什么类型的
     *
     * @param op
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/person/apply/{op}", method = RequestMethod.GET)
    public List apply(@PathVariable("op") String op, HttpServletRequest request) {
        List<Object> obj = new ArrayList<>();
        if (op != null) {
            User user = (User) request.getSession().getAttribute("CURRENT_USER");
            if (op.equals("1")) {
                List<Post> posts = postService.getMyPostById(user.getId());
                return posts;
            }
            if (op.equals("2")) {
                List<Board> boards = boardService.list();
                return boards;
            }
            //去查找当前用户的所有话题
            if (op.equals("3")) {
                List<Topic> topics = topicService.selectByUserId(user.getId());
                return topics;
            }
        }
        return obj;
    }


    /**
     * 撤销申请
     */
    @RequestMapping(value = "/person/apply/cancelApply/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id) {
        Option option = optionService.selectOptionAboutPostById(id);
        int i = optionService.updateById(option);
        return "redirect:/person/apply/progress";
    }

    @RequestMapping(value = "/person/apply/deleteApply/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") String id) {
        int i = optionService.deleteById(id);
        return "redirect:/person/apply/progress";
    }

    /**
     * 显示申请理由
     *
     * @return
     */
    @RequestMapping("/person/apply/showApplyReason/{optionId}")
    public String showApplyReason(@PathVariable("optionId") String optionId, Model model) {
        Option option = optionService.selectOptionAboutPostById(optionId);
        model.addAttribute("option", option);
        return "/person/apply/show";
    }

}
