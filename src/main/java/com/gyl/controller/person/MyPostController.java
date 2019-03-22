package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人贴子
 *
 * @author gyl
 */
@Controller
public class MyPostController {

    /**
     * 个人贴子
     *
     * @return
     */
    @RequestMapping(value = "/person/mypost", method = RequestMethod.GET)
    public String list() {

        return "person/post/person_posts";
    }


}
