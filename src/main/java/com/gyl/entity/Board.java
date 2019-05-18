package com.gyl.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@Component
public class Board {
    private String id;
    private String boardTitle;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
     * board的类型
     */
    private String boardType;

    private String logoPath;
    /**
     * board的管理者
     */
    private String boardManagerId;
    /**
     * board和哪一个模块相连
     */
    private String panelId;

    private Panel panel;
    private User user;
    private String info;
    private String details;

    /**
     * panel 的管理者
     */
    private List<User> userList = new ArrayList<>();

    /**
     * 板块
     */
    private List<Area> areas = new ArrayList<>();
    /**
     * 当前该板块下所有的贴子
     */
    private List<Post> posts = new ArrayList<>();

    /**
     * 该板块下当前比较或的贴子
     */
    private List<Post> hotPosts = new ArrayList<>();

    /**
     * 贴子数
     */
    private Integer postNumbers;
    /**
     * 分区数
     */
    private Integer areaNumbers;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getBoardType() {
        return boardType;
    }

    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getBoardManagerId() {
        return boardManagerId;
    }

    public void setBoardManagerId(String boardManagerId) {
        this.boardManagerId = boardManagerId;
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

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public List<Area> getAreas() {
        return areas;
    }

    public void setAreas(List<Area> areas) {
        this.areas = areas;
    }

    public String getPanelId() {
        return panelId;
    }

    public void setPanelId(String panelId) {
        this.panelId = panelId;
    }

    public Panel getPanel() {
        return panel;
    }

    public void setPanel(Panel panel) {
        this.panel = panel;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public List<Post> getHotPosts() {
        return hotPosts;
    }

    public void setHotPosts(List<Post> hotPosts) {
        this.hotPosts = hotPosts;
    }

    public Integer getPostNumbers() {
        return postNumbers;
    }

    public void setPostNumbers(Integer postNumbers) {
        this.postNumbers = postNumbers;
    }

    public Integer getAreaNumbers() {
        return areaNumbers;
    }

    public void setAreaNumbers(Integer areaNumbers) {
        this.areaNumbers = areaNumbers;
    }
}
