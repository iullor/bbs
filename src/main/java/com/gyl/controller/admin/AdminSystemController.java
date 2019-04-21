package com.gyl.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 系统整体信息
 *
 * @author gyl
 */
@Controller
public class AdminSystemController {

    @RequestMapping(value = "/admin/system/info", method = RequestMethod.GET)
    public String list() {

        return "/admin/info";
    }


}
