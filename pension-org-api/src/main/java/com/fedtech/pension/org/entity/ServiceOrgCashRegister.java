package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgCashRegister implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;

    private String areaName;

    private Integer serviceOrgId;

    private String serviceOrgName;

    private Double cash;

    private Integer casherId;

    private Date cashTime;

    private Integer type;

    public ServiceOrgCashRegister() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public Double getCash() {
        return cash;
    }

    public void setCash(Double cash) {
        this.cash = cash;
    }

    public Integer getCasherId() {
        return casherId;
    }

    public void setCasherId(Integer casherId) {
        this.casherId = casherId;
    }

    public Date getCashTime() {
        return cashTime;
    }

    public void setCashTime(Date cashTime) {
        this.cashTime = cashTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}