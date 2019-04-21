package com.gyl.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 回复贴子
 *
 * @author gyl
 */
@Component
public class Reply {

    private String id;
    /**
     * 对评论的回复
     */
    private String toCommentId;
    /**
     * 对讨论的回复
     */
    private String toDiscussId;
    private String replyId;
    private String replyType;
    private String replyContent;
    private String fromUserId;
    private String toUserId;

    /**
     * 回复时间距现在
     */
    private String lastTime;

    private User user;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getToCommentId() {
        return toCommentId;
    }

    public void setToCommentId(String toCommentId) {
        this.toCommentId = toCommentId;
    }

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    public String getReplyType() {
        return replyType;
    }

    public void setReplyType(String replyType) {
        this.replyType = replyType;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(String fromUserId) {
        this.fromUserId = fromUserId;
    }

    public String getToUserId() {
        return toUserId;
    }

    public void setToUserId(String toUserId) {
        this.toUserId = toUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getToDiscussId() {
        return toDiscussId;
    }

    public void setToDiscussId(String toDiscussId) {
        this.toDiscussId = toDiscussId;
    }
}
