package com.gyl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gyl
 */
@Controller
public class PublicController {

    @RequestMapping("/public")
    public String list() {

        return "/public";
    }
}
