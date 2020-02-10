package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 呼叫客户信息
 * @author gengqiang
 */
public class Customer implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

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
     * 年龄
     */
    private Integer age;

    /**
     * 性别 （状态1男 2女）
     */
    private Integer sexDictId;

    /**
     * 起始年龄
     */
    private Integer startAge;

    /**
     * 最终年龄
     */
    private Integer endAge;

    /**
     * 设备类型
     */
    private Integer beeperType;

    /**
     * 设备id
     */
    private String beeperId;

    /**
     * 设备名称
     */
    private String beeperName;

    /**
     * 设备号码
     */
    private String beeperNum;

    /**
     * 安装时间
     */
    private Date beeperTime;

    /**
     * 呼叫器设备区域
     */
    private String beeperAddress;

    /**
     * 设备详细地址
     */
    private String beeperMoreAddress;

    /**
     * 呼叫器状态
     */
    private Integer beeperStatus;

    /**
     * 呼叫客户组id
     */
    private Integer customerGroupId;

    /**
     * 创建人
     */
    private Integer creatorId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 1：正常 0:删除
     * 默认1
     */
    private Integer status;

    /**
     * 服务人员
     */
    private String servicePer;

    /**
     * 服务联系电话
     */
    private String serviceMobile;

    /**
     * 工作类型：社工/养老服务员/其他
     */
    private String serviceWorkType;

    /**
     * 所属单位（或社区居家养老服务组织）
     */
    private String serviceWorkUnit;

    /**
     * 个人安装意愿
     */
    private String installNeed;

    /**
     * 区域编号
     */
    private Integer areaId;

    public Customer() {

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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSexDictId() {
        return sexDictId;
    }

    public void setSexDictId(Integer sexDictId) {
        this.sexDictId = sexDictId;
    }

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

    public Integer getBeeperType() {
        return beeperType;
    }

    public void setBeeperType(Integer beeperType) {
        this.beeperType = beeperType;
    }

    public String getBeeperId() {
        return beeperId;
    }

    public void setBeeperId(String beeperId) {
        this.beeperId = beeperId;
    }

    public String getBeeperNum() {
        return beeperNum;
    }

    public void setBeeperNum(String beeperNum) {
        this.beeperNum = beeperNum;
    }

    public Date getBeeperTime() {
        return beeperTime;
    }

    public void setBeeperTime(Date beeperTime) {
        this.beeperTime = beeperTime;
    }

    public String getBeeperAddress() {
        return beeperAddress;
    }

    public void setBeeperAddress(String beeperAddress) {
        this.beeperAddress = beeperAddress;
    }


    public String getBeeperMoreAddress() {
        return beeperMoreAddress;
    }

    public void setBeeperMoreAddress(String beeperMoreAddress) {
        this.beeperMoreAddress = beeperMoreAddress;
    }

    public Integer getCustomerGroupId() {
        return customerGroupId;
    }

    public void setCustomerGroupId(Integer customerGroupId) {
        this.customerGroupId = customerGroupId;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getBeeperName() {
        return beeperName;
    }

    public void setBeeperName(String beeperName) {
        this.beeperName = beeperName;
    }

    public Integer getBeeperStatus() {
        return beeperStatus;
    }

    public void setBeeperStatus(Integer beeperStatus) {
        this.beeperStatus = beeperStatus;
    }

    public String getServicePer() {
        return servicePer;
    }

    public void setServicePer(String servicePer) {
        this.servicePer = servicePer;
    }

    public String getServiceMobile() {
        return serviceMobile;
    }

    public void setServiceMobile(String serviceMobile) {
        this.serviceMobile = serviceMobile;
    }

    public String getServiceWorkType() {
        return serviceWorkType;
    }

    public void setServiceWorkType(String serviceWorkType) {
        this.serviceWorkType = serviceWorkType;
    }

    public String getServiceWorkUnit() {
        return serviceWorkUnit;
    }

    public void setServiceWorkUnit(String serviceWorkUnit) {
        this.serviceWorkUnit = serviceWorkUnit;
    }

    public String getInstallNeed() {
        return installNeed;
    }

    public void setInstallNeed(String installNeed) {
        this.installNeed = installNeed;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }
}