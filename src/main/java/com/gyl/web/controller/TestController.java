package com.gyl.web.controller;

import com.gyl.entity.Test;
import com.gyl.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 测试SSM集成
 */
@RequestMapping("/test")
@Controller
public class TestController {
    @Autowired
    private TestService testService;

    @RequestMapping(value = "/save")
    public String save(Test test, HttpServletRequest request) {
        System.out.println("TestController.save");
        int status = testService.save(test);
        request.setAttribute("status", status);
        return "success";
    }
}
