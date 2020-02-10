package com.fedtech.pension.nurse.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgNurse implements Serializable {

    private static final Long serialVersionUID = 1L;


    private Integer id;

    private Integer serviceOrgId;

    private Date createTime;

    private String areaName;

    private String serviceOrgName;

    private String institutionTypeDictId;

    private String applyName;

    private String mobile;

    private Integer regTypeDictId;

    private String gradeDictId;

    private Integer type;

    private String institutionName;


    public ServiceOrgNurse() {
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public String getInstitutionTypeDictId() {
        return institutionTypeDictId;
    }

    public void setInstitutionTypeDictId(String institutionTypeDictId) {
        this.institutionTypeDictId = institutionTypeDictId;
    }

    public String getApplyName() {
        return applyName;
    }

    public void setApplyName(String applyName) {
        this.applyName = applyName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getRegTypeDictId() {
        return regTypeDictId;
    }

    public void setRegTypeDictId(Integer regTypeDictId) {
        this.regTypeDictId = regTypeDictId;
    }

    public String getGradeDictId() {
        return gradeDictId;
    }

    public void setGradeDictId(String gradeDictId) {
        this.gradeDictId = gradeDictId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }
}