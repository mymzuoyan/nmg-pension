package com.fedtech.pension.org.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
/**
 * 登记社会捐赠信息
 * @author guxiangyang
 * @date 2019/6/27
 */
public class ServiceOrgSocialDonation implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;

    /**
     *  捐赠人照片
     */
    private String donorPic;

    /**
     * 组织名称
     */
    private String organizationName;

    /**
     * 活动负责人
     */
    private String activityLeader;

    /**
     * 活动时间
     */

    private String beginTime;

    /**
     * 结束时间
     */

    private String endTime;

    /**
     *  捐赠金额（或物品折合价值）
     */
    private Double money;

    /**
     * 捐款对象
     */
    private String remarks;

    /**
     * 捐赠人
     */
    private String donorName;

    /**
     *  地址
     */
    private String address;

    /**
     * 城市
     */
    private String city;

    /**
     * 省/自治区
     */
    private String provinceBurg;

    /**
     * 捐赠人联系方式
     */
    private String phone;

    /**
     * 捐赠类型（资金、物品）
     */
    private String donorType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDonorPic() {
        return donorPic;
    }

    public void setDonorPic(String donorPic) {
        this.donorPic = donorPic;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public String getActivityLeader() {
        return activityLeader;
    }

    public void setActivityLeader(String activityLeader) {
        this.activityLeader = activityLeader;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDonorName() {
        return donorName;
    }

    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvinceBurg() {
        return provinceBurg;
    }

    public void setProvinceBurg(String provinceBurg) {
        this.provinceBurg = provinceBurg;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getDonorType() {
        return donorType;
    }

    public void setDonorType(String donorType) {
        this.donorType = donorType;
    }
}