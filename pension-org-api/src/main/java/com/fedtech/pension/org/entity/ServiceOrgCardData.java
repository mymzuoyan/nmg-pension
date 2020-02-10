package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgCardData implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 流水号
     */
    private String accBookNo;

    /**
     * 卡号
     */
    private String cardNo;

    /**
     * 消费项目
     */
    private String consumeId;

    /**
     * 实际金额
     */
    private Double purchaseAmount;

    /**
     * 付款金额
     */
    private Double payinAmount;

    /**
     * 优惠金额
     */
    private Double discountFee;

    /**
     * 消费时间
     */
    private Date writeDate;


    /**
     * 客户的你
     */
    private String personLevel;

    /**
     * 商户id
     */
    private String bizId;

    /**
     * 商户名称
     */
    private String bizName;

    /**
     * 商户联系人
     */
    private String contact;

    /**
     * 商户联系电话
     */
    private String telNo;

    /**
     * 客户身份证号
     */
    private String certNo;


    /**
     * 客户姓名
     */
    private String personName;

    /**
     * 组织id
     */
    private Integer serviceOrgId;

    /**
     * 老人id
     */
    private Integer elderlyMsgId;

    /**
     * 开始时间
     */
    private Date startDate;
    /**
     * 结束时间
     */
    private Date endDate;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccBookNo() {
        return accBookNo;
    }

    public void setAccBookNo(String accBookNo) {
        this.accBookNo = accBookNo;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getConsumeId() {
        return consumeId;
    }

    public void setConsumeId(String consumeId) {
        this.consumeId = consumeId;
    }

    public Double getPurchaseAmount() {
        return purchaseAmount;
    }

    public void setPurchaseAmount(Double purchaseAmount) {
        this.purchaseAmount = purchaseAmount;
    }

    public Double getPayinAmount() {
        return payinAmount;
    }

    public void setPayinAmount(Double payinAmount) {
        this.payinAmount = payinAmount;
    }

    public Double getDiscountFee() {
        return discountFee;
    }

    public void setDiscountFee(Double discountFee) {
        this.discountFee = discountFee;
    }

    public Date getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(Date writeDate) {
        this.writeDate = writeDate;
    }

    public String getPersonLevel() {
        return personLevel;
    }

    public void setPersonLevel(String personLevel) {
        this.personLevel = personLevel;
    }

    public String getBizId() {
        return bizId;
    }

    public void setBizId(String bizId) {
        this.bizId = bizId;
    }

    public String getBizName() {
        return bizName;
    }

    public void setBizName(String bizName) {
        this.bizName = bizName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getCertNo() {
        return certNo;
    }

    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Integer getElderlyMsgId() {
        return elderlyMsgId;
    }

    public void setElderlyMsgId(Integer elderlyMsgId) {
        this.elderlyMsgId = elderlyMsgId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}