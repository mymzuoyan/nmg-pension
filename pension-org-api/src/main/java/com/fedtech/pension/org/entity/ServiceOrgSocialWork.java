package com.fedtech.pension.org.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 登记社会服务信息
 * @author guxiangyang
 * @date 2019/6/27
 */
public class ServiceOrgSocialWork implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;
    /**
     * 组织名称
     */
    private String organizationName;
  /**
     *  服务项目
     */
    private String serviceItem;

    /**
     *  负责人
     */
    private String principal;

    /**
     * 服务开始时间
     */

    private String serviceStartTime;

    /**
     * 服务结束时间
     */

    private String serviceEndTime;

    /**
     * 服务日记
     */
    private String serviceDiary;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getServiceItem() {
        return serviceItem;
    }

    public void setServiceItem(String serviceItem) {
        this.serviceItem = serviceItem;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getServiceStartTime() {
        return serviceStartTime;
    }

    public void setServiceStartTime(String serviceStartTime) {
        this.serviceStartTime = serviceStartTime;
    }

    public String getServiceEndTime() {
        return serviceEndTime;
    }

    public void setServiceEndTime(String serviceEndTime) {
        this.serviceEndTime = serviceEndTime;
    }

    public String getServiceDiary() {
        return serviceDiary;
    }

    public void setServiceDiary(String serviceDiary) {
        this.serviceDiary = serviceDiary;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }
}