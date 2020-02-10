package com.fedtech.pension.call.vo;

import java.io.Serializable;

/**
 *
 * @author CoderQiang
 * @date 2017/2/9
 */
public class ElderlyGovBuyVisitVo implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    private String areaName;
    private String elderName;
    private Integer age;
    private Integer sexDictId;
    private String mobile;
    private Integer visitResult;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getVisitResult() {
        return visitResult;
    }

    public void setVisitResult(Integer visitResult) {
        this.visitResult = visitResult;
    }
}
