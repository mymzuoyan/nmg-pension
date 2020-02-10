package com.fedtech.pension.volunteer.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 服务人员表（旧）
 * @author gengqiang
 */
public class VolStoreOrDraw implements Serializable {
    private static final Long serialVersionUID = 1L;

    /**
     * 接收组织机构
     */
    private String organizationName;

    private Integer id;

    /**
     * 志愿者编号
     */
    private Integer volunteerId;

    /**
     * 服务对象
     */
    private String targetName;

    /**
     * 服务对象Id
     */
    private Integer targetId;

    /**
     * 0-存入 1-支取
     */
    private Integer type;

    /**
     * 创建者id
     */
    private Integer createUserId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 积分
     */
    private Integer score;

    /**
     * 服务时间
     */
    private Date serviceTime;

    /**
     * 服务人员名称
     */
    private String serviceName;

    /**
     * 服务人员Id
     */
    private Integer serviceId;

    /**
     * 服务内容
     */
    private String serviceInfo;

    private Date startTime;

    private Date endTime;

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(Integer volunteerId) {
        this.volunteerId = volunteerId;
    }

    public String getTargetName() {
        return targetName;
    }

    public void setTargetName(String targetName) {
        this.targetName = targetName == null ? null : targetName.trim();
    }


    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName == null ? null : serviceName.trim();
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceInfo() {
        return serviceInfo;
    }

    public void setServiceInfo(String serviceInfo) {
        this.serviceInfo = serviceInfo == null ? null : serviceInfo.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public VolStoreOrDraw() {
        super();
    }
}