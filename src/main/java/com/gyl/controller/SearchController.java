package com.gyl.controller;

import com.gyl.entity.SearchResult;
import com.gyl.entity.User;
import com.gyl.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 搜索的控制器
 *
 * @author gyl
 */
@Controller
public class SearchController {
    @Autowired
    private SearchService searchService;

    /**
     * ajax异步查询
     *
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/search/asynchronous/{keyword}", method = RequestMethod.GET)
    @ResponseBody
    public SearchResult searchAsynchronous(@PathVariable("keyword") String keyword) {
        SearchResult results = searchService.search(keyword);
        return results;
    }
    /**
     * 同步查询，跳转到别的页面
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(String keyword, Model model) {
        SearchResult searchResults = searchService.search(keyword);
        model.addAttribute("searchResults", searchResults);
        return "search";
    }
}
