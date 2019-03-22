package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 关注
 *
 * @author gyl
 */
@Controller
public class FocusController {



    @RequestMapping(value = "/person/focus", method = RequestMethod.GET)
    public String account() {

        return "/person/focus/focus_person";
    }


}
