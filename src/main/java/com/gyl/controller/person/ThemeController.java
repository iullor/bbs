package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人样式设置
 *
 * @author gyl
 */
@Controller
public class ThemeController {


    @RequestMapping(value = "/person/themes/basic", method = RequestMethod.GET)
    public String list() {

        return "/person/themes/person_theme_setting";
    }


}
