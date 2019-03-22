package com.gyl.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 贴子
 *
 * @author gyl
 */
public class Post {


    private String id;
    private String userId;
    /**
     * 贴子的类型
     * 公开，私密
     */
    private String postType;
    private String postTitle;
    private String postContent;
    private String postFooter;
    private String createTime;
    private String boardId;
    private String areaId;


    List<Comment> comments = new ArrayList<>();


    /**
     * 参与 人数
     */
    private Integer participants;
    /**
     * 点赞数
     */
    private Integer praise;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostFooter() {
        return postFooter;
    }

    public void setPostFooter(String postFooter) {
        this.postFooter = postFooter;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getBoardId() {
        return boardId;
    }

    public void setBoardId(String boardId) {
        this.boardId = boardId;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public Integer getParticipants() {
        return participants;
    }

    public void setParticipants(Integer participants) {
        this.participants = participants;
    }

    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }



}
