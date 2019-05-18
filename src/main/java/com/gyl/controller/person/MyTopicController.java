package com.gyl.controller.person;

import com.gyl.entity.Topic;
import com.gyl.entity.User;
import com.gyl.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 自己创建的话题
 *
 * @author gyl
 */
@Controller
public class MyTopicController {
    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";

    @Autowired
    private TopicService topicService;

    @RequestMapping(value = "/person/topic", method = RequestMethod.GET)
    public String list(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Topic> topics = topicService.selectByUserId(user.getId());
        model.addAttribute("topics", topics);
        return "/person/topic/list";
    }

    @RequestMapping(value = "/person/topic/input/{id}", method = RequestMethod.GET)
    public String input(@PathVariable("id") String id, Model model) {
        Topic topic = new Topic();
        if (id != null && !"0".equals(id)) {
            topic = topicService.selectById(id);
        }
        model.addAttribute("topic", topic);
        return "/person/topic/edit";
    }

    @RequestMapping(value = "/person/topic", method = RequestMethod.POST)
    public String add(Topic topic, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        topic.setUserId(user.getId());
        int insert = topicService.add(topic);
        return "redirect:/public";
    }


    @RequestMapping(value = "/person/topic/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") String id) {
        int i = topicService.deleteById(id);
        return "redirect:/person/topic";
    }

    @RequestMapping(value = "/person/topic/edit", method = RequestMethod.POST)
    public String edit(Topic topic) {
        int status = topicService.update(topic);
        return "redirect:/person/topic";
    }

    /**
     * 设置上传文件
     * 返回文件的路径,以及信息
     *
     * @param multipartFile
     */
    @SuppressWarnings("all")
    @ResponseBody
    @RequestMapping(value = "/person/topic/uploadPicture", method = RequestMethod.POST)
    public String form(@RequestParam("topicPicture1") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String path = "";
        String realPath = session.getServletContext().getRealPath("/");
        File file1 = new File(realPath + "/upload/topic/");
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
            path = uploadPath + newFileName;
            return path;
        }
        return path;
    }
}
