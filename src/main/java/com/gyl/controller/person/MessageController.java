package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人消息
 *
 * @author gyl
 */
@Controller
public class MessageController {


    /**
     * 个人消息
     *
     * @return
     */
    @RequestMapping(value = "/person/message", method = RequestMethod.GET)
    public String list() {

        return "/person/message/message";
    }


}
