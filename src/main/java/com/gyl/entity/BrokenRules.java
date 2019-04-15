package com.gyl.entity;

import org.springframework.stereotype.Component;

/**
 * @author gyl
 */
@Component
public class BrokenRules {
    private Integer id;

    /**
    * 违规次数
    */
    private Integer times;

    /**
    * 违规信息
    */
    private String info;

    /**
    * 违规的用户
    */
    private String userId;

    /**
    * 违规的贴子
    */
    private String postId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }
}