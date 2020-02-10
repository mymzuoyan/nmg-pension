package com.fedtech.pension.power.statistics;

import java.io.Serializable;
import java.util.Objects;

/**
 * 服务数据
 *
 * @author gengqiang
 * @date 2019/6/17
 */
public class ServiceData implements Serializable {
    private static final Long serialVersionUID = 1L;

    /**
     * 编号
     */
    private String number;


    /**
     * 区
     */
    private String area;


    /**
     * 服务组织
     */
    private String serviceOrgName;


    /**
     * 服务项目
     */
    private String itemName;


    /**
     * 服务时间
     */
    private String serviceTime;


    /**
     * 来源 1：刷卡2：二维码
     */
    private Integer source;

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ServiceData)) return false;
        ServiceData that = (ServiceData) o;
        return Objects.equals(getNumber(), that.getNumber());
    }

    @Override
    public int hashCode() {

        return Objects.hash(getNumber());
    }
}
