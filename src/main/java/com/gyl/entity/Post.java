package com.gyl.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    private String boardId;
    private String areaId;

    /**
     * 评论数
     */
    private Integer comm;
    /**
     * 发帖人的信息
     */
    private User user;

    /**
     * 评论的列表
     */
    List<Comment> comments = new ArrayList<>();

    /**
     * 贴子的类型
     */
    List<PostType> types = new ArrayList<>();

    /**
     * 参与 人数
     */
    private Integer participants;
    /**
     * 点赞数
     */
    private int praises;

    /**
     * 是否禁止评论
     */
    private Integer banComment;
    /**
     * 是否置顶
     */
    private Integer up;
    /**
     * 贴子是否私密
     */
    private Integer secret;

    private Praise praise;

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
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

    public int getPraises() {
        return praises;
    }

    public void setPraises(int praises) {
        this.praises = praises;
    }

    public Praise getPraise() {
        return praise;
    }

    public void setPraise(Praise praise) {
        this.praise = praise;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<PostType> getTypes() {
        return types;
    }

    public void setTypes(List<PostType> types) {
        this.types = types;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getBanComment() {
        return banComment;
    }

    public void setBanComment(Integer banComment) {
        this.banComment = banComment;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    public Integer getSecret() {
        return secret;
    }

    public void setSecret(Integer secret) {
        this.secret = secret;
    }

    public Integer getComm() {
        return comm;
    }

    public void setComm(Integer comm) {
        this.comm = comm;
    }

}
