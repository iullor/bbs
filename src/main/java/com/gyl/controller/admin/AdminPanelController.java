package com.gyl.controller.admin;

import com.gyl.commons.StatusCode;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Board;
import com.gyl.entity.Panel;
import com.gyl.entity.User;
import com.gyl.service.BoardService;
import com.gyl.service.PanelService;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模块添加
 *
 *
 */
@Controller
public class AdminPanelController {
    @Value("${file.upload.path}")
    private String uploadPath;
    @Autowired
    private PanelService panelService;

    @Autowired
    private UserService userService;
    @Autowired
    private BoardService boardService;
    private String operationStatus = "";

    private Integer currentPage = 1;
    private Integer pageSize = 2;

    /**
     * panel 列表
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/admin/panel", method = RequestMethod.GET)
    public String list(ModelMap map, HttpServletRequest request, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = this.currentPage;
            pageSize = this.pageSize;
        }
        //先去查所有的出来
        List<Panel> panels = panelService.list();
        User panelManager = (User) request.getSession().getAttribute("ADMIN_USER");
        if (panelManager.getUserAccountStatus().getRole() < 3 && panelManager.getUserAccountStatus().getRole() > 1) {
            panels = panelService.listByPanelManagerId(panelManager.getId());
        }

        //分页的内容,把每个角色对应应该查出来的贴子分页处理后,再返回回来
        PageResult pageResult = panelService.sortPageByAdmin(panels, currentPage, pageSize);
        panels = pageResult.getNewPage();
        map.addAttribute("pageResult", pageResult);
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
    public String add(Panel panel, String panelDisabled) {
        if (panelDisabled != null) {
            if ("on".equals(panelDisabled)) {
                panel.setPanelDisabled(1);
            } else {
                panel.setPanelDisabled(0);
            }
        }
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
        if (panel.getPanelDisabled() == null) {
            panel.setPanelDisabled(0);
        }
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
        PageResult pageResult = panelService.sortPageByAdmin(panels, this.currentPage, this.pageSize);
        panels = pageResult.getNewPage();
        map.addAttribute("panels", panels);
        map.addAttribute("keyword", inputPanelTitle);
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
    public Map<String, Object> form(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //String diskPath = uploadPath + "/upload/headImage" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        //地址/日期/文件
        String realPath = session.getServletContext().getRealPath("/").replace("\\", "/");
        String createPath = "upload/panel/" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        File file = new File(realPath + createPath);
        if (!file.exists()) {
            file.mkdirs();
        }
        Map<String, Object> map = new HashMap<>();
        if (multipartFile != null && !multipartFile.isEmpty()) {
            String originalFilename = multipartFile.getOriginalFilename();
            String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            String fileNameSubfix = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName = createPath + "/" + System.currentTimeMillis() + fileNameSubfix;
            try {
                multipartFile.transferTo(new File(realPath + newFileName));
                //相对路径
                map.put("file", "/" + newFileName);
                map.put("status", 200);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return map;
        }
        map.put("status", 10000);
        return map;
    }
}
