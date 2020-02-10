package com.fedtech.pension.gold.entity;

import java.io.Serializable;

/**
 *  高领补贴发放标准表
 * @author csn
 * @date 2018/1/12
 */
public class GoldSendStandard implements Serializable{

    private Integer id;

    //金额标注
    private Double moneyStandard;

    //区域id
    private Integer areaId;

    //申请类别
    private Integer applyType;

    //区域名称
    private String areaName;

    //标准1,2,3,4
    private Double moneyStandard1;
    private Double moneyStandard2;
    private Double moneyStandard3;
    private Double moneyStandard4;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Double getMoneyStandard1() {
        return moneyStandard1;
    }

    public void setMoneyStandard1(Double moneyStandard1) {
        this.moneyStandard1 = moneyStandard1;
    }

    public Double getMoneyStandard2() {
        return moneyStandard2;
    }

    public void setMoneyStandard2(Double moneyStandard2) {
        this.moneyStandard2 = moneyStandard2;
    }

    public Double getMoneyStandard3() {
        return moneyStandard3;
    }

    public void setMoneyStandard3(Double moneyStandard3) {
        this.moneyStandard3 = moneyStandard3;
    }

    public Double getMoneyStandard4() {
        return moneyStandard4;
    }

    public void setMoneyStandard4(Double moneyStandard4) {
        this.moneyStandard4 = moneyStandard4;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getApplyType() {
        return applyType;
    }

    public void setApplyType(Integer applyType) {
        this.applyType = applyType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getMoneyStandard() {
        return moneyStandard;
    }

    public void setMoneyStandard(Double moneyStandard) {
        this.moneyStandard = moneyStandard;
    }
}
