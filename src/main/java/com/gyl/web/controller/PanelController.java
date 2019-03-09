package com.gyl.web.controller;

import com.gyl.entity.Panel;
import com.gyl.service.PanelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 模块添加
 */
@Controller
@RequestMapping(value = "/panel")
public class PanelController {
    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";
    @Autowired
    private PanelService panelService;

    @RequestMapping(value = "/edit")
    public String add(Panel panel, @RequestParam("logo") MultipartFile multipartFile) {
        if (multipartFile != null && !multipartFile.isEmpty()) {
            String originalFilename = multipartFile.getOriginalFilename();
            System.out.println("originalFilename = " + originalFilename);
            String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            String fileNameSubfix = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName = fileNamePrefix + System.currentTimeMillis() + fileNameSubfix;
            File file = new File(uploadPath + newFileName);

            //将上传文件的路径设置进Panel中
            panel.setLogoPath(uploadPath + newFileName);
            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int status = panelService.add(panel);
        if (status > 0) {
            return "redirect:/panel/list";
        }
        return "redirect:/admin/panel/list";
    }

    @RequestMapping("/list")
    public String list(ModelMap map) {
        List<Panel> panelList = panelService.list();
        map.addAttribute("panelList", panelList);
        return "admin/panel/list";
    }

    /*@RequestMapping("/toEdit")
    public String edit(@RequestParam(value = "id") String id) {
        return "redirect:/panel/edit?id="+id;
    }*/
}
