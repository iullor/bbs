package com.gyl.controller.admin;

import com.gyl.entity.Post;
import com.gyl.entity.PostType;
import com.gyl.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 贴子
 *
 * @author gyl
 */
@Controller
public class AdminPostController {

    @Autowired
    private PostService postService;

    /**
     * 后台管理人员
     */
    @RequestMapping(value = "/admin/post", method = RequestMethod.GET)
    public String list() {

        return "admin/post/list";
    }

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

}
