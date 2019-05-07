package com.gyl.controller;

import com.gyl.entity.Panel;
import com.gyl.service.PanelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author gyl
 * <p>
 * 前台使用的panel
 */
@Controller
public class PanelController {
    @Autowired
    private PanelService panelService;

    /**
     * 显示单个panel
     *
     * @return
     */
    @RequestMapping(value = "/panel/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id") String id, Model model) {
        Panel panel = panelService.selectPanelById(id);
        model.addAttribute("panel", panel);
        model.addAttribute("panel", panel);
        return "/foreground/board/board";
    }


}
