package com.fedtech.pension.org.vo;

import java.io.Serializable;

public class QualificationStatistics implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer number;
    private String areaName;
    private Integer areaId;
    private Integer waitVerity;
    private Integer passVerity;
    private Integer notPassVerity;
    private Integer veritySum;

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getAreaName() {
        return areaName;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Integer getWaitVerity() {
        return waitVerity;
    }

    public void setWaitVerity(Integer waitVerity) {
        this.waitVerity = waitVerity;
    }

    public Integer getPassVerity() {
        return passVerity;
    }

    public void setPassVerity(Integer passVerity) {
        this.passVerity = passVerity;
    }

    public Integer getNotPassVerity() {
        return notPassVerity;
    }

    public void setNotPassVerity(Integer notPassVerity) {
        this.notPassVerity = notPassVerity;
    }

    public Integer getVeritySum() {
        return veritySum;
    }

    public void setVeritySum(Integer veritySum) {
        this.veritySum = veritySum;
    }
}
