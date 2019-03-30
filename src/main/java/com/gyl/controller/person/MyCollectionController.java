package com.gyl.controller.person;

import com.gyl.commons.StatusCode;
import com.gyl.entity.Area;
import com.gyl.entity.Collection;
import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gyl
 */
@Controller
public class MyCollectionController {
    @Autowired
    private CollectionService collectionService;


    /**
     * 个人收藏的所有分区
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/myAreas", method = RequestMethod.GET)
    public String areasList(HttpServletRequest request, Model model) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Area> areas = collectionService.listMyCollectionAreas(currentUser.getId());
        model.addAttribute("areas", areas);
        return "person/collection/collection_areas";
    }

    /**
     * 取消当前用户关注的分区
     * 接受前台传递过来的json
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/myareas/{options}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cancelAreaFromCollections(@RequestBody Collection collection, @PathVariable("options") String options, HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        collection.setCurrentUserId(user.getId());
        if (options != null && options.equals("0")) {
            //取消
            int status = collectionService.cancelAreaFromCollections(collection);
            if (status == 1) {
                map.put("status", StatusCode.CANCEL_AREA__SUCCESS);
            }
        }
        return map;
    }

    /**
     * 个人收藏的所有贴子
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/myPosts", method = RequestMethod.GET)
    public String postsList(HttpServletRequest request, Model model) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Post> posts = collectionService.listMyCollectionPosts(currentUser.getId());
        model.addAttribute("posts", posts);
        return "person/collection/collection_posts";
    }

    /**
     * 取消当前用户关注的贴子
     * 接受前台传递过来的json
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/mypost/{options}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cancelPostFromCollections(@RequestBody Collection collection, @PathVariable("options") String options, HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        collection.setCurrentUserId(user.getId());
        if (options != null && options.equals("0")) {
            //取消
            int status = collectionService.cancelPostFromCollections(collection);
            if (status == 1) {
                map.put("status", StatusCode.CANCEL_POST_SUCCESS);
            }
        }
        return map;
    }


}
