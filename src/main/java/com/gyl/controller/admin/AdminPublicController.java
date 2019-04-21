package com.gyl.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 系统广场
 *
 * @author gyl
 */
@Controller
public class AdminPublicController {

    @RequestMapping(value = "/admin/public", method = RequestMethod.GET)
    public String list() {

        return "/admin/public";
    }


}
