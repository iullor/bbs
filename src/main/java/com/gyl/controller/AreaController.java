package com.gyl.controller;

import com.gyl.entity.Area;
import com.gyl.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author gyl
 */
@Controller
public class AreaController {
    @Autowired
    private AreaService areaService;

    @RequestMapping(value = "/area/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id") String id, Model model) {
        Area area = areaService.getAreaById(id);
        model.addAttribute("area", area);
        return "/foreground/area/area";
    }
}
