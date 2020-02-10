package com.fedtech.pension.elderly.vo;

import java.io.Serializable;

/**
 * @author 就业统计VO
 * @date 2019/4/17
 */
public class EmployStatisticsVo implements Serializable {

    //关联补贴表主键id
    private Integer subsidyId;
    //区域id
    private Integer areaId;
    //序列号
    private Integer serialNumber;
    //区域名称
    private String areaName;
    //人数分区总量
    private Integer peopleCount;
    //人数合计总量
    private Integer peopleAllCount;
    //金额分区总量
    private Double moneyCount;
    //金额合计总量
    private Double moneyAllCount;

    public Integer getSubsidyId() {
        return subsidyId;
    }

    public void setSubsidyId(Integer subsidyId) {
        this.subsidyId = subsidyId;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

    public Double getMoneyCount() {
        return moneyCount;
    }

    public void setMoneyCount(Double moneyCount) {
        this.moneyCount = moneyCount;
    }

    public Integer getPeopleAllCount() {
        return peopleAllCount;
    }

    public void setPeopleAllCount(Integer peopleAllCount) {
        this.peopleAllCount = peopleAllCount;
    }

    public Double getMoneyAllCount() {
        return moneyAllCount;
    }

    public void setMoneyAllCount(Double moneyAllCount) {
        this.moneyAllCount = moneyAllCount;
    }
}