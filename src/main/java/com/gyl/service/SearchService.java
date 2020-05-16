package com.gyl.service;

import com.gyl.entity.*;
import com.gyl.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 搜索
 *
 *
 */
@Service
public class SearchService {
    @Autowired
    private SearchMapper searchMapper;

    public SearchResult search(String keyword) {
        List<User> users = searchMapper.searchUserByNickName(keyword);
        List<Area> areas = searchMapper.searchAreaByAreaTitle(keyword);
        List<Post> posts = searchMapper.searchPostByPostTitle(keyword);
        List<Topic> topics = searchMapper.searchTopicByTopicTitle(keyword);
        SearchResult searchResults = new com.gyl.entity.SearchResult();
        searchResults.setUsers(users);
        searchResults.setTopics(topics);
        searchResults.setAreas(areas);
        searchResults.setPosts(posts);
        return searchResults;
    }
}
