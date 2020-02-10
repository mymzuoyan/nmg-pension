package com.fedtech.pension.task.entity;

import java.util.Date;

public class TaskReceivePlan {

    private Integer id;

    /**
     * 工单id
     */
    private Integer taskId;

    /**
     * 工单号
     */
    private String taskNumber;

    /**
     * 工单标题
     */
    private String taskTitle;

    /**
     * 工单类型
     */
    private Integer taskType;

    /**
     * 老人姓名
     */
    private String elderName;

    /**
     * 发送id
     */
    private Integer sendId;

    /**
     * 发送姓名
     */
    private String sendName;

    /**
     * 发送时间
     */
    private Date sendTime;

    /**
     * 发送电话
     */
    private String sendPhone;

    /**
     * 服务人员id
     */
    private Integer receiverId;

    /**
     * 服务人员姓名
     */
    private String receiverName;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private Integer creatorId;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 完成时间
     */
    private Date completeTime;

    /**
     * 状态 0：未处理 1:正在处理 2：已完成
     */
    private Integer status;

    /**
     * 服务地址
     */
    private String serviceAddress;

    /**
     * 服务类型
     */
    private String serviceType;

    /**
     * 服务项目
     */
    private String serviceName;

    /**
     * 服务时间
     */
    private Date serviceTime;

    /**
     * 内容
     */
    private String content;

    /**
     * 评论
     */
    private String comment;

    /**
     * 等级
     */
    private Integer level;

    /**
     * 登记 1-已登记 0-未登记
     */
    private Integer register;

    /**
     * 经度
     */
    private Double lng;

    /**
     * 纬度
     */
    private Double lat;

    /**
     * 老人手机
     */
    private String elderMobile;

    /**
     * 工单量
     */
    private Integer taskCount;

    /**
     * 提醒
     */
    private Integer remind;

    /**
     * 工单定价
     */
    private String priceInfo;

    /**
     * 支付金额
     */
    private Double money;

    /**
     * 支付类型
     */
    private Integer payType;

    /**
     * 支付时间
     */
    private Date payTime;

    public TaskReceivePlan() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getTaskType() {
        return taskType;
    }

    public void setTaskType(Integer taskType) {
        this.taskType = taskType;
    }

    public String getTaskNumber() {
        return taskNumber;
    }

    public void setTaskNumber(String taskNumber) {
        this.taskNumber = taskNumber;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public Integer getSendId() {
        return sendId;
    }

    public void setSendId(Integer sendId) {
        this.sendId = sendId;
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getServiceAddress() {
        return serviceAddress;
    }

    public void setServiceAddress(String serviceAddress) {
        this.serviceAddress = serviceAddress;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Date getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getRegister() {
        return register;
    }

    public void setRegister(Integer register) {
        this.register = register;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Integer getTaskCount() {
        return taskCount;
    }

    public void setTaskCount(Integer taskCount) {
        this.taskCount = taskCount;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getSendPhone() {
        return sendPhone;
    }

    public void setSendPhone(String sendPhone) {
        this.sendPhone = sendPhone;
    }

    public Integer getRemind() {
        return remind;
    }

    public void setRemind(Integer remind) {
        this.remind = remind;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getElderMobile() {
        return elderMobile;
    }

    public void setElderMobile(String elderMobile) {
        this.elderMobile = elderMobile;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public String getPriceInfo() {
        return priceInfo;
    }

    public void setPriceInfo(String priceInfo) {
        this.priceInfo = priceInfo;
    }
}