package com.gyl.controller.admin;

import com.alibaba.fastjson.JSON;
import com.gyl.entity.*;
import com.gyl.service.BoardService;
import com.gyl.service.SystemInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 系统整体信息
 *
 *
 */
@Controller
public class AdminSystemController {
    @Autowired
    private SystemInfoService systemInfoService;
    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/admin/system/info", method = RequestMethod.GET)
    public String list(Model model) {
        //系统的整体信息
        SystemInfo systemInfo = systemInfoService.listComponents();
        //每一个模块对应的帖子数,分区数
        List<Panel> panels = systemInfoService.getNumbersFromEachPanel();
        String panelId = panels.get(0).getId();
        List<Board> boards = systemInfoService.getBoardByPanelId(panelId);
        List<Board> boards1 = boardService.list();
        //每个模块对应的分区,默认显示第一个模块的下，所有板块跟分区之间的关系
        String boardId = boards.get(0).getId();
        List<Area> areas = systemInfoService.getAreaByBoardId(boardId);

        //根据发帖时间段和发帖的类型汇总出来的
        List<SystemInfo> systemInfoAboutPostTimeSort = systemInfoService.getSystemInfoAboutPostTimeSort();

        List<SystemInfo> systemInfoAboutPostType = systemInfoService.getSystemInfoAboutPostType();

        //转化成json
        Object postNumberEachPanel = JSON.toJSONString(panels);
        Object eachBoard = JSON.toJSONString(boards);
        Object eachArea = JSON.toJSONString(areas);
        Object postTimeSortByEachTime = JSON.toJSONString(systemInfoAboutPostTimeSort);
        Object postSortByEachPostType = JSON.toJSONString(systemInfoAboutPostType);

        //默认显示第一个板块下，分区和贴子数的关系
        model.addAttribute("systemInfo", systemInfo);
        model.addAttribute("postNumberEachPanel", postNumberEachPanel);
        model.addAttribute("eachBoard", eachBoard);
        model.addAttribute("eachArea", eachArea);
        model.addAttribute("panels", panels);
        model.addAttribute("boards", boards1);
        model.addAttribute("postTimeSortByEachTime", postTimeSortByEachTime);
        model.addAttribute("postSortByEachPostType", postSortByEachPostType);
        return "/admin/info";
    }

    /**
     * 异步根据panelId查board
     *
     * @param panelId
     * @return
     */
    @RequestMapping(value = "/admin/system/selectByPanelId", method = RequestMethod.GET)
    @ResponseBody
    public List<Board> selectByPanelId(String panelId) {
        List<Board> boards = systemInfoService.getBoardByPanelId(panelId);
        return boards;
    }

    /**
     * 异步根据boardId查area
     *
     * @param boardId
     * @return
     */
    @RequestMapping(value = "/admin/system/selectByBoardId", method = RequestMethod.GET)
    @ResponseBody
    public List<Area> selectByBoardId(String boardId) {
        List<Area> areas = systemInfoService.getAreaByBoardId(boardId);
        return areas;
    }

}
