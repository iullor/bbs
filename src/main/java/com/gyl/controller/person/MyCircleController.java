package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gyl
 */
@Controller
public class MyCircleController {
    @RequestMapping("/person/myCircle")
    public String list() {

        return "/person/myCircle";
    }

}
