package com.fedtech.pension.nurse.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ServiceOrgNurseElderly implements Serializable {

    private static final Long serialVersionUID = 1L;
    private Integer id;

    private Integer elderId;
    /**
     * 组织id
     */
    private String idcardno;

    private String AreaName;

    private String elderName;

    private Integer elderAge;

    private Integer elderSex;

    private Integer serviceOrgId;

    private String serviceOrgName;

    private String deviceName;

    private String deviceNumber;

    private String bedInfo;
    /**
     * 进驻时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 离开时间
     */
    private Date leaveTime;

    private String deviceMobile;

    private String deviceSecret;

    private Integer sexDictId;

    private Integer startAge;

    private Integer endAge;

    public Integer getStartAge() {
        return startAge;
    }

    public void setStartAge(Integer startAge) {
        this.startAge = startAge;
    }

    public Integer getEndAge() {
        return endAge;
    }

    public void setEndAge(Integer endAge) {
        this.endAge = endAge;
    }

    public Integer getSexDictId() {
        return sexDictId;
    }

    public void setSexDictId(Integer sexDictId) {
        this.sexDictId = sexDictId;
    }

    public ServiceOrgNurseElderly() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getDeviceNumber() {
        return deviceNumber;
    }

    public void setDeviceNumber(String deviceNumber) {
        this.deviceNumber = deviceNumber;
    }

    public String getBedInfo() {
        return bedInfo;
    }

    public void setBedInfo(String bedInfo) {
        this.bedInfo = bedInfo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public Integer getElderAge() {
        return elderAge;
    }

    public void setElderAge(Integer elderAge) {
        this.elderAge = elderAge;
    }

    public Integer getElderSex() {
        return elderSex;
    }

    public void setElderSex(Integer elderSex) {
        this.elderSex = elderSex;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public String getAreaName() {
        return AreaName;
    }

    public void setAreaName(String areaName) {
        AreaName = areaName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getDeviceMobile() {
        return deviceMobile;
    }

    public void setDeviceMobile(String deviceMobile) {
        this.deviceMobile = deviceMobile;
    }

    public String getDeviceSecret() {
        return deviceSecret;
    }

    public void setDeviceSecret(String deviceSecret) {
        this.deviceSecret = deviceSecret;
    }
}