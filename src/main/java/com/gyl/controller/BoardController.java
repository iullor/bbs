package com.gyl.controller;

import com.gyl.entity.*;
import com.gyl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author gyl
 * 一个模块下所有的板块列表
 */
@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private TopNavbarInfoService topNavbarInfoService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private PostService postService;

    /**
     * 显示单个panel
     *
     * @return
     */
    @RequestMapping(value = "/board/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id") String id, Model model) {
        //找到该板块下的所有分区
        List<Area> areas = areaService.getAreasByBoardId(id);
        if (areas.size() > 0) {
            for (Area area : areas) {
                String areaId = area.getId();
                //找到它下面的热门贴子,取前5条
                List<Post> posts = postService.getTopFivePostsByAreaId(areaId);
                area.setPosts(posts);
            }
        }
        TopNavbarInfo topNavbarInfo = topNavbarInfoService.listByBoardId(id);
        model.addAttribute("topNavbarInfo", topNavbarInfo);
        model.addAttribute("areas", areas);
        return "/foreground/board/board_list";
    }
}
