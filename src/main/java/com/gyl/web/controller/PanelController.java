package com.gyl.web.controller;

import com.gyl.entity.Panel;
import com.gyl.entity.User;
import com.gyl.service.PanelService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @Autowired
    private UserService userService;

    /**
     * 添加方法
     *
     * @param panel
     * @param multipartFile
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Panel panel, @RequestParam("logo") MultipartFile multipartFile) {
        //调用方法设置上传文件
        setPanelFile(panel, multipartFile);
        //新增
        int status = panelService.add(panel);
        return "redirect:/panel/list";
    }

    @RequestMapping("/list")
    public String list(ModelMap map) {
        List<Panel> panels = panelService.list();
        map.addAttribute("panels", panels);
        return "admin/panel/list";
    }

    /**
     * 更新方法
     *
     * @param pid 前台传来panel的id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public String update(Panel panel, @RequestParam("logo") MultipartFile multipartFile, @PathVariable(value = "pid") String pid) {
        setPanelFile(panel, multipartFile);
        //更新方法
        int status = panelService.update(panel, pid);
        System.out.println("PanelController.update");
        return "redirect:/panel/list";
    }

    /**
     * 编辑方法
     *
     * @return
     */
    @RequestMapping("/edit/{pid}")
    public String edit(@PathVariable(value = "pid") String pid, ModelMap modelMap) {
        List<User> users = userService.list();
        if (pid != null) {
            //为了页面回显
            Panel panelById = getPanelById(pid);
            if (panelById != null) {
                modelMap.addAttribute("panelEdit", panelById);
            }
        }
        modelMap.addAttribute("users", users);
        modelMap.addAttribute("pid", pid);
        return "admin/panel/edit";
    }

    @RequestMapping("/toEdit")
    public String toEdit(ModelMap map) {
        List<User> users = userService.list();
        map.addAttribute("users", users);
        return "admin/panel/edit";
    }

    /**
     * 删除方法
     *
     * @param pid panel的id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public String delete(String pid) {

        int delete = panelService.delete(pid);

        return "redirect:/panel/list";
    }

    /**
     * 设置上传文件
     *
     * @param panel
     * @param multipartFile
     */
    private void setPanelFile(Panel panel, MultipartFile multipartFile) {
        //给panel设置是否可见
        panel.setIsDisabeld(panel.getIsDisabeld());
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

    }

    public Panel getPanelById(String pid) {
        Panel panel = panelService.getPanelById(pid);
        return panel;
    }

}
