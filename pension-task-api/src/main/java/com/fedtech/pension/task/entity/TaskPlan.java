package com.fedtech.pension.task.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 计划工单信息表（服务人员上门为老人建设工单）
 * @author gengqiang
 */
public class TaskPlan implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 工单编号
     */
    private String number;

    /**
     * 标题
     */
    private String title;

    /**
     * 老人ID
     */
    private Integer elderId;

    /**
     * 身份证号
     */
    private String idCardNo;

    /**
     * 老人姓名
     */
    private String elderName;

    /**
     * 老人名称
     */
    private String userElderName;

    /**
     * 老人性别
     */
    private String elderSex;

    /**
     * 老人年龄
     */
    private String elderAge;

    /**
     * 老人号码
     */
    private String elderMobile;

    /**
     * 老人地址
     */
    private String elderAddress;

    /**
     * 服务机构名称
     */
    private String receiverServiceOrg;

    /**
     * 服务机构ID
     */
    private Integer serviceOrgId;

    /**
     * 服务人员名称
     */
    private String receiverName;

    /**
     * 服务人员id
     */
    private Integer receiverId;

    /**
     * 需求服务时间
     */
    private Date serviceTime;

    /**
     * 服务开始时间
     */
    private Date serviceStartTime;

    /**
     * 服务类型
     */
    private String serviceType;

    /**
     * 服务内容
     */
    private String serviceName;

    /**
     * 服务地点
     */
    private String serviceAddress;

    /**
     * 内容
     */
    private String content;

    /**
     * 发送人id
     */
    private Integer creatorId;

    /**
     * 发送人
     */
    private String creatorName;

    /**
     * 发送人电话
     */
    private String creatorPhone;

    /**
     * 来源
     */
    private String source;

    /**
     * 类型
     */
    private Integer type;

    /**
     * 纬度
     */
    private Double lat;

    /**
     * 经度
     */
    private Double lng;

    /**
     * 等级
     */
    private Integer level;

    /**
     * 服务评价
     */
    private String comment;

    /**
     * 服务结束时间
     */
    private Date updateTime;

    /**
     * 支付接口订单信息
     */
    private String orderInfo;

    /**
     * 工单定价
     */
    private String priceInfo;

    /**
     * 金额
     */
    private Double money;

    /**
     * 支付方式(0：现金，1：刷卡，2：支付宝 3：微信）
     */
    private Integer payType;

    /**
     * 支付時間
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
     * 二维码
     */
    private String qrCoder;

    /**
     * 距离
     */
    private Double distance;

    /**
     * 所属区域id
     */
    private Integer serviceAreaId;

    /**
     * 服务所属区域
     */
    private String serviceAreaName;

    /**
     * 工单完成地址
     */
    private String completeAddress;

    /**
     * '服务方式（上门 站点）
     */
    private String serviceMode;

    private Date startTime;

    private Date endTime;

    private Date createTime;

    /**
     * 时间类型
     */
    private String timeType;

    /**
     * 卡号
     */
    private String cardNum;

    /**
     * 操作用户
     */
    private String operateUser;

    /**
     * 设备编号
     */
    private String deviceNum;

    /**
     * 标题
     */
    private String fundType;

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

    @Override
    public String toString() {
        return "TaskPlan{" +
                "id=" + id +
                ", number='" + number + '\'' +
                ", title='" + title + '\'' +
                ", elderId=" + elderId +
                ", idCardNo='" + idCardNo + '\'' +
                ", elderName='" + elderName + '\'' +
                ", elderSex='" + elderSex + '\'' +
                ", elderAge='" + elderAge + '\'' +
                ", elderMobile='" + elderMobile + '\'' +
                ", elderAddress='" + elderAddress + '\'' +
                ", receiverServiceOrg='" + receiverServiceOrg + '\'' +
                ", serviceOrgId=" + serviceOrgId +
                ", receiverName='" + receiverName + '\'' +
                ", receiverId=" + receiverId +
                ", serviceTime=" + serviceTime +
                ", serviceStartTime=" + serviceStartTime +
                ", serviceType='" + serviceType + '\'' +
                ", serviceName='" + serviceName + '\'' +
                ", serviceAddress='" + serviceAddress + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", creatorId=" + creatorId +
                ", creatorName='" + creatorName + '\'' +
                ", creatorPhone='" + creatorPhone + '\'' +
                ", source='" + source + '\'' +
                ", type=" + type +
                ", lat=" + lat +
                ", lng=" + lng +
                ", level=" + level +
                ", comment='" + comment + '\'' +
                ", updateTime=" + updateTime +
                ", orderInfo='" + orderInfo + '\'' +
                ", priceInfo='" + priceInfo + '\'' +
                ", money=" + money +
                ", payType=" + payType +
                ", payTime=" + payTime +
                ", status=" + status +
                ", mapStatus=" + mapStatus +
                ", qrCoder='" + qrCoder + '\'' +
                ", distance=" + distance +
                ", serviceAreaId=" + serviceAreaId +
                ", serviceAreaName='" + serviceAreaName + '\'' +
                ", completeAddress='" + completeAddress + '\'' +
                ", serviceMode='" + serviceMode + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", timeType='" + timeType + '\'' +
                ", cardNum='" + cardNum + '\'' +
                ", operateUser='" + operateUser + '\'' +
                ", deviceNum='" + deviceNum + '\'' +
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

    public String getQrCoder() {
        return qrCoder;
    }

    public void setQrCoder(String qrCoder) {
        this.qrCoder = qrCoder;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public String getElderAddress() {
        return elderAddress;
    }

    public void setElderAddress(String elderAddress) {
        this.elderAddress = elderAddress;
    }

    public String getCompleteAddress() {
        return completeAddress;
    }

    public void setCompleteAddress(String completeAddress) {
        this.completeAddress = completeAddress;
    }

    public String getServiceMode() {
        return serviceMode;
    }

    public void setServiceMode(String serviceMode) {
        this.serviceMode = serviceMode;
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

    public String getTimeType() {
        return timeType;
    }

    public void setTimeType(String timeType) {
        this.timeType = timeType;
    }

    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    public Integer getServiceAreaId() {
        return serviceAreaId;
    }

    public void setServiceAreaId(Integer serviceAreaId) {
        this.serviceAreaId = serviceAreaId;
    }

    public String getServiceAreaName() {
        return serviceAreaName;
    }

    public void setServiceAreaName(String serviceAreaName) {
        this.serviceAreaName = serviceAreaName;
    }

    public Date getServiceStartTime() {
        return serviceStartTime;
    }

    public void setServiceStartTime(Date serviceStartTime) {
        this.serviceStartTime = serviceStartTime;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public String getCardNum() {
        return cardNum;
    }

    public void setCardNum(String cardNum) {
        this.cardNum = cardNum;
    }

    public String getOperateUser() {
        return operateUser;
    }

    public void setOperateUser(String operateUser) {
        this.operateUser = operateUser;
    }

    public String getDeviceNum() {
        return deviceNum;
    }

    public void setDeviceNum(String deviceNum) {
        this.deviceNum = deviceNum;
    }

    public String getFundType() {
        return fundType;
    }

    public void setFundType(String fundType) {
        this.fundType = fundType;
    }

    public String getUserElderName() {
        return userElderName;
    }

    public void setUserElderName(String userElderName) {
        this.userElderName = userElderName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}