package com.gyl.entity;

import org.springframework.stereotype.Component;

/**
 * @author gyl
 */
@Component
public class Praise {
    private Integer id;
    private String user_id;
    private String post_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }
}
