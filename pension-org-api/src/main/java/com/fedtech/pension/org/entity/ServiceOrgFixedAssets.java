package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 *  居家固定资产
 * @author miaoyueming
 * @date 2019/10/23
 */

public class ServiceOrgFixedAssets implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**序号*/
    private Integer id;

    /**区域id*/
    private Integer areaId;

    /**区域名称*/
    private String areaName;

    /**外键组织id*/
    private Integer serviceOrgId;

    /**分类（文体娱乐设施、医疗保健设施、呼叫设施、监控设施、无障碍设施、餐饮设施、助浴设施、家具家电、消毒设施、电梯设施、水暖设施、供电设施、办公设施、消防设施、其他）*/
    private String classification;

    /**名称*/
    private String name;

    /**单位*/
    private String unit;

    /**数量*/
    private String count;

    /**型号*/
    private String model;

    /**金额*/
    private String money;

    /**实物图片*/
    private String foodPicture;

    /**发票*/
    private String invoice;

    /**备注*/
    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getFoodPicture() {
        return foodPicture;
    }

    public void setFoodPicture(String foodPicture) {
        this.foodPicture = foodPicture;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
