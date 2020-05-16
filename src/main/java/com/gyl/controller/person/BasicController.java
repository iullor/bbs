package com.gyl.controller.person;

import com.gyl.entity.User;
import com.gyl.entity.UserBaseInfo;
import com.gyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 个人基本信息,账户信息
 *
 *
 */
@Controller
public class BasicController {
    @Autowired
    private UserService userService;

    @Value("${file.upload.path}")
    private String uploadPath;


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
    public Map<String, Object> form(@RequestParam("headImage") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //String diskPath = uploadPath + "/upload/headImage" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        //地址/日期/文件
        String realPath = session.getServletContext().getRealPath("/").replace("\\", "/");
        String createPath = "upload/headImage/" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
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