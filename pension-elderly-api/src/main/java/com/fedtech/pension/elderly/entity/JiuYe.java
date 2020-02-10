package com.fedtech.pension.elderly.entity;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class JiuYe implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;
    private String name;
    private String areaName;
    private String serviceOrgName;
    private String cardNo;
    private String mobile;
    private String buTieMoney;
    private String overTime;
    private String remarks;
    private List<Integer> elderTypeList;
    private List<Integer> serviceNeedList;


    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getBuTieMoney() {
        return buTieMoney;
    }

    public void setBuTieMoney(String buTieMoney) {
        this.buTieMoney = buTieMoney;
    }

    public String getOverTime() {
        return overTime;
    }

    public void setOverTime(String overTime) {
        this.overTime = overTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public List<Integer> getElderTypeList() {
        return elderTypeList;
    }

    public void setElderTypeList(List<Integer> elderTypeList) {
        this.elderTypeList = elderTypeList;
    }

    public List<Integer> getServiceNeedList() {
        return serviceNeedList;
    }

    public void setServiceNeedList(List<Integer> serviceNeedList) {
        this.serviceNeedList = serviceNeedList;
    }
}
