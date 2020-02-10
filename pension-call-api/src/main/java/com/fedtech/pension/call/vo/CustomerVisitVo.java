package com.fedtech.pension.call.vo;

import java.io.Serializable;

/**
 * @author CoderQiang
 * @date 2017/3/3
 */
public class CustomerVisitVo implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer id;
    private String beeperAddress;
    private String elderName;
    private Integer age;
    private Integer sexDictId;
    private String beeperNum;
    private Integer visitResult;
    private Integer status;

    public CustomerVisitVo() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBeeperAddress() {
        return beeperAddress;
    }

    public void setBeeperAddress(String beeperAddress) {
        this.beeperAddress = beeperAddress;
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

    public String getBeeperNum() {
        return beeperNum;
    }

    public void setBeeperNum(String beeperNum) {
        this.beeperNum = beeperNum;
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
