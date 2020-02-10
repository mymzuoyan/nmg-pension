package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ElderlyPreferentialTreatment implements Serializable {

    private static final Long serialVersionUID = 1L;
    
    private Integer id;

    private String number;

    private Integer areaId;
    /**
     * 区划名称
     */
    private String areaName;

    private String name;
    /**
     *  头像
     */
    private String avatar;
    /**
     * 民族
     */
    private String nation;
    /**
     * 性别
     */
    private String sex;
    /**
     * 生日日期
     */
    private String birthday;
    /**
     * 地址
     */
    private String address;
    /**
     * 身份证号码
     */
    private String idcardno;
    /**
     * 组织
     */
    private String organization;
    /**
     * 有效期
     */
    private String valid;

    private Integer creatorId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 0:申请中1:申请通过 2:申请不通过
     */
    private Integer status;

    private Integer updateId;
    /**
     * 更新时间
     */
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUpdateId() {
        return updateId;
    }

    public void setUpdateId(Integer updateId) {
        this.updateId = updateId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}