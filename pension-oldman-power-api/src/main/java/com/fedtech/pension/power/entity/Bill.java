package com.fedtech.pension.power.entity;

import java.io.Serializable;
import java.util.List;

/**
 * @author gengqiang
 */
public class Bill implements Serializable {
    private Integer id; //主键id
    private String flowNumber;//流水号
    private String cardNumber;//卡号
    private Integer oldManCardId; //卡号id
    private String orgName;//组织名称
    private String orgId;//组织id
    private String elderlyName;//老人名称
    private Integer elderlyId;//老人id
    private Double price;//消费金额
    private Double selfExpenditure;//自费金额
    private Double currentBalance;//消费前余额
    private Double ultimateBalance;//结算后余额
    private Integer count;//项目数量
    private Integer status;//订单状态
    private String dissipate;//消费时间
    private String startTime;//开始时间
    private String endTime;//结束时间
    private String serviceTime;//服务时长
    private Integer areaId;//组织所属区域
    private String areaName;//组织所属区域
    private String elderTypeDictIds;//老人类型
    private String projectTypeDictIds;//服务类型
    private List<Integer> elderTypeList;//老人类型
    private String remark;//第三方消费内容
    private String idcardno;//other
    private String itemName;

    @Override
    public String toString() {
        return "Bill{" +
                "id=" + id +
                ", flowNumber='" + flowNumber + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", oldManCardId=" + oldManCardId +
                ", orgName='" + orgName + '\'' +
                ", orgId=" + orgId +
                ", elderlyName='" + elderlyName + '\'' +
                ", elderlyId=" + elderlyId +
                ", price=" + price +
                ", currentBalance=" + currentBalance +
                ", ultimateBalance=" + ultimateBalance +
                ", count=" + count +
                ", status=" + status +
                ", dissipate='" + dissipate + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", areaId=" + areaId +
                ", areaName='" + areaName + '\'' +
                ", idcardno='" + idcardno + '\'' +
                ", elderTypeDictIds='" + elderTypeDictIds + '\'' +
                ", projectTypeDictIds='" + projectTypeDictIds + '\'' +
                '}';
    }

    public Double getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(Double currentBalance) {
        this.currentBalance = currentBalance;
    }

    public Double getUltimateBalance() {
        return ultimateBalance;
    }

    public void setUltimateBalance(Double ultimateBalance) {
        this.ultimateBalance = ultimateBalance;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getElderlyId() {
        return elderlyId;
    }

    public void setElderlyId(Integer elderlyId) {
        this.elderlyId = elderlyId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFlowNumber() {
        return flowNumber;
    }

    public void setFlowNumber(String flowNumber) {
        this.flowNumber = flowNumber;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Integer getOldManCardId() {
        return oldManCardId;
    }

    public void setOldManCardId(Integer oldManCardId) {
        this.oldManCardId = oldManCardId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getElderlyName() {
        return elderlyName;
    }

    public void setElderlyName(String elderlyName) {
        this.elderlyName = elderlyName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }


    public Double getSelfExpenditure() {
        return selfExpenditure;
    }

    public void setSelfExpenditure(Double selfExpenditure) {
        this.selfExpenditure = selfExpenditure;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getDissipate() {
        return dissipate;
    }

    public void setDissipate(String dissipate) {
        this.dissipate = dissipate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getElderTypeDictIds() {
        return elderTypeDictIds;
    }

    public void setElderTypeDictIds(String elderTypeDictIds) {
        this.elderTypeDictIds = elderTypeDictIds;
    }

    public String getProjectTypeDictIds() {
        return projectTypeDictIds;
    }

    public void setProjectTypeDictIds(String projectTypeDictIds) {
        this.projectTypeDictIds = projectTypeDictIds;
    }

    public List<Integer> getElderTypeList() {
        return elderTypeList;
    }

    public void setElderTypeList(List<Integer> elderTypeList) {
        this.elderTypeList = elderTypeList;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
}
