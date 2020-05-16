package com.gyl.controller;

import com.gyl.entity.Comment;
import com.gyl.entity.Post;
import com.gyl.entity.Reply;
import com.gyl.entity.User;
import com.gyl.service.CommentService;
import com.gyl.service.MessageService;
import com.gyl.service.PostService;
import com.gyl.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 *
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

    @Autowired
    private PostService postService;

    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String add(Comment comment, String postUserId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        if (user==null) {
            return "redirect:/logon";
        }
        comment.setUserId(user.getId());
        int status = commentService.add(comment);
        //添加成功，发送一条消息给对方
        if (status > 0) {
            int status2 = messageService.sendCommentToUser(comment, postUserId);
        }
        //贴子的评论数目加1
        String postId = comment.getPostId();
        Post post = postService.listById(postId);
        post.setComm(post.getComm() + 1);
        int update = postService.update(post);
        return "redirect:/post/" + postId;
    }

    /**
     * 对贴子的回复
     *
     * @param reply
     * @param commentContent
     * @param request
     * @param postId
     * @return
     */
    @RequestMapping(value = "/comment/reply", method = RequestMethod.POST)
    public String addReply(Reply reply, String commentContent, HttpServletRequest request, String postId) {
        /*
         * 接受一些，无法封装的参数
         * */
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        reply.setFromUserId(user.getId());
        reply.setReplyContent(commentContent);
        int stauts = replyService.addReplyToComment(reply);
        //回复成功的话,发送一条消息
        int status1 = messageService.sendReplyToUser(reply);
        return "redirect:/post/" + postId;
    }
}
