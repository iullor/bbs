package com.gyl.controller.admin;

import com.gyl.entity.Notice;
import com.gyl.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 系统公告板
 *
 *
 */
@Controller
public class AdminNoticeController {
    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "/admin/notice", method = RequestMethod.GET)
    public String list(Model model) {
        List<Notice> notices = noticeService.list();
        model.addAttribute("notices", notices);
        return "/admin/notice/history";
    }

    @RequestMapping(value = "/admin/notice", method = RequestMethod.POST)
    public String add(Notice notice) {
        int state = noticeService.insert(notice);
        return "redirect:/admin/notice";
    }

    @RequestMapping(value = "/admin/notice/input/{option}", method = RequestMethod.GET)
    public String add(@PathVariable("option") Integer option) {
        return "/admin/notice/edit";
    }

    @RequestMapping(value = "/admin/notice/{id}", method = RequestMethod.GET)
    public String selectById(@PathVariable("id") Integer id, Model model) {
        Notice notice = noticeService.selectById(id);
        model.addAttribute("notice", notice);
        return "/foreground/notice";
    }


    @ResponseBody
    @RequestMapping(value = "/admin/notice/update", method = RequestMethod.GET)
    public Integer update(Integer option, Integer id) {
        Notice notice = noticeService.selectById(id);
        if (option != null && option == 1) {
            //显示
            notice.setState(1);
            int tmp = noticeService.update(notice);
            if (tmp > 0) {
                return 200;
            }
        }
        if (option != null && option == 0) {
            //撤销
            notice.setState(0);
            int tmp = noticeService.update(notice);
            if (tmp > 0) {
                return 200;
            }
        }
        return 0;
    }
}
