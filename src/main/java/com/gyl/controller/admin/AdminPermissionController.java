package com.gyl.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 权限的控制
 *
 * @author gyl
 */
@Controller
public class AdminPermissionController {

    @RequestMapping(value = "/admin/permission", method = RequestMethod.GET)
    public String list() {

        return "/admin/permission/list";
    }

    @RequestMapping(value = "/admin/permission/input/0", method = RequestMethod.GET)
    public String input() {

        return "/admin/permission/edit";
    }

}
