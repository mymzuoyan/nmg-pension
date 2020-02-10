package com.fedtech.pension.nurse.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class NurseElderlySign  implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Integer elderId;

    private String elderName;

    private Integer elderSex;

    private Integer elderAge;
    /**
     * 体征类型
     */
    private Integer signType;

    private String signResult;

    private String source;

    private String sourceNumber;

    private Integer status;

    private Date createTime;

    public NurseElderlySign() {
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

    public Integer getElderSex() {
        return elderSex;
    }

    public void setElderSex(Integer elderSex) {
        this.elderSex = elderSex;
    }

    public Integer getElderAge() {
        return elderAge;
    }

    public void setElderAge(Integer elderAge) {
        this.elderAge = elderAge;
    }

    public Integer getSignType() {
        return signType;
    }

    public void setSignType(Integer signType) {
        this.signType = signType;
    }

    public String getSignResult() {
        return signResult;
    }

    public void setSignResult(String signResult) {
        this.signResult = signResult;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSourceNumber() {
        return sourceNumber;
    }

    public void setSourceNumber(String sourceNumber) {
        this.sourceNumber = sourceNumber;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}