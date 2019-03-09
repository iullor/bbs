package com.gyl.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gyl
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    /**
     * 控制页面主页
     *
     * @return
     */
    @RequestMapping("/main")
    public String toAdminMain() {
        System.out.println("AdminController.toAdmin");
        return "admin/main";
    }

    @RequestMapping("/info")
    public String toAdminInfo() {
        return "admin/info";
    }

    @RequestMapping("/area/edit")
    public String toAreaEdit() {
        return "admin/area/edit";
    }

    @RequestMapping("/area/list")
    public String toAreaList() {
        return "admin/area/list";
    }

    @RequestMapping("/board/edit")
    public String toBoardEdit() {
        return "admin/board/edit";
    }

    @RequestMapping("/board/list")
    public String toBoardList() {
        return "admin/board/list";
    }

    @RequestMapping("/examination/list")
    public String toExaminationEdit() {

        return "admin/examination/list";
    }

    @RequestMapping("/feedback/edit")
    public String toFeedbackEdit() {
        return "admin/feedback/edit";
    }

    @RequestMapping("/feedback/list")
    public String toFeedbackList() {
        return "admin/feedback/list";
    }

    @RequestMapping("/panel/edit")
    public String toPanelEdit() {
        return "admin/panel/edit";
    }

    @RequestMapping("/panel/list")
    public String toPanelList() {
        return "redirect:/panel/list";
    }

    @RequestMapping("/permission/edit")
    public String toPermissionEdit() {
        return "admin/permission/edit";
    }

    @RequestMapping("/permission/list")
    public String toPermissionList() {
        return "admin/permission/list";
    }

    @RequestMapping("/post/edit")
    public String toPostEdit() {
        return "admin/post/edit";
    }

    @RequestMapping("/post/list")
    public String toPostList() {
        return "admin/post/list";
    }

    @RequestMapping("/shield/edit")
    public String toShieldEdit() {
        return "admin/shield/edit";
    }

    @RequestMapping("/shield/list")
    public String toShieldList() {
        return "admin/shield/list";
    }

    @RequestMapping("/user/edit")
    public String toUserEdit() {
        return "admin/user/edit";
    }

    @RequestMapping("/user/list")
    public String toUserList() {
        return "admin/user/list";
    }


}
