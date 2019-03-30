package com.gyl.entity;

import org.springframework.stereotype.Component;

/**
 * @author gyl
 */
@Component
public class PostType {
    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
