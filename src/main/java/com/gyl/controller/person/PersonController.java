package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人管理
 *
 * @author gyl
 */
@Controller
public class PersonController {

    /**
     * 个人管理主页面
     *
     * @return
     */
    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String main() {

        return "/person/main";
    }



}
