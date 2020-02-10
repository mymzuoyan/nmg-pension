package com.fedtech.pension.task.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 老人钱包
 * @author gengqiang
 */
public class ElderlyWallet implements Serializable {
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
     * 区域名称
     */
    private String areaName;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别 （状态1男 2女）
     */
    private Integer sexDictId;

    /**
     * 身份证
     */
    private String idcardno;

    /**
     * 实际居住地
     */
    private String realAddress;

    /**
     * 余额
     */
    private Double balance;

    private Date createTime;

    private Date updateTime;

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

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
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

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
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

    public ElderlyWallet() {
    }
}