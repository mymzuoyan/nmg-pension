package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgBalance implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;

    private Integer serviceOrgId;

    private Double alipayBalance;

    private Double wxpayBalance;

    private Double alipayFreeze;

    private Double wxpayFreeze;

    private Date createTime;

    private Date updateTime;

    public ServiceOrgBalance() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public Double getAlipayBalance() {
        return alipayBalance;
    }

    public void setAlipayBalance(Double alipayBalance) {
        this.alipayBalance = alipayBalance;
    }

    public Double getWxpayBalance() {
        return wxpayBalance;
    }

    public void setWxpayBalance(Double wxpayBalance) {
        this.wxpayBalance = wxpayBalance;
    }

    public Double getAlipayFreeze() {
        return alipayFreeze;
    }

    public void setAlipayFreeze(Double alipayFreeze) {
        this.alipayFreeze = alipayFreeze;
    }

    public Double getWxpayFreeze() {
        return wxpayFreeze;
    }

    public void setWxpayFreeze(Double wxpayFreeze) {
        this.wxpayFreeze = wxpayFreeze;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}