package com.gyl.controller;

import com.gyl.entity.Area;
import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.service.AreaService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author gyl
 */
@Controller
public class AreaController {
    @Autowired
    private AreaService areaService;
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/area/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id") String id, Model model, HttpServletRequest request) {
        Area area = areaService.getAreaById(id);
        String remoteAddr = request.getRemoteAddr();
        String remoteHost = request.getRemoteHost();
        int remotePort = request.getRemotePort();

        //查询很多贴子
        if (area != null) {
            List<Post> posts = area.getPosts();
            for (Post p : posts) {
                String userId = p.getUserId();
                User user = userService.selectUserById(userId);
                p.setUser(user);
            }
        }
        model.addAttribute("area", area);
        //移除session中的area，每次一个新的area中，就把他暂时放到session中
        request.getSession().removeAttribute("area");
        request.getSession().setAttribute("area", area);
        return "/foreground/area/area";
    }
}
