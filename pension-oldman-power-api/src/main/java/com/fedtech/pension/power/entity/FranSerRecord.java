package com.fedtech.pension.power.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class FranSerRecord implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id; //自增id

    private String number; //工单号

    private String title; //标题

    private Integer elderId;//老人id

    private String elderName; //老人姓名

    private String elderSex;//老人性別

    private String elderAge;//老人年齡

    private String elderMobile;//老人手機

    private String receiverServiceOrg;//接受组织名称

    private String receiverName;//接受人

    private Date serviceTime;//服务时间

    private String serviceType;//服务类型

    private String serviceName;//服务项目

    private String serviceAddress;//服务地址

    private String content;//备注

    private Date createTime;//创建时间

    private Integer creatorId;//发送人

    private String creatorName;//发送人

    private String creatorPhone;//发送人手機號

    private String source;//来源

    private Integer type;//类型：0：下发工单 1：需求

    private Double lat;//发出需求的地理信息 纬度

    private Double lng;//发出需求的地理信息 经度

    private Integer level;//等级

    private String comment;//评价

    private Date updateTime;//更新时间

    private String orderInfo;//支付接口订单信息

    private String priceInfo;//工单定价

    private Double money;//金额

    private Integer payType;//支付方式(0：现金，1：刷卡，2：支付宝 3：微信）

    private Date payTime;//支付時間

    private Integer status; //状态

    private Integer mapStatus;

    private String idcardno;
    //计数
    private Integer count;
    private Integer time;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public FranSerRecord() {
        super();
    }

    @Override
    public String toString() {
        return "FranSerRecord{" +
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
}