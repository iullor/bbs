package com.gyl.controller;


import com.alibaba.fastjson.JSON;
import com.gyl.entity.*;
import com.gyl.service.BoardService;
import com.gyl.service.CommentService;
import com.gyl.service.PostService;

import com.gyl.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author gyl
 */
@Controller
public class PostController {
    @Autowired
    private PostService postService;
    @Autowired
    private CommentService commentService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private BoardService boardService;

    /**
     * 显示一个贴子
     *
     * @return
     */
    @RequestMapping(value = "/post/{id}", method = RequestMethod.GET)
    public String list(@PathVariable("id") String id, Model model, HttpServletRequest request) {
        Post post = postService.listById(id);
        //设置观看度，没点击一次就加1
        post.setParticipants(post.getParticipants() + 1);
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        int a = postService.update(post);
        //显示所有的评论,以及下面所有的回复
        int status = postService.listPraiseById(user.getId(), id);
        post = postService.listById(id);
        if (status > 0) {
            model.addAttribute("hasPraised", "hasPraised");
        }
        List<Comment> comments = commentService.listCommentsByPostId(id);
        for (Comment comment : comments) {
            List<Reply> replies = replyService.listReplyByCommentId(comment.getId());
            comment.setReplyNumber(comment.getReplies().size());
            comment.setReplies(replies);
        }
        post.setComments(comments);
        model.addAttribute("post", post);
        return "/foreground/post/post_list";
    }


    /**
     * 添加完一个贴子，跳进一个区，贴子的列表
     *
     * @param post
     * @param request
     * @return
     */
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String add(Post post, HttpServletRequest request, String code) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        String areaId = post.getAreaId();
        post.setUserId(user.getId());
        //去获取是否发帖的时候私密
        if (code != null && "on".equals(code)) {
            post.setSecret(1);
        } else {
            post.setSecret(0);
        }

        int status = postService.addPost(post);
        return "redirect:/area/" + areaId;
    }

    @RequestMapping(value = "/post", method = RequestMethod.PUT)
    public String update(Post post, HttpServletRequest request, String code) {
        if (code != null && "on".equals(code)) {
            post.setSecret(1);
        } else {
            post.setSecret(0);
        }
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        post.setUserId(user.getId());
        int status = postService.update(post);
        return "redirect:/person/mypost";
    }

    @RequestMapping(value = "/post/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") String id) {
        int status = postService.delete(id);
        return "redirect:/person/mypost";
    }

    /**
     * 进入发帖的编辑页面
     *
     * @param id
     * @param model
     * @return
     */
    @SuppressWarnings("all")
    @RequestMapping(value = "/post/input/{id}", method = RequestMethod.GET)
    public String input(@PathVariable("id") String id, Model model) {
        Post post = new Post();
        List<PostType> types = postService.listPostType();
        //查找到所有的板块,机器下面的areas
        List<Board> boards = boardService.listBoardsAndAreas();
        if (id != null && !id.equals("0")) {
            //从数据库中查出来数据
            post = postService.selectPostById(id);

        }
        model.addAttribute("post", post);
        model.addAttribute("types", types);
        model.addAttribute("boards", boards);
        return "foreground/post/post_edit";
    }

    /**
     * 快速发帖
     *
     * @param id
     * @param model
     * @return
     */
    @SuppressWarnings("all")
    @RequestMapping(value = "/post/quickInput/{id}", method = RequestMethod.GET)
    public String quickInput(@PathVariable("id") String id, Model model) {
        Post post = new Post();
        List<PostType> types = postService.listPostType();
        if (id != null && !id.equals("0")) {
            post = postService.selectPostById(id);
        }
        model.addAttribute("post", post);
        model.addAttribute("types", types);
        return "foreground/post/write_post_quickly";
    }


    /**
     * 点赞操作
     *
     * @param options
     * @param p
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/post/update/praise/{options}", method = RequestMethod.POST)
    public int update(@PathVariable("options") Integer options, @RequestBody Post p, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        Post post = postService.selectPostById(p.getId());
        int num = 0;
        if (options > 0) {
            //去点赞表中插入一条数据，贴子的点赞数加1
            int status = postService.add(user.getId(), p.getId());
            if (status > 0) {
                num = post.getPraises() + 1;
                post.setPraises(num);
            }
        } else {
            //取消点赞
            int status = postService.deletePaise(user.getId(), post.getId());
            if (status > 0) {
                num = post.getPraises() - 1;
                if (num > -1) {
                    post.setPraises(num);
                }
            }
        }
        int status1 = postService.update(post);
        if (status1 > 0) {
            return num;
        }
        return 0;
    }

    /**
     * 主页点击换一批，更换一批贴子的推荐
     * json 格式传输
     */
    @ResponseBody
    @RequestMapping(value = "/post/changeOthers", method = RequestMethod.GET)
    public String changeOtherPosts() {
        List<Post> hotPosts = postService.listHotPosts(4);
        String hotPostsString = JSON.toJSONString(hotPosts);
        return hotPostsString;
    }


}
