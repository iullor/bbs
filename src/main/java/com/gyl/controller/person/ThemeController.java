package com.gyl.controller.person;

import com.gyl.entity.User;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * 个人样式设置
 *
 * @author gyl
 */
@Controller
public class ThemeController {
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/person/themes/basic", method = RequestMethod.GET)
    public String list() {

        return "/person/themes/person_theme_setting";
    }

    /**
     * 更换用户的样式
     *
     * @param id    用户的id
     * @param value 样式的编号
     * @return
     */
    @RequestMapping(value = "/person/themes/changeTheme", method = RequestMethod.GET)
    public String changeTheme(String id, String value, HttpServletRequest request) {
        int status = userService.changeTheme(id, value);
        request.getSession().removeAttribute("CURRENT_USER");
        return "/person/themes/person_theme_setting";
    }


}
