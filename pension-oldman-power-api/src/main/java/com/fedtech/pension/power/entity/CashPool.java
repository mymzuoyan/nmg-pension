package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class CashPool implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;//id
    private String serviceOrgId;
    private String serviceOrgName;
    private String areaName;;//地区
    private String  createDate;//创建时间
    private Integer  createUserId;//创建人
    private Double  money;//充值金额

    //映射字段
    private String startCreateDate;
    private String endCreateDate;
    private Double startmoney;
    private Double endmoney;
    private String createUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(String serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getStartCreateDate() {
        return startCreateDate;
    }

    public void setStartCreateDate(String startCreateDate) {
        this.startCreateDate = startCreateDate;
    }

    public String getEndCreateDate() {
        return endCreateDate;
    }

    public void setEndCreateDate(String endCreateDate) {
        this.endCreateDate = endCreateDate;
    }

    public Double getStartmoney() {
        return startmoney;
    }

    public void setStartmoney(Double startmoney) {
        this.startmoney = startmoney;
    }

    public Double getEndmoney() {
        return endmoney;
    }

    public void setEndmoney(Double endmoney) {
        this.endmoney = endmoney;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
}
