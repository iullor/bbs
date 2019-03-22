package com.gyl.controller;


import com.gyl.entity.Post;
import com.gyl.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author gyl
 */
@Controller
public class PostController {
    @Autowired
    private PostService postService;

    /**
     * 显示所有的贴子
     *
     * @return
     */
    @RequestMapping(value = "/post")
    public String list() {

        return "foreground/post/post_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.PUT)
    public String add() {

        return "redirect:/post";
    }

    @RequestMapping(value = "/post", method = RequestMethod.PUT)
    public String update() {

        return "redirect:/post";
    }

    @RequestMapping(value = "/post", method = RequestMethod.DELETE)
    public String delete() {

        return "redirect:/post";
    }


    /**
     * 进入发帖的页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/post/input/{id}", method = RequestMethod.GET)
    public String input(@PathVariable("id") String id, Model model) {
        if (id != null) {
            //从数据库中查出来数据

        }
        Post post = new Post();
        model.addAttribute("post", post);
        return "foreground/post/post_edit";
    }


    /**
     * 快速发帖
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/post/quickInput/{id}", method = RequestMethod.GET)
    public String quickInput(@PathVariable("id") String id, Model model) {
        if (id != null) {
            //从数据库中查出来数据

        }
        Post post = new Post();
        model.addAttribute("post", post);
        return "foreground/post/write_post_quickly";
    }
}
