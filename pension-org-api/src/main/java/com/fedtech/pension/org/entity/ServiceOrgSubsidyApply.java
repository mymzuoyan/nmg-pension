package com.fedtech.pension.org.entity;

import com.fedtech.pension.sys.entity.User;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgSubsidyApply implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private ServiceOrg serviceOrg;

    private Integer subsidyType;

    private Integer subsidyObject;

    private String attach;

    private Integer status;

    private String money;

    private User creator;

    private Date createTime;

    private User verifyer;

    private Date verifyTime;

    private String node;

    private Date startDate;

    private Date endDate;

    /**区域名称*/
    private String areaName;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ServiceOrg getServiceOrg() {
        return serviceOrg;
    }

    public void setServiceOrg(ServiceOrg serviceOrg) {
        this.serviceOrg = serviceOrg;
    }

    public Integer getSubsidyType() {
        return subsidyType;
    }

    public void setSubsidyType(Integer subsidyType) {
        this.subsidyType = subsidyType;
    }

    public Integer getSubsidyObject() {
        return subsidyObject;
    }

    public void setSubsidyObject(Integer subsidyObject) {
        this.subsidyObject = subsidyObject;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public User getVerifyer() {
        return verifyer;
    }

    public void setVerifyer(User verifyer) {
        this.verifyer = verifyer;
    }

    public Date getVerifyTime() {
        return verifyTime;
    }

    public void setVerifyTime(Date verifyTime) {
        this.verifyTime = verifyTime;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
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