package com.gyl.entity;

import org.springframework.stereotype.Component;

/**
 * 用户状态
 *
 * @author gyl
 */
@Component
public class UserAccountStatus {
    private String allowPost;
    private String allowComment;
    private String warningInfo;
    private String status;
    /**
     * 用户的角色
     */
    private int role;

    public String getAllowPost() {
        return allowPost;
    }

    public void setAllowPost(String allowPost) {
        this.allowPost = allowPost;
    }

    public String getAllowComment() {
        return allowComment;
    }

    public void setAllowComment(String allowComment) {
        this.allowComment = allowComment;
    }

    public String getWarningInfo() {
        return warningInfo;
    }

    public void setWarningInfo(String warningInfo) {
        this.warningInfo = warningInfo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
