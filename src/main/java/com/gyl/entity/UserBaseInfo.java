package com.gyl.entity;

import org.springframework.stereotype.Component;

import java.sql.Date;

/**
 * 用户基本信息
 */
@Component
public class UserBaseInfo {
    private String name;
    private Integer age;
    private Date birthday;
    private String headImage;
    private String hobbies;
    private String phomeNumber;
    private String qqNumber;
    private String province;
    private String city;
    private String street;
    private String details;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getPhomeNumber() {
        return phomeNumber;
    }

    public void setPhomeNumber(String phomeNumber) {
        this.phomeNumber = phomeNumber;
    }

    public String getQqNumber() {
        return qqNumber;
    }

    public void setQqNumber(String qqNumber) {
        this.qqNumber = qqNumber;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "UserBaseInfo{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", birthday=" + birthday +
                ", headImage='" + headImage + '\'' +
                ", hobbies='" + hobbies + '\'' +
                ", phomeNumber='" + phomeNumber + '\'' +
                ", qqNumber='" + qqNumber + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", street='" + street + '\'' +
                ", details='" + details + '\'' +
                '}';
    }
}
