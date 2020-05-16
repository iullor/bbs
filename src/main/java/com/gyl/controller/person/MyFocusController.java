package com.gyl.controller.person;

import com.gyl.commons.StatusCode;
import com.gyl.entity.Collection;
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
 *
 */
@Controller
public class MyFocusController {
    @Autowired
    private CollectionService collectionService;

    /**
     * 关注的用户
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/person/myfocus", method = RequestMethod.GET)
    public String myFocusUsers(HttpServletRequest request, Model model) {
        User currentUser = (User) request.getSession().getAttribute("CURRENT_USER");
        List<Collection> myFocusUsers = collectionService.listMyCollectionUser(currentUser.getId());
        model.addAttribute("myFocusUsers", myFocusUsers);
        return "/person/focus/focus_person";
    }


    /**
     * 取消当前用户关注的分区
     * 接受前台传递过来的json
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/myfocus/{options}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cancelUserFromCollections(@RequestBody Collection collection, @PathVariable("options") String options, HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        User user = (User) request.getSession().getAttribute("CURRENT_USER");
        collection.setCurrentUserId(user.getId());
        if (options != null && options.equals("0")) {
            //取消
            int status = collectionService.cancelUserFromCollections(collection);
            if (status == 1) {
                map.put("status", StatusCode.CANCEL_USER_SUCCESS);
            }
        }
        return map;
    }
}
