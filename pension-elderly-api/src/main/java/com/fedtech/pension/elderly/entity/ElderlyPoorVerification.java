package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

public class ElderlyPoorVerification implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 申请id
     */
    private Integer applyId;

    private String number;

    private String name;

    private String idcardno;

    private String region1;
    /**
     * 年审年份
     */
    private Integer year;
    /**
     * 年审结果 0:需要审核1:通过 2:未通过
     */
    private Integer result;
    /**
     * 年审时间
     */
    private Date createTime;

    private Integer creatorId;
    /**
     * 审定人
     */
    private String creator;
    /**
     * 是否到期 1:过期 0:没有过期
     */
    private Integer expire;
    /**
     * 备注
     */
    private String note;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplyId() {
        return applyId;
    }


    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getRegion1() {
        return region1;
    }

    public void setRegion1(String region1) {
        this.region1 = region1;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }


    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Integer getExpire() {
        return expire;
    }

    public void setExpire(Integer expire) {
        this.expire = expire;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}