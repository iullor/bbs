package com.gyl.controller.admin;

import com.gyl.commons.StatusCode;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Option;
import com.gyl.entity.User;
import com.gyl.service.MessageService;
import com.gyl.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 未读              0
 * <p>
 * 撤销             1
 * <p>
 * 待审核            2
 * <p>
 * 审核通过         3
 * <p>
 * 审核拒绝         4
 * <p>
 * 忽略(时间大于7天，状态变成超时)   5
 * <p>
 * 超时                  6
 *
 *
 */
@Controller
public class AdminCheckController {
    @Autowired
    private OptionService optionService;

    @Autowired
    private MessageService messageService;

    /**
     * 贴子的审核
     *
     * @return
     */
    @RequestMapping(value = "/admin/check/post", method = RequestMethod.GET)
    public String post(Model model, HttpServletRequest request, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 10;
        }
        //查询所有贴子未读的
        List<Option> options = options = optionService.selectAllPostsOptionsByStatus(StatusCode.WAIT_CHECK);
        PageResult pageResult = optionService.sortPageByAdmin(options, currentPage, pageSize);
        options = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("options", options);
        return "/admin/examination/posts_check";
    }

    /**
     * 添加备注,修改状态
     *
     * @return
     */
    @RequestMapping(value = "/admin/check", method = RequestMethod.POST)
    public String addRemakes(Option op, HttpServletRequest request) {

        User handelUser = (User) request.getSession().getAttribute("ADMIN_USER");
        //添加处理人的信息
        Option option = null;
        if (op.getPostId() != null) {
            option = optionService.selectOptionAboutPostById(op.getId());
        }
        if (op.getBoardId() != null) {
            option = optionService.selectOptionAboutBoardById(op.getId());
        }
        if (op.getTopicId() != null) {
            option = optionService.selectOptionAboutTopicById(op.getId());
        }
        option.setHandleUserId(handelUser.getId());
        if (op.getRemakes() != null) {
            //添加备注
            option.setRemakes(op.getRemakes());
        }
        //更改处理状态
        if (op.getStatus() > 0) {
            option.setStatus(op.getStatus());
        }
        int i = optionService.updateOptionById(option);
        //如果成功，发送一条消息给他
        if (i > 0) {
            int j = messageService.sendApplyMessage(option, handelUser.getId());
        }

        return "redirect:/admin/check/post";
    }

    /**
     * 返回json
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/admin/check/post/hasChecked", method = RequestMethod.GET)
    public List<Option> hasChecked() {
        //已经审核的，包括，拒绝，忽略，同意的
        List<Option> options = options = optionService.selectAllPostsOptionsHasChecked();
        return options;
    }

    /**
     * 版主申请
     *
     * @return
     */
    @RequestMapping(value = "/admin/check/boardManager", method = RequestMethod.GET)
    public String boardManagerApplyList(Model model) {
        List<Option> options = optionService.selectAllBoardManagerOptionsByStatus(StatusCode.WAIT_CHECK);
        model.addAttribute("options", options);
        return "/admin/examination/board_manager_check";
    }

    /**
     * 我的话题申请首页置顶
     *
     * @return
     */
    @RequestMapping(value = "/admin/check/myTopicUp", method = RequestMethod.GET)
    public String myTopic(Model model) {
        //List<Option> options = optionService.selectOptionsByRole(2);
        List<Option> options = optionService.selectAllTopicsOptionsByStatus(StatusCode.WAIT_CHECK);
        model.addAttribute("options", options);
        return "/admin/examination/topic_check";
    }

    /**
     * 显示申请理由
     *
     * @return
     */
    @RequestMapping("/admin/apply/showApplyReason/{optionId}")
    public String showApplyReason(@PathVariable("optionId") String optionId, Model model) {
        Option option = optionService.selectOptionAboutPostById(optionId);
        model.addAttribute("option", option);
        return "/admin/examination/show_reason";
    }

}
