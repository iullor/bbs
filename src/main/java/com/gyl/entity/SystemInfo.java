package com.gyl.entity;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统信息
 */
@Component
public class SystemInfo {
    private Integer panelNumbers;
    private Integer boardNumbers;
    private Integer areaNumbers;
    private Integer postNumbers;
    private Integer topicNumbers;
    private Integer noticeNumbers;
    private Integer userNumbers;
    private Integer upPostNumbers;
    private Integer hotTopicNumbers;
    /**
     * 发帖时间，发帖时间分组的帖子数
     */
    private Integer postTime;
    private Integer postCountSortByPostTime = 0;
    /**
     * 按照贴子的类型名，每种类型的数量
     */
    private String postTypeName;
    private Integer postCountSortByPostTypeName = 0;

    public Integer getPanelNumbers() {
        return panelNumbers;
    }

    public void setPanelNumbers(Integer panelNumbers) {
        this.panelNumbers = panelNumbers;
    }

    public Integer getBoardNumbers() {
        return boardNumbers;
    }

    public void setBoardNumbers(Integer boardNumbers) {
        this.boardNumbers = boardNumbers;
    }

    public Integer getAreaNumbers() {
        return areaNumbers;
    }

    public void setAreaNumbers(Integer areaNumbers) {
        this.areaNumbers = areaNumbers;
    }

    public Integer getPostNumbers() {
        return postNumbers;
    }

    public void setPostNumbers(Integer postNumbers) {
        this.postNumbers = postNumbers;
    }

    public Integer getTopicNumbers() {
        return topicNumbers;
    }

    public void setTopicNumbers(Integer topicNumbers) {
        this.topicNumbers = topicNumbers;
    }

    public Integer getNoticeNumbers() {
        return noticeNumbers;
    }

    public void setNoticeNumbers(Integer noticeNumbers) {
        this.noticeNumbers = noticeNumbers;
    }

    public Integer getUserNumbers() {
        return userNumbers;
    }

    public void setUserNumbers(Integer userNumbers) {
        this.userNumbers = userNumbers;
    }

    public Integer getUpPostNumbers() {
        return upPostNumbers;
    }

    public void setUpPostNumbers(Integer upPostNumbers) {
        this.upPostNumbers = upPostNumbers;
    }

    public Integer getHotTopicNumbers() {
        return hotTopicNumbers;
    }

    public void setHotTopicNumbers(Integer hotTopicNumbers) {
        this.hotTopicNumbers = hotTopicNumbers;
    }

    public Integer getPostTime() {
        return postTime;
    }

    public void setPostTime(Integer postTime) {
        this.postTime = postTime;
    }

    public Integer getPostCountSortByPostTime() {
        return postCountSortByPostTime;
    }

    public void setPostCountSortByPostTime(Integer postCountSortByPostTime) {
        this.postCountSortByPostTime = postCountSortByPostTime;
    }

    public String getPostTypeName() {
        return postTypeName;
    }

    public void setPostTypeName(String postTypeName) {
        this.postTypeName = postTypeName;
    }

    public Integer getPostCountSortByPostTypeName() {
        return postCountSortByPostTypeName;
    }

    public void setPostCountSortByPostTypeName(Integer postCountSortByPostTypeName) {
        this.postCountSortByPostTypeName = postCountSortByPostTypeName;
    }
}
