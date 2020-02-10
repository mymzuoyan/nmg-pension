package com.fedtech.pension.power.entity;

import java.io.Serializable;
import java.util.List;

public class MoneyFlow implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;//资金流水ID

    private Integer oldmanId; //老人ID

    private String cardId;  //卡号

    private String serverNum; //服务流水号

    private Double amount; //发生金额

//    private String area; //充值机构
//    private Integer serviceOrgId; //充值机构

    private String serviceOrgId;

    private String serviceOrgName; //充值机构

    private String uptime; //发生时间

    private String elderName;//姓名

    private String  startCreateDate;//CZ时间 查询用

    private String  endCreateDate;//CZ时间 查询用

    private String  idNumber;//身份证号

    private Integer areaId;//组织所属区域
    private String elderTypeDictIds;//老人类型
    private String areaName;//组织所属区域
    private List<Integer> elderTypeList;//老人类型


    public MoneyFlow(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOldmanId() {
        return oldmanId;
    }

    public void setOldmanId(Integer oldmanId) {
        this.oldmanId = oldmanId;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getServerNum() {
        return serverNum;
    }

    public void setServerNum(String serverNum) {
        this.serverNum = serverNum;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
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

    public String getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(String serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getElderTypeDictIds() {
        return elderTypeDictIds;
    }

    public void setElderTypeDictIds(String elderTypeDictIds) {
        this.elderTypeDictIds = elderTypeDictIds;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public List<Integer> getElderTypeList() {
        return elderTypeList;
    }

    public void setElderTypeList(List<Integer> elderTypeList) {
        this.elderTypeList = elderTypeList;
    }
}
