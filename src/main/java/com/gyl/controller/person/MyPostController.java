package com.gyl.controller.person;

import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 个人贴子
 *
 * @author gyl
 */
@Controller
public class MyPostController {

    @Autowired
    private PostService postService;

    /**
     * 个人贴子
     *
     * @return
     */
    @RequestMapping(value = "/person/mypost", method = RequestMethod.GET)
    public String list(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Post> posts = postService.getMyPostById(user.getId());
        model.addAttribute("posts", posts);
        return "person/post/person_posts";
    }

    @RequestMapping(value = "/person/mypost/update/{options}", method = RequestMethod.POST)
    public String updatePostStatus(@PathVariable("options") Integer options, @RequestBody Post p) {
        Post post = postService.selectPostById(p.getId());
        if (options == 0) {
            //0 贴子公开
            post.setSecret(0);
        } else if (options == 1) {
            //1贴子私密
            post.setSecret(1);

        } else if (options == 2) {
            //2 随意评论
            post.setBanComment(0);

        } else if (options == 3) {
            //3 禁止评论
            post.setBanComment(1);
        }
        int status = postService.update(post);
        return "person/post/person_posts";
    }
}
