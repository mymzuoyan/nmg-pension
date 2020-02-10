package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 *  旅居老人需求发放
 * @author miaoyueming
 * @date 2019/9/27
 */

public class ServiceOrgElderlyNeedsDistribution implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**
     * 序号
     */
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 需求内容
     */
    private String context;

    /**
     * 发布人
     */
    private String publisher;

    /**
     * 发布时间
     */
    private String releaseTime;

    /**
     * 审核状态(0.未审核 1.审核通过 2.审核不通过)
     */
    private String status;

    /**
     * 组织名称
     */

    private String serviceOrgName;

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
