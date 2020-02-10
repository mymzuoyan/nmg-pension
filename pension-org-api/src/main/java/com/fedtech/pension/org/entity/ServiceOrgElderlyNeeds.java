package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 *  旅居老人需求管理
 * @author miaoyueming
 * @date 2019/9/24
 */

public class ServiceOrgElderlyNeeds implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**
     * 序号
     */
    private Integer id;

    /**
     * 老人姓名
     */
    private String elderName;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 需求内容
     */
    private String demandContent;

    /**
     * 需求时间
     */
    private String needsTime;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDemandContent() {
        return demandContent;
    }

    public void setDemandContent(String demandContent) {
        this.demandContent = demandContent;
    }

    public String getNeedsTime() {
        return needsTime;
    }

    public void setNeedsTime(String needsTime) {
        this.needsTime = needsTime;
    }
}
