package com.gyl.controller.admin;

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
 * 板块
 *
 *
 */
@Controller
public class AdminBoardController {
    @Autowired
    private UserService userService;

    @Autowired
    private PanelService panelService;
    @Autowired
    private BoardService boardService;

    @Value("${file.upload.path}")
    private String uploadPath;

    @RequestMapping(value = "/admin/board", method = RequestMethod.GET)
    public String list(ModelMap map, HttpServletRequest request, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 3;
        }
        //超级用户，就直接查所有的列表
        List<Board> boards = boardService.list();
        User manager = (User) request.getSession().getAttribute("ADMIN_USER");
        //模块管理者
        if (manager.getUserAccountStatus().getRole() == 2) {
            boards = boardService.listBoardByPanelId(manager.getId());
        }
        //板块管理者
        if (manager.getUserAccountStatus().getRole() == 3) {
            boards = boardService.getBoardByManagerId(manager.getId());
        }
        //分页的内容,把每个角色对应应该查出来的贴子分页处理后,再返回回来
        PageResult pageResult = boardService.sortPageByAdmin(boards, currentPage, pageSize);
        boards = pageResult.getNewPage();
        map.addAttribute("pageResult", pageResult);
        map.addAttribute("boards", boards);
        return "admin/board/list";
    }

    @RequestMapping(value = "/admin/board", method = RequestMethod.POST)
    public String add(Board board) {
        int status = boardService.add(board);
        return "redirect:/admin/board";
    }


    @RequestMapping(value = "/admin/board", method = RequestMethod.PUT)
    public String update(Board board) {
        int status = boardService.put(board);
        return "redirect:/admin/board";
    }

    @RequestMapping(value = "/admin/board/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") String id) {
        int status = boardService.delete(id);
        return "redirect:/admin/board";
    }


    @RequestMapping(value = "/admin/board/input/{id}", method = RequestMethod.GET)
    public String input(@PathVariable(value = "id") String id, ModelMap map) {
        List<User> users = userService.list();
        List<Panel> panels = panelService.list();
        Board board = new Board();
        if (id != null && !id.equals("0")) {
            board = boardService.getBoardById(id);
        }
        map.addAttribute("board", board);
        map.addAttribute("users", users);
        map.addAttribute("panels", panels);
        return "admin/board/edit";
    }

    @RequestMapping(value = "/admin/board/addBoardToPanel/{id}", method = RequestMethod.GET)
    public String addBoardToPanel(@PathVariable(value = "id") String id, ModelMap map) {
        List<User> users = userService.list();
        List<Panel> panels = panelService.list();
        Board board = new Board();
        board.setPanelId(id);
        map.addAttribute("board", board);
        map.addAttribute("users", users);
        map.addAttribute("panels", panels);
        return "admin/board/edit";
    }

    /**
     * 设置上传文件
     * 返回文件的路径,以及信息
     *
     * @param multipartFile
     */
    @SuppressWarnings("all")
    @ResponseBody
    @RequestMapping(value = "/admin/board/fileUpload", method = RequestMethod.POST)
    public Map<String, Object> form(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //String diskPath = uploadPath + "/upload/headImage" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        //地址/日期/文件
        String realPath = session.getServletContext().getRealPath("/").replace("\\", "/");
        String createPath = "upload/board/" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
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
