package com.gyl.controller;

import com.gyl.entity.Discuss;
import com.gyl.entity.Post;
import com.gyl.entity.Reply;
import com.gyl.entity.User;
import com.gyl.service.DiscussService;
import com.gyl.service.MessageService;
import com.gyl.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author gyl
 */
@Controller
public class DiscussController {
    private static String uploadPath = "/home/gyl/Pictures/bbs-files/";
    @Autowired
    private DiscussService discussService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private ReplyService replyService;

    @RequestMapping(value = "/discuss", method = RequestMethod.POST)
    public String insert(Discuss discuss, HttpServletRequest request, String toUserId) {
        String topicId = discuss.getTopicId();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        String userId = user.getId();
        discuss.setUserId(userId);
        int status = discussService.insert(discuss);
        if (status > 0) {
            //这里发送一条信息给话题的发起者，的拥有者
            int i = messageService.sendDiscussToTopicOwner(discuss, toUserId);
        }
        return "redirect:/public/" + topicId;
    }

    /**
     * 设置上传文件
     * 返回文件的路径,以及信息
     * discussPerPicture 上传每一张图片
     *
     * @param multipartFile
     */
    @SuppressWarnings("all")
    @ResponseBody
    @RequestMapping(value = "/discuss/uploadImages", method = RequestMethod.POST)
    public String form(@RequestParam("discussPerPicture") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String path = "";
        String realPath = session.getServletContext().getRealPath("/");
        File file1 = new File(realPath + "/upload/discuss/");
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

    /**
     * 点赞操作
     *
     * @param options
     * @param p
     * @return
     */
    @SuppressWarnings("all")
    @ResponseBody
    @RequestMapping(value = "/discuss/update/praise/{options}", method = RequestMethod.POST)
    public int update(@PathVariable("options") Integer options, @RequestBody Discuss d, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        Discuss discuss = discussService.selectById(d.getId());
        int num = 0;
        if (options > 0) {
            //去点赞表中插入一条数据，贴子的点赞数加1
            int status = discussService.add(user.getId(), d.getId());
            if (status > 0) {
                num = discuss.getPraises() + 1;
                discuss.setPraises(num);
            }
        } else {
            //取消点赞
            int status = discussService.deletePaise(user.getId(), discuss.getId());
            if (status > 0) {
                num = discuss.getPraises() - 1;
                if (num > -2) {
                    discuss.setPraises(num);
                }
            }
        }
        int status1 = discussService.update(discuss);
        if (status1 > 0) {
            return num;
        }
        return 0;
    }


    /**
     * 前台发送ajax 验证每条讨论是不是已经被当前用户点过赞，点过的话，就回显
     *
     * @param request
     * @param discussId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/discuss/praise/{discussId}", method = RequestMethod.GET)
    public int hasPraises(@PathVariable("discussId") String discussId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        int i = discussService.listPraiseById(user.getId(), discussId);
        return i;
    }

    /**
     * ajax添加
     *
     * @param reply
     * @return
     */
    @RequestMapping(value = "/discuss/reply", method = RequestMethod.POST)
    public String addReplyToDiscuss(Reply reply, String topicId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        String toDiscussId = reply.getToDiscussId();
        //添加一条新的回复
        reply.setFromUserId(user.getId());
        int i = replyService.addReplyToDiscuss(reply);
        return "redirect:/public/" + topicId;
    }


    /**
     * 前台发送ajax ，根据每条讨论去找对应的回复，找到一个集合
     *
     * @param request
     * @param discussId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/discuss/reply/list/{discussId}", method = RequestMethod.GET)
    public List<Reply> list(@PathVariable("discussId") String discussId, HttpServletRequest request) {
        List<Reply> replies = replyService.listReplyByDiscussId(discussId);
        return replies;
    }


}
