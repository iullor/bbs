package com.gyl.controller.admin;

import com.gyl.commons.StatusCode;
import com.gyl.entity.Board;
import com.gyl.entity.Panel;
import com.gyl.entity.User;
import com.gyl.service.BoardService;
import com.gyl.service.PanelService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 模块添加
 *
 * @author gyl
 */
@Controller
public class AdminPanelController {
    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";
    @Autowired
    private PanelService panelService;

    @Autowired
    private UserService userService;
    @Autowired
    private BoardService boardService;


    private String operationStatus = "";

    /**
     * panel 列表
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/admin/panel", method = RequestMethod.GET)
    public String list(ModelMap map) {
        List<Panel> panels = panelService.list();
        map.addAttribute("panels", panels);
        map.addAttribute("operationStatus", operationStatus);
        /**
         * 重新初始化
         */
        operationStatus = "";
        return "admin/panel/list";
    }

    /**
     * 添加方法
     *
     * @param panel
     * @return
     */
    @RequestMapping(value = "/admin/panel", method = RequestMethod.POST)
    public String add(Panel panel) {
        int status = panelService.add(panel);
        return "redirect:/admin/panel";
    }


    /**
     * 更新方法
     *
     * @return
     */
    @RequestMapping(value = "/admin/panel", method = RequestMethod.PUT)
    public String update(Panel panel) {
        int status = panelService.update(panel);
        operationStatus = StatusCode.UPDATE_PANEL_SUCCESS;
        return "redirect:/admin/panel";
    }

    /**
     * 删除方法
     *
     * @param id panel的id
     * @return
     */
    @RequestMapping(value = "/admin/panel/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") String id) {
        List<Board> boards = boardService.selectBoardsByPanelId(id);
        if (boards.size() > 0) {
            operationStatus = StatusCode.DELET_PANEL_ERROR;
        }
        try {
            //可能出现，外键约束错误
            int delete = panelService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return "redirect:/admin/panel";
        }
    }

    /**
     * 编辑方法
     *
     * @return
     */
    @RequestMapping(value = "/admin/panel/input/{id}", method = RequestMethod.GET)
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

    @RequestMapping(value = "/admin/panel/searchByPanelTitle", method = RequestMethod.GET)
    public String searchByPanelTitle(String inputPanelTitle, ModelMap map) {
        List<Panel> panels = panelService.searchByPanelTitle(inputPanelTitle);
        map.addAttribute("panels", panels);
        return "admin/panel/list";
    }

    /**
     * 设置上传文件
     * 返回文件的路径,以及信息
     *
     * @param multipartFile
     */
    @SuppressWarnings("all")
    @ResponseBody
    @RequestMapping(value = "/admin/panel/fileUpload", method = RequestMethod.POST)
    public String form(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/");
        File file1 = new File(realPath + "/upload/panel/");
        if (!file1.exists()) {
            file1.mkdirs();
        }
        uploadPath = file1.getPath() + "/";
        if (multipartFile != null && !multipartFile.isEmpty()) {
            String originalFilename = multipartFile.getOriginalFilename();
            System.out.println("originalFilename = " + originalFilename);
            String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            String fileNameSubfix = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName = fileNamePrefix + System.currentTimeMillis() + fileNameSubfix;
            File file = new File(uploadPath + "/" + newFileName);
            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return uploadPath + newFileName;
        }
        return null;
    }
}
