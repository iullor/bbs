package com.gyl.controller.admin;

import com.gyl.entity.Area;
import com.gyl.entity.Board;
import com.gyl.entity.User;
import com.gyl.service.AreaService;
import com.gyl.service.BoardService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 分区，类似计科
 *
 * @author gyl
 */
@Controller
public class AdminAreaController {
    @Autowired
    private UserService userService;
    @Autowired
    private AreaService areaService;

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/admin/area", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        List<Area> areas = areaService.list();
        modelMap.addAttribute("areas", areas);
        return "admin/area/list";
    }


    @RequestMapping(value = "/admin/area", method = RequestMethod.POST)
    public String add(Area area) {
        int status = areaService.add(area);
        return "redirect:/admin/area";
    }

    @RequestMapping(value = "/admin/area", method = RequestMethod.PUT)
    public String update(Area area) {
        int status = areaService.update(area);
        return "redirect:/admin/area";
    }

    @RequestMapping(value = "/admin/area/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") String id) {
        int status = areaService.delete(id);
        return "redirect:/admin/area";
    }


    /**
     * 跳转到编写页面
     *
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/admin/area/input/{id}", method = RequestMethod.GET)
    public String input(@PathVariable("id") String id, ModelMap modelMap) {
        Area area = new Area();
        if (id != null && !id.equals("0")) {
            area = areaService.getAreaById(id);
        }
        List<User> users = userService.list();
        List<Board> boards = boardService.list();
        modelMap.addAttribute("area", area);
        modelMap.addAttribute("users", users);
        modelMap.addAttribute("boards", boards);
        return "admin/area/edit";
    }


    @RequestMapping(value = "/admin/area/addAreaToBoard/{id}", method = RequestMethod.GET)
    public String addAreaToBoard(@PathVariable(value = "id") String id, ModelMap map) {
        Area area = new Area();
        List<User> users = userService.list();
        List<Board> boards = boardService.list();
        area.setBoardId(id);
        map.addAttribute("area", area);
        map.addAttribute("users", users);
        map.addAttribute("boards", boards);
        return "admin/area/edit";
    }
}
