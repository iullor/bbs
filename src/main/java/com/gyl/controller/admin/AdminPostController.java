package com.gyl.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 贴子
 *
 * @author gyl
 */
@Controller
public class AdminPostController {

    /**
     * 后台管理人员
     */
    @RequestMapping(value = "/admin/post", method = RequestMethod.GET)
    public String list() {

        return "admin/post/list";
    }

    @RequestMapping(value = "/admin/post/input/{id}", method = RequestMethod.GET)
    public String addPostOrders(@PathVariable("id") String id) {

        return "admin/post/edit";
    }
}
