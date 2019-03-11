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
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 模块添加
 */
@Controller
@RequestMapping
public class PanelController {
    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";
    @Autowired
    private PanelService panelService;

    @Autowired
    private UserService userService;

    /**
     * panel 列表
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/panel", method = RequestMethod.GET)
    public String list(ModelMap map) {
        List<Panel> panels = panelService.list();
        map.addAttribute("panels", panels);
        return "admin/panel/list";
    }

    /**
     * 添加方法
     *
     * @param panel
     * @return
     */
    @RequestMapping(value = "/panel", method = RequestMethod.POST)
    public String add(Panel panel) {
        //调用方法设置上传文件
        setPanelFile(panel, panel.getMultipartFile());
        //新增
        int status = panelService.add(panel);
        return "redirect:/panel";
    }


    /**
     * 更新方法
     *
     * @return
     */
    @RequestMapping(value = "/panel", method = RequestMethod.PUT)
    public String update(Panel panel) {
        setPanelFile(panel, panel.getMultipartFile());
        int status = panelService.update(panel, panel.getId());
        return "redirect:/panel";
    }

    /**
     * 删除方法
     *
     * @param id panel的id
     * @return
     */
    @RequestMapping(value = "/panel/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") String id) {
        int delete = panelService.delete(id);
        return "redirect:/panel";
    }

    /**
     * 编辑方法
     *
     * @return
     */
    @RequestMapping(value = "/panel/input/{id}", method = RequestMethod.GET)
    public String input(@PathVariable(value = "id") String pid, ModelMap modelMap) {
        List<User> users = userService.list();
        Panel panel = new Panel();
        if (pid != null && !pid.equals("0")) {
            //为了页面回显
            panel = panelService.getPanelById(pid);
        }
        //为了使用springmvc自动回显功能，如果是编辑的话，springmvcmvc 会自动去请求作用域中找panel，并赋值
        modelMap.addAttribute("panel", panel);
        modelMap.addAttribute("users", users);
        modelMap.addAttribute("pid", pid);

        return "admin/panel/edit";
    }


    /**
     * 设置上传文件
     *
     * @param panel
     * @param multipartFile
     */
    private void setPanelFile(Panel panel, MultipartFile multipartFile) {

        //给panel设置是否可见
        /*  panel.setIsDisabeld(panel.getIsDisabeld());*/
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
}
