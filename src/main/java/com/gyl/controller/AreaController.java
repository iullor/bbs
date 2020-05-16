package com.gyl.controller;

import com.gyl.commons.page.PageResult;
import com.gyl.entity.*;
import com.gyl.service.AreaService;
import com.gyl.service.TopNavbarInfoService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 */
@Controller
public class AreaController {
    @Autowired
    private AreaService areaService;
    @Autowired
    private UserService userService;
    @Autowired
    private TopNavbarInfoService topNavbarInfoService;

    @RequestMapping(value = "/area/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id") String id, Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 5;
        }
        //分区的分页
        Area area = areaService.getAreaPostsById(id, currentPage, pageSize);
        PageResult pageResult = areaService.listPosts(id, currentPage, pageSize);
        TopNavbarInfo topNavbarInfo = topNavbarInfoService.listByAreaId(id);

        model.addAttribute("pageResult", pageResult);
        model.addAttribute("area", area);
        model.addAttribute("topNavbarInfo", topNavbarInfo);
        return "/foreground/area/area";
    }


    @ResponseBody
    @RequestMapping(value = "/area/{boardId}", method = RequestMethod.POST)
    public List<Area> getAreaByBoardId(@PathVariable(value = "boardId") String boardId) {
        List<Area> areas = areaService.getAreasByBoardId(boardId);
        return areas;
    }
}
