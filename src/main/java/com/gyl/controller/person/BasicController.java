package com.gyl.controller.person;

import com.gyl.entity.User;
import com.gyl.entity.UserBaseInfo;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 个人基本信息,账户信息
 *
 * @author gyl
 */
@Controller
public class BasicController {
    @Autowired
    private UserService userService;

    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";


    @RequestMapping(value = "/person/basic/info", method = RequestMethod.GET)
    public String basic(HttpServletRequest request, ModelMap map) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        map.addAttribute("user", currentUser);
        return "/person/basic/info";
    }

    @RequestMapping(value = "/person/basic/info", method = RequestMethod.PUT)
    public String update(User user, HttpServletRequest request) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        currentUser.setUserBaseInfo(user.getUserBaseInfo());
        userService.update(currentUser);
        return "redirect:/person/basic/info";
    }


    @RequestMapping(value = "/person/basic/account", method = RequestMethod.GET)
    public String account(HttpServletRequest request, ModelMap map) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        map.addAttribute("user", currentUser);
        return "/person/basic/account";
    }


    /**
     * 设置上传文件
     * 返回文件的路径,以及信息
     *
     * @param multipartFile
     */
    @SuppressWarnings("all")
    @ResponseBody
    @RequestMapping(value = "/person/basic/accountUploadImg", method = RequestMethod.POST)
    public String form(@RequestParam("headImage") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/");
        File file1 = new File(realPath + "/upload/headImage/");
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


    /**
     * ajax 验证username 是否被使用过
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/person/basic/account/checkUserName")
    public Map<String, Object> checkUserName(@RequestBody User user) {
        String info = userService.selectUsername(user.getUsername());
        Map<String, Object> map = new HashMap<>();
        map.put("info", info);
        return map;
    }

    /**
     * ajax 更改密码的时候后台验证密码是否正确
     *
     * @param user
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/person/basic/account/checkPassword")
    public Map<String, Object> checkPassword(@RequestBody User user, HttpServletRequest request) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        Map<String, Object> map = new HashMap<>();
        map.put("info", "正确");
        if (!currentUser.getPassword().equals(user.getPassword())) {
            map.put("info", "密码错误");
        }
        return map;
    }


}
