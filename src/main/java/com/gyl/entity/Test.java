package com.gyl.entity;

import org.springframework.stereotype.Component;

@Component
public class Test {
    public Integer id;
    public String info;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", info='" + info + '\'' +
                '}';
    }
}
