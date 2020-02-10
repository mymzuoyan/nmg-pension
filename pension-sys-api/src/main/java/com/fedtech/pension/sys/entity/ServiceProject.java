package com.fedtech.pension.sys.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 服务项目表
 * @author gengqiang
 */
public class ServiceProject implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 价格id
     */
    private Integer priceId;

    /**
     * 服务类型 1-政府购买
     */
    private Integer serviceType;

    /**
     * 服务类型名称
     */
    private String serviceTypeName;

    /**
     * 服务名称
     */
    private String serviceName;

    /**
     * 服务编码
     */
    private String serviceCode;

    /**
     * 服务价格
     */
    private Double servicePrice;

    /**
     * 单位（元/次|元/小时）
     */
    private String serviceUnit;

    /**
     * 配套收费项目
     */
    private String moreService;

    /**
     * 配套项目价格
     */
    private String moreInfo;

    /**
     * 0:待审核 1:正常 2:禁用 3:审核不通过
     * 默认：1
     */
    private Integer status;

    /**
     * 创建人
     */
    private Integer creator;

    /**
     * 组织名称
     */
    private String serviceOrgName;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPriceId() {
        return priceId;
    }

    public void setPriceId(Integer priceId) {
        this.priceId = priceId;
    }

    public Integer getServiceType() {
        return serviceType;
    }

    public void setServiceType(Integer serviceType) {
        this.serviceType = serviceType;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public Double getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(Double servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getServiceUnit() {
        return serviceUnit;
    }

    public void setServiceUnit(String serviceUnit) {
        this.serviceUnit = serviceUnit;
    }

    public String getMoreService() {
        return moreService;
    }

    public void setMoreService(String moreService) {
        this.moreService = moreService;
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public ServiceProject() {
        super();
    }
}