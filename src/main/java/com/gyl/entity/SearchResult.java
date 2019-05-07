package com.gyl.entity;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gyl
 * 保存搜索显示的信息
 */
@Component
public class SearchResult {

    List<User> users = new ArrayList<>();
    List<Post> posts = new ArrayList<>();
    List<Topic> topics = new ArrayList<>();
    List<Area> areas = new ArrayList<>();
    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public List<Topic> getTopics() {
        return topics;
    }

    public void setTopics(List<Topic> topics) {
        this.topics = topics;
    }

    public List<Area> getAreas() {
        return areas;
    }

    public void setAreas(List<Area> areas) {
        this.areas = areas;
    }
}
