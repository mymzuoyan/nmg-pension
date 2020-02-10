package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * 获奖信息登记表
 * @author miaoyueming
 * @date 2019/10/12
 */
public class UserFuWuPrize implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**序号Id*/
    private Integer id;

    /**外键机构id*/
    private Integer serviceOrgId;

    /**老人身份证号*/
    private String idcardno;

    /**从业人员姓名*/
    private String name;

    /**获奖名称*/
    private String prizeName;

    /**获奖时间*/
    private String prizeTime;

    /**获奖单位*/
    private String winningUnit;

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

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrizeName() {
        return prizeName;
    }

    public void setPrizeName(String prizeName) {
        this.prizeName = prizeName;
    }

    public String getPrizeTime() {
        return prizeTime;
    }

    public void setPrizeTime(String prizeTime) {
        this.prizeTime = prizeTime;
    }

    public String getWinningUnit() {
        return winningUnit;
    }

    public void setWinningUnit(String winningUnit) {
        this.winningUnit = winningUnit;
    }
}
