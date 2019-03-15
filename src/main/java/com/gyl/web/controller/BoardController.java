package com.gyl.web.controller;

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
 * 板块
 *
 * @author gyl
 */
@Controller
public class BoardController {
    @Autowired
    private UserService userService;

    @Autowired
    private PanelService panelService;
    @Autowired
    private BoardService boardService;

    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";

    @RequestMapping(value = "/board", method = RequestMethod.GET)
    public String list(ModelMap map) {
        List<Board> boards = boardService.list();
        map.addAttribute("boards", boards);
        return "admin/board/list";
    }

    @RequestMapping(value = "/board", method = RequestMethod.POST)
    public String add(Board board) {
        int status = boardService.add(board);
        return "redirect:/board";
    }


    @RequestMapping(value = "/board", method = RequestMethod.PUT)
    public String update(Board board) {
        int status = boardService.put(board);
        return "redirect:/board";
    }

    @RequestMapping(value = "/board/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") String id) {
        int status = boardService.delete(id);
        return "redirect:/board";
    }


    @RequestMapping(value = "/board/input/{id}", method = RequestMethod.GET)
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

    @RequestMapping(value = "/board/addBoardToPanel/{id}", method = RequestMethod.GET)
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
    @RequestMapping(value = "/board/fileUpload", method = RequestMethod.POST)
    public String form(@RequestParam("img") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/");
        File file1 = new File(realPath + "/upload/board/");
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
