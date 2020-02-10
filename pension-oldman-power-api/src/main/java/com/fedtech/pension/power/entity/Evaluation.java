package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Evaluation implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;
    private String name;//组织名称
    private String area;//所属区域
    private String location;//地址
    private String phone;//联系方式
    private String createTime;//创建时间
    private Integer state;//运行状态0停止，1正常，2注销
    private String legalPerson;//法人代表
    private Integer sex;//法人代表性别0保密，1男，2女
    private String legalPersonPhone;//法人联系方式
    private String introduce;//评估组织介绍
    private String photoIds;//风采照片
    private String businessLicenseId;//营业执照

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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getLegalPersonPhone() {
        return legalPersonPhone;
    }

    public void setLegalPersonPhone(String legalPersonPhone) {
        this.legalPersonPhone = legalPersonPhone;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPhotoIds() {
        return photoIds;
    }

    public void setPhotoIds(String photoIds) {
        this.photoIds = photoIds;
    }

    public String getBusinessLicenseId() {
        return businessLicenseId;
    }

    public void setBusinessLicenseId(String businessLicenseId) {
        this.businessLicenseId = businessLicenseId;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
