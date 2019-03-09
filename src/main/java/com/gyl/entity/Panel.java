package com.gyl.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Panel {
    private String id;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    private String logoPath;
    private String panelManagerId;
    private String info;
    private String detail;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getPanelManagerId() {
        return panelManagerId;
    }

    public void setPanelManagerId(String panelManagerId) {
        this.panelManagerId = panelManagerId;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Panel{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", createTime=" + createTime +
                ", logoPath='" + logoPath + '\'' +
                ", panelManagerId='" + panelManagerId + '\'' +
                ", info='" + info + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}
