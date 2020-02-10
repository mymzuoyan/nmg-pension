package com.fedtech.pension.task.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 工单信息表
 * @author gengqiang
 */
public class Task implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 工单号
     */
    private String number;


    /**
     * 标题
     */
    private String title;


    /**
     * 老人id
     */
    private Integer elderId;


    /**
     * 老人姓名
     */
    private String elderName;


    /**
     * 老人性别
     */
    private String elderSex;


    /**
     * 老人年龄
     */
    private String elderAge;


    /**
     * 老人电话
     */
    private String elderMobile;

    /**
     * 接受组织id
     */
    private String serviceOrgId;

    /**
     * 接受组织名称
     */
    private String receiverServiceOrg;

    /**
     * 服务人员
     */
    private String receiverName;

    /**
     * 服务人员id
     */
    private String receiverId;

    /**
     * 服务时间
     */
    private Date serviceTime;


    /**
     * 服务类型
     */
    private String serviceType;


    /**
     * 服务姓名
     */
    private String serviceName;


    /**
     * 服务地址
     */
    private String serviceAddress;


    /**
     * 内容
     */
    private String content;

    private Date createTime;

    /**
     * 发送人
     */
    private Integer creatorId;


    /**
     * 发送人姓名
     */
    private String creatorName;


    /**
     * 发送人号码
     */
    private String creatorPhone;


    /**
     * 来源
     */
    private String source;


    /**
     * 类型：0：下发工单 1：需求
     */
    private Integer type;


    /**
     * 发出需求的地理信息 经度
     */
    private Double lat;


    /**
     * 发出需求的地理信息 纬度
     */
    private Double lng;


    /**
     * 等级
     */
    private Integer level;


    /**
     * 评价
     */
    private String comment;


    private Date updateTime;


    /**
     * 支付接口订单信息
     */
    private String orderInfo;


    /**
     * 工单定价
     */
    private String priceInfo;


    //金额
    private Double money;


    /**
     * 支付方式(0：现金，1：刷卡，2：支付宝 3：微信）
     */
    private Integer payType;


    /**
     * 支付时间
     */
    private Date payTime;


    /**
     * 状态:  0：删除 1：待响应 2:已响应 3：已完成'
     */
    private Integer status;


    /**
     * 地图状态
     */
    private Integer mapStatus;

    /**
     * 身份证
     */
    private String idcardno;

    /**
     * 区域名称
     */
    private String areaName;

    private int count;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(String serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                "number=" + number +
                ", title='" + title + '\'' +
                ", elderName='" + elderName + '\'' +
                ", elderAge='" + elderAge + '\'' +
                ", elderMobile='" + elderMobile + '\'' +
                ", receiverName='" + receiverName + '\'' +
                ", serviceTime=" + serviceTime +
                ", serviceType='" + serviceType + '\'' +
                ", serviceName='" + serviceName + '\'' +
                ", serviceAddress='" + serviceAddress + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", creatorId=" + creatorId +
                ", creatorName='" + creatorName + '\'' +
                ", source='" + source + '\'' +
                ", type=" + type +
                ", lat=" + lat +
                ", lng=" + lng +
                ", updateTime=" + updateTime +
                ", status=" + status +
                '}';
    }

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getElderName() {
        return elderName;
    }

    public String getElderSex() {
        return elderSex;
    }

    public void setElderSex(String elderSex) {
        this.elderSex = elderSex;
    }

    public String getElderMobile() {
        return elderMobile;
    }

    public void setElderMobile(String elderMobile) {
        this.elderMobile = elderMobile;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getElderAge() {
        return elderAge;
    }

    public void setElderAge(String elderAge) {
        this.elderAge = elderAge;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public String getReceiverServiceOrg() {
        return receiverServiceOrg;
    }

    public void setReceiverServiceOrg(String receiverServiceOrg) {
        this.receiverServiceOrg = receiverServiceOrg;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public Date getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
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

    public String getServiceAddress() {
        return serviceAddress;
    }

    public void setServiceAddress(String serviceAddress) {
        this.serviceAddress = serviceAddress;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getCreatorPhone() {
        return creatorPhone;
    }

    public void setCreatorPhone(String creatorPhone) {
        this.creatorPhone = creatorPhone;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPriceInfo() {
        return priceInfo;
    }

    public void setPriceInfo(String priceInfo) {
        this.priceInfo = priceInfo;
    }

    public String getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(String orderInfo) {
        this.orderInfo = orderInfo;
    }


    public Integer getMapStatus() {
        return mapStatus;
    }

    public void setMapStatus(Integer mapStatus) {
        this.mapStatus = mapStatus;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}