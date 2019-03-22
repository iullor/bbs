package com.gyl.controller.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 个人收藏
 *
 * @author gyl
 */
@Controller
public class CollectionController {


    /**
     * 收藏板块
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/boards", method = RequestMethod.GET)
    public String board() {

        return "/person/collection/collection_boards";
    }

    /**
     * 收藏贴子
     *
     * @return
     */
    @RequestMapping(value = "/person/collection/posts", method = RequestMethod.GET)
    public String post() {

        return "/person/collection/collection_posts";
    }
}
