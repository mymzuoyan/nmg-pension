package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * @author gengqiang
 */
public class ServiceOrgPrice implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;

    private Integer serviceOrgId;

    private Integer serviceProjectId;

    private String serviceProjectName;

    private Double price;

    private String serviceUnit;

    private String moreInfo;


    public ServiceOrgPrice() {
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

    public Integer getServiceProjectId() {
        return serviceProjectId;
    }

    public void setServiceProjectId(Integer serviceProjectId) {
        this.serviceProjectId = serviceProjectId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }


    public String getServiceProjectName() {
        return serviceProjectName;
    }

    public void setServiceProjectName(String serviceProjectName) {
        this.serviceProjectName = serviceProjectName;
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo;
    }

    public String getServiceUnit() {
        return serviceUnit;
    }

    public void setServiceUnit(String serviceUnit) {
        this.serviceUnit = serviceUnit;
    }
}