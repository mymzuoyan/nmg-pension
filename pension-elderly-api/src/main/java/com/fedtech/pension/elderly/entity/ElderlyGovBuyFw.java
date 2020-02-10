package com.fedtech.pension.elderly.entity;

import java.io.Serializable;

/**
 * @author gengqiang
 */
public class ElderlyGovBuyFw implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 服务组织id
     */
    private Integer serviceOrgId;
    /**
     * 服务组织名称
     */
    private String serviceOrgName;
    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 老人姓名
     */
    private String elderName;
    /**
     * 身份证
     */
    private String idcardno;
    /**
     * 所属区域
     */
    private Integer area;
    /**
     * 所属区域名称
     */
    private String areaName;
    /**
     * 性别
     */
    private Integer sexDictId;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 子女状况
     */
    private Integer childrenDictId;
    /**
     * 家庭住址
     */
    private String realAddress;
    /**
     * 联系电话
     */
    private String mobile;
    /**
     * 移动电话
     */
    private String phone;
    /**
     * 老人类别
     */
    private String elderType;
    /**
     * 居住状况
     */
    private String residenceType;
    /**
     * 补贴金额
     */
    private Integer subsidy;
    /**
     * 服务项目
     */
    private String serviceItems;
    /**
     * 状态
     */
    private Integer status;

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

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getSexDictId() {
        return sexDictId;
    }

    public void setSexDictId(Integer sexDictId) {
        this.sexDictId = sexDictId;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getChildrenDictId() {
        return childrenDictId;
    }

    public void setChildrenDictId(Integer childrenDictId) {
        this.childrenDictId = childrenDictId;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getElderType() {
        return elderType;
    }

    public void setElderType(String elderType) {
        this.elderType = elderType;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public String getResidenceType() {
        return residenceType;
    }

    public void setResidenceType(String residenceType) {
        this.residenceType = residenceType;
    }

    public Integer getSubsidy() {
        return subsidy;
    }

    public void setSubsidy(Integer subsidy) {
        this.subsidy = subsidy;
    }

    public String getServiceItems() {
        return serviceItems;
    }

    public void setServiceItems(String serviceItems) {
        this.serviceItems = serviceItems;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public ElderlyGovBuyFw() {
    }
}