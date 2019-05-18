package com.gyl.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author gyl
 * 一个版中有很多区
 * 分区信息
 */
@Component
public class Area {
    private String id;
    private String areaTitle;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    private String boardId;
    private String areaManagerId;
    private String info;
    private String details;
    private User user;
    private Board board;
    /**
     * 版主
     */
    private List<User> users = new ArrayList<>();
    /**
     * 包含所有的贴子
     */
    private List<Post> posts = new ArrayList<>();

    private Integer postNumbers;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAreaTitle() {
        return areaTitle;
    }

    public void setAreaTitle(String areaTitle) {
        this.areaTitle = areaTitle;
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

    public String getAreaManagerId() {
        return areaManagerId;
    }

    public void setAreaManagerId(String areaManagerId) {
        this.areaManagerId = areaManagerId;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }


    public Board getBoard() {
        return board;
    }

    public void setBoard(Board board) {
        this.board = board;
    }

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getPostNumbers() {
        return postNumbers;
    }

    public void setPostNumbers(Integer postNumbers) {
        this.postNumbers = postNumbers;
    }
}
