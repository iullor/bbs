package com.gyl.controller.admin;

import com.gyl.commons.page.PageResult;
import com.gyl.entity.*;
import com.gyl.service.BrokenRulesService;
import com.gyl.service.MessageService;
import com.gyl.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 贴子
 *
 *
 */
@Controller
public class AdminPostController {

    @Autowired
    private PostService postService;

    @Autowired
    private BrokenRulesService brokenRulesService;

    @Autowired
    private MessageService messageService;

    /**
     * 后台管理人员,根据不同的身份对不同板块，模块的贴子的查看权限不一样
     */
    @RequestMapping(value = "/admin/post", method = RequestMethod.GET)
    public String list(HttpServletRequest request, Model model, Integer currentPage, Integer pageSize) {
        if (currentPage == null || pageSize == null) {
            //默认值
            currentPage = 1;
            pageSize = 10;
        }
        //可以查看所有的posts
        List<Post> posts = postService.selectPosts();
        User manager = (User) request.getSession().getAttribute("ADMIN_USER");
        //模块管理者,仅对本模块的贴子操作
        if (manager.getUserAccountStatus().getRole() == 2) {
            posts = postService.selectPostsByBoardIdAndPanelManagerId(manager.getId());
        }
        //板块管理者，只能对本板块的贴子操作
        if (manager.getUserAccountStatus().getRole() == 3) {
            posts = postService.selectPostsByBoardIdAndBoardIdManagerId(manager.getId());
        }
        //分页的内容,把每个角色对应应该查出来的贴子分页处理后,再返回回来
        PageResult pageResult = postService.sortPageByAdmin(posts, currentPage, pageSize);
        posts = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("posts", posts);
        return "admin/post/list";
    }


    @RequestMapping(value = "/admin/post/update")
    public String updatePostStatus(String id, String up, String banComment, String secret, String remakes, String userId, HttpServletRequest request) {
        User manager = (User) request.getSession().getAttribute("ADMIN_USER");
        Post post = postService.selectPostById(id);
        //管理的设置禁止的的级别比普通用户更高一级,但他无法查看是否用户将它自己的贴子设置为私密,或者禁止评论
        if ("on".equals(up)) {
            post.setUp(1);
        } else {
            post.setUp(0);
        }
        if ("on".equals(banComment)) {
            post.setBanComment(2);
        } else {
            post.setBanComment(0);
        }
        if ("on".equals(secret)) {
            post.setSecret(2);
        } else {
            post.setSecret(0);
        }
        BrokenRules brokenRules = new BrokenRules();
        brokenRules.setPostId(id);
        brokenRules.setInfo(remakes);
        brokenRules.setTimes(1);
        brokenRules.setUserId(userId);
        brokenRulesService.insert(brokenRules);
        //给用户发一条消息
        Message message = new Message();
        message.setMessage(remakes);
        message.setToUserId(userId);
        message.setMessageType("贴子违规");
        message.setReadStatus(0);
        message.setFromUserId(manager.getId());
        message.setCreateTime(new Date(System.currentTimeMillis()));
        int i = messageService.sendBrokenRulesMessage(message);
        int status = postService.update(post);
        return "redirect:/admin/post";
    }


    /**
     * =====================对贴子类型的操作=============================
     */

    @RequestMapping(value = "/admin/post/input/{id}", method = RequestMethod.GET)
    public String addPostOrders(@PathVariable("id") String id, Model model) {
        List<PostType> types = postService.listPostType();
        model.addAttribute("types", types);
        return "admin/post/edit";
    }


    @RequestMapping(value = "/admin/postType", method = RequestMethod.POST)
    public String addPostType(PostType postType) {
        if (postType.getId() != null) {
            postService.updatePostType(postType);
        } else {
            int status = postService.addPostType(postType);
        }
        return "redirect:/admin/post/input/0";
    }

    @RequestMapping(value = "/admin/postType/{id}")
    public String deletePostType(@PathVariable("id") String id) {
        postService.deletePostType(id);
        return "redirect:/admin/post/input/0";
    }


    /**
     * 后台管理人员,根据不同的身份对不同板块，模块的贴子的查看权限不一样
     */
    @RequestMapping(value = "/admin/post/searchByPostTitle", method = RequestMethod.GET)
    public String searchPost(String postTitle, HttpServletRequest request, Model model) {
        int currentPage = 1;
        int pageSize = 10;
        //可以查看所有的posts
        List<Post> posts = postService.selectByPostTitle(postTitle);
        User manager = (User) request.getSession().getAttribute("ADMIN_USER");
        //模块管理者,仅对本模块的贴子操作
        //分页的内容,把每个角色对应应该查出来的贴子分页处理后,再返回回来
        PageResult pageResult = postService.sortPageByAdmin(posts, currentPage, pageSize);
        posts = pageResult.getNewPage();
        model.addAttribute("pageResult", pageResult);
        model.addAttribute("posts", posts);
        return "admin/post/list";
    }

}
