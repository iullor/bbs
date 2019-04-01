package com.gyl.controller;

import com.gyl.entity.Comment;
import com.gyl.entity.Reply;
import com.gyl.entity.User;
import com.gyl.service.CommentService;
import com.gyl.service.MessageService;
import com.gyl.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author gyl
 * 评论
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private MessageService messageService;


    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String add(Comment comment, String postUserId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        comment.setUserId(user.getId());
        int status = commentService.add(comment);
        //添加成功，发送一条消息给对方
        if (status > 0) {
            int status2 = messageService.sendCommentToUser(comment, postUserId);
        }
        String postId = comment.getPostId();
        return "redirect:/post/" + postId;
    }

    @RequestMapping(value = "/comment/reply", method = RequestMethod.POST)
    public String addReply(Reply reply, String commentContent, HttpServletRequest request, String postId) {
        /*
         * 接受一些，无法封装的参数
         * */
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        reply.setFromUserId(user.getId());
        reply.setReplyContent(commentContent);
        int stauts = replyService.addReplyToComment(reply);
        return "redirect:/post/" + postId;
    }
}
