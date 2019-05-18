package com.gyl.controller;

import com.gyl.commons.StatusCode;
import com.gyl.entity.Collection;
import com.gyl.entity.User;
import com.gyl.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 个人收藏
 *
 * @author gyl
 */
@Controller
@SuppressWarnings("all")
public class CollectionController {

    @Autowired
    private CollectionService collectionService;

    /**
     * 根据areId和当前的user查找
     *
     * @param collection
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collection/area", method = RequestMethod.POST)
    public Map<String, Object> getCollectedAreaFromCollections(@RequestBody Collection collection, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        collection.setCurrentUserId(user.getId());
        Map<String, Object> map = new HashMap<>();
        Collection collection1 = collectionService.getCollectByAreaId(collection);
        if (collection1 != null) {
            map.put("collectedArea", "1");
        }
        return map;
    }

    /**
     * 收藏分区
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collection/area/{options}", method = RequestMethod.POST)
    public Map<String, Object> addAreaToCollections(@RequestBody Collection collection, @PathVariable("options") String options, HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        collection.setCurrentUserId(user.getId());
        if (options != null && options.equals("0")) {
            //取消
            int status = collectionService.cancelAreaFromCollections(collection);
            if (status == 1) {
                map.put("status", StatusCode.CANCEL_AREA__SUCCESS);
            }
        } else if (options != null && options.equals("1")) {
            int status = collectionService.addAreaToCollections(collection);
            if (status == 1) {
                map.put("status", StatusCode.COLLECT_AREA_SUCCESS);
            }
        }
        return map;
    }

    /**
     * 根据user_id和当前的user查找
     *
     * @param collection
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collection/post", method = RequestMethod.POST)
    public Map<String, Object> getCollectedPostFromCollections(@RequestBody Collection collection, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        try {
            collection.setCurrentUserId(user.getId());
            Collection collection1 = collectionService.getCollectByPostId(collection);
            if (collection1 != null) {
                map.put("collectedPost", "1");
            }
        } catch (Exception e) {
        }
        return map;
    }

    /**
     * 收藏贴子
     * 接受前台传递过来的json
     *
     * @return
     */
    @RequestMapping(value = "/collection/post/{options}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addPostToCollections(@RequestBody Collection collection, @PathVariable("options") String options, HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        try {
            collection.setCurrentUserId(user.getId());
            if (options != null && options.equals("0")) {
                //取消
                int status = collectionService.cancelPostFromCollections(collection);
                if (status == 1) {
                    map.put("status", StatusCode.CANCEL_POST_SUCCESS);
                }
            } else if (options != null && options.equals("1")) {
                //关注
                int status = collectionService.addPostToCollections(collection);
                if (status == 1) {
                    map.put("status", StatusCode.COLLECT_POST_SUCCESS);
                }
            }
        } catch (Exception e) {
        }
        return map;
    }


    /**
     * 根据user_id和当前的user查找
     *
     * @param collection
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/collection/user", method = RequestMethod.POST)
    public Map<String, Object> getCollectedUserFromCollections(@RequestBody Collection collection, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        Map<String, Object> map = new HashMap<>();
        try {
            collection.setCurrentUserId(user.getId());
            Collection collection1 = collectionService.getCollectByUserId(collection);
            if (collection1 != null) {
                map.put("collectedUser", "1");
            }
        } catch (Exception e) {
        }
        return map;
    }


    /**
     * 收藏贴子
     * 接受前台传递过来的json
     * 根据前台传递过来的操作符来判断是取消还是关注用户
     *
     * @return
     */
    @RequestMapping(value = "/collection/user/{options}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addUserToCollections(@PathVariable("options") String options, @RequestBody Collection collection, HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        try {
            collection.setCurrentUserId(user.getId());
            if (options != null && options.equals("0")) {
                //取消
                int status = collectionService.cancelUserFromCollections(collection);
                if (status == 1) {
                    map.put("status", StatusCode.CANCEL_USER_SUCCESS);
                }
            } else if (options != null && options.equals("1")) {
                //关注
                int status = collectionService.addUserToCollections(collection);
                if (status == 1) {
                    map.put("status", StatusCode.COLLECT_USER_SUCCESS);
                }
            }
        } catch (Exception e) {
        }
        return map;
    }
}
