package com.fedtech.pension.elderly.entity;

import java.util.Date;

public class ElderAssessCheck {
    private Integer id;

    /**
     * 老人id
     */
    private Integer elderId;
    /**
     * 被检查单位
     */
    private String bycheckUnit;
    /**
     * 联系人
     */
    private String linkMan;
    /**
     * 联系方式
     */
    private String linkPhone;
    /**
     * 联系人地址
     */
    private String linkAddress;
    /**
     * 检查单位
     */
    private String checkUnit;
    /**
     * 检查人
     */
    private String checkMan;
    /**
     * 检查时间
     */
    private Date checkTime;
    /**
     * 检查内容
     */
    private String checkContent;
    /**
     * 检查结果
     */
    private String checkResult;

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

    public String getBycheckUnit() {
        return bycheckUnit;
    }

    public void setBycheckUnit(String bycheckUnit) {
        this.bycheckUnit = bycheckUnit == null ? null : bycheckUnit.trim();
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan == null ? null : linkMan.trim();
    }

    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone == null ? null : linkPhone.trim();
    }

    public String getCheckUnit() {
        return checkUnit;
    }

    public void setCheckUnit(String checkUnit) {
        this.checkUnit = checkUnit == null ? null : checkUnit.trim();
    }

    public String getCheckMan() {
        return checkMan;
    }

    public void setCheckMan(String checkMan) {
        this.checkMan = checkMan == null ? null : checkMan.trim();
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public String getCheckContent() {
        return checkContent;
    }

    public void setCheckContent(String checkContent) {
        this.checkContent = checkContent == null ? null : checkContent.trim();
    }

    public String getCheckResult() {
        return checkResult;
    }

    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult == null ? null : checkResult.trim();
    }

    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress;
    }

    public ElderAssessCheck() {
    }
}