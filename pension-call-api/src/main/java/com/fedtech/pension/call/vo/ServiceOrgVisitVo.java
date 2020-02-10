package com.fedtech.pension.call.vo;

import java.io.Serializable;

/**
 * Created by CoderQiang on 2017/2/9.
 */
public class ServiceOrgVisitVo implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    private String areaName;
    private String institutionName;
    private String linkMan;
    private String phone;
    private  Integer gradeDictId;
    private  Integer visitResult;
    private  Integer status;

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

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getGradeDictId() {
        return gradeDictId;
    }

    public void setGradeDictId(Integer gradeDictId) {
        this.gradeDictId = gradeDictId;
    }

    public Integer getVisitResult() {
        return visitResult;
    }

    public void setVisitResult(Integer visitResult) {
        this.visitResult = visitResult;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public ServiceOrgVisitVo() {
    }
}
