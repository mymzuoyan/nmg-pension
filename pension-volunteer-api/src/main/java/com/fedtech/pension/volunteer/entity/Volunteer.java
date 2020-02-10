package com.fedtech.pension.volunteer.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 志愿者信息（旧）
 * @author gengqiang
 */
public class Volunteer implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 所属区域
     */
    private String areaId;

    /**
     * 所属区域名称
     */
    private String areaName;

    /**
     * 志愿者姓名
     */
    private String volunteerName;

    /**
     * 老人id
     */
    private Integer elderId;

    /**
     * 创建组织id
     */
    private Integer createOrgId;

    /**
     * 创建者id
     */
    private Integer createUserId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 性别 1-男 2-女 0-未知
     */
    private Integer sexDictId;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 生日
     */
    private String birthday;

    /**
     * 身份证
     */
    private String idcardno;

    /**
     * 联系电话
     */
    private String homeTel;

    /**
     * 手机
     */
    private String mobile;

    /**
     * QQ
     */
    private String qq;

    /**
     * 户籍所在地
     */
    private String registrationPlace;

    /**
     * 实际居住地
     */
    private String realLiveAddress;

    /**
     * 积分
     */
    private Integer score;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getVolunteerName() {
        return volunteerName;
    }

    public void setVolunteerName(String volunteerName) {
        this.volunteerName = volunteerName == null ? null : volunteerName.trim();
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public Integer getCreateOrgId() {
        return createOrgId;
    }

    public void setCreateOrgId(Integer createOrgId) {
        this.createOrgId = createOrgId;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getSexDictId() {
        return sexDictId;
    }

    public void setSexDictId(Integer sexDictId) {
        this.sexDictId = sexDictId;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno == null ? null : idcardno.trim();
    }

    public String getHomeTel() {
        return homeTel;
    }

    public void setHomeTel(String homeTel) {
        this.homeTel = homeTel == null ? null : homeTel.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getRegistrationPlace() {
        return registrationPlace;
    }

    public void setRegistrationPlace(String registrationPlace) {
        this.registrationPlace = registrationPlace == null ? null : registrationPlace.trim();
    }

    public String getRealLiveAddress() {
        return realLiveAddress;
    }

    public void setRealLiveAddress(String realLiveAddress) {
        this.realLiveAddress = realLiveAddress == null ? null : realLiveAddress.trim();
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Volunteer() {
        super();
    }
}