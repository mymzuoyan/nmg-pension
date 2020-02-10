package com.fedtech.pension.power.entity;

import java.io.Serializable;
import java.util.List;

public class OldManCard implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;//id
    private String  cardId;//卡号
//    private String  area;//地区

    private String serviceOrgId;//组织机构id
    private String serviceOrgName;//组织机构名称
    private Integer type;//组织类型 1、社区中心 2、养老机构 3、服务中心
    private String  idNumber;//身份证号
    private Integer oldManId;//老人id
    private String  oldManName;//老人姓名
    private Integer status;//状态   0 启用   1 注销
    private String  createDate;//绑卡时间
    private String  removeDate;//退卡时间
    private Double  money;//余额
    private String  startCreateDate;//绑卡时间 查询用
    private String  endCreateDate;//绑卡时间 查询用
    private String  startRemoveDate;//退卡时间 查询用
    private String  endRemoveDate;//退卡时间 查询用
    private Integer areaId;//组织所属区域
    private String elderTypeDictIds;//老人类型
    private String areaName;//组织所属区域
    private List<Integer> elderTypeList;//老人类型
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

//    public String getArea() {
//        return area;
//    }
//
//    public void setArea(String area) {
//        this.area = area;
//    }


    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getRemoveDate() {
        return removeDate;
    }

    public void setRemoveDate(String removeDate) {
        this.removeDate = removeDate;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
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

    @Override
    public String toString() {
        return "OldManCard{" +
                "id=" + id +
                ", cardId='" + cardId + '\'' +
                ", serviceOrgId='" + serviceOrgId + '\'' +
                ", serviceOrgName='" + serviceOrgName + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", oldManId=" + oldManId +
                ", oldManName='" + oldManName + '\'' +
                ", status=" + status +
                ", createDate='" + createDate + '\'' +
                ", removeDate='" + removeDate + '\'' +
                ", money=" + money +
                ", startCreateDate='" + startCreateDate + '\'' +
                ", endCreateDate='" + endCreateDate + '\'' +
                ", startRemoveDate='" + startRemoveDate + '\'' +
                ", endRemoveDate='" + endRemoveDate + '\'' +
                ", areaId='" + areaId + '\'' +
                ", elderTypeDictIds='" + elderTypeDictIds + '\'' +
                ", areaName='" + areaName + '\'' +
                '}';
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

    public String getStartRemoveDate() {
        return startRemoveDate;
    }

    public void setStartRemoveDate(String startRemoveDate) {
        this.startRemoveDate = startRemoveDate;
    }

    public String getEndRemoveDate() {
        return endRemoveDate;
    }

    public void setEndRemoveDate(String endRemoveDate) {
        this.endRemoveDate = endRemoveDate;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public Integer getOldManId() {
        return oldManId;
    }

    public void setOldManId(Integer oldManId) {
        this.oldManId = oldManId;
    }

    public String getOldManName() {
        return oldManName;
    }

    public void setOldManName(String oldManName) {
        this.oldManName = oldManName;
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
