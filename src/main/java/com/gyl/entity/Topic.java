package com.gyl.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author gyl
 */
@Component
public class Topic {
    private String id;

    /**
     * 话题的标题
     */
    private String topicTitle;

    /**
     * 话题表
     */
    private String userId;

    /**
     * 话题的配图
     */
    private String topicPicture;

    /**
     * 话题的详细描述
     */
    private String topicDescribe;

    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 话题的等级
     */
    private Integer level;

    /**
     * 参与度
     */
    private Integer topicParticipations;

    /**
     *
     */
    private User user;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTopicPicture() {
        return topicPicture;
    }

    public void setTopicPicture(String topicPicture) {
        this.topicPicture = topicPicture;
    }

    public String getTopicDescribe() {
        return topicDescribe;
    }

    public void setTopicDescribe(String topicDescribe) {
        this.topicDescribe = topicDescribe;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getTopicParticipations() {
        return topicParticipations;
    }

    public void setTopicParticipations(Integer topicParticipations) {
        this.topicParticipations = topicParticipations;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}