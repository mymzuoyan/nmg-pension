package com.fedtech.pension.call.entity;

import java.io.Serializable;

/**
 * 坐席信息表
 * @author gengqiang
 */
public class Monitor implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 坐席组Id
     */
    private Integer groupId;

    /**
     * 坐席组名称
     */
    private String groupName;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 账户
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 姓名
     */
    private String name;

    /**
     * 电话
     */
    private String phone;

    /**
     * 地区名称
     */
    private String areaName;

    /**
     * 1:是组长
     * 默认是0
     */
    private Boolean isLeader;

    /**
     * 队列名称
     */
    private String queueName;

    /**
     * 分机号
     */
    private String extension;

    /**
     * 队列id
     */
    private Integer queueId;

    /**
     *
     */
    private String pstnnumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Boolean getIsLeader() {
        return isLeader;
    }

    public void setIsLeader(Boolean leader) {
        isLeader = leader;
    }

    public String getQueueName() {
        return queueName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public Boolean getLeader() {
        return isLeader;
    }

    public void setLeader(Boolean leader) {
        isLeader = leader;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getQueueId() {
        return queueId;
    }

    public void setQueueId(Integer queueId) {
        this.queueId = queueId;
    }

    public String getPstnnumber() {
        return pstnnumber;
    }

    public void setPstnnumber(String pstnnumber) {
        this.pstnnumber = pstnnumber;
    }

    public Monitor() {
    }
}