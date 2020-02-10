package com.fedtech.pension.power.statistics;

import java.io.Serializable;
import java.util.List;

/**
 * @author gengqiang
 * @date 2019/6/17
 */
public class ServiceStatisticData implements Serializable {
    private static final Long serialVersionUID = 1L;

    private String area;

    private List<ServiceElderlyData> serviceElderlyData;

    private Integer siteTime;

    private Integer doorTime;

    private Integer siteNumber;

    private Integer doorNumber;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public List<ServiceElderlyData> getServiceElderlyData() {
        return serviceElderlyData;
    }

    public void setServiceElderlyData(List<ServiceElderlyData> serviceElderlyData) {
        this.serviceElderlyData = serviceElderlyData;
    }

    public Integer getSiteTime() {
        return siteTime;
    }

    public void setSiteTime(Integer siteTime) {
        this.siteTime = siteTime;
    }

    public Integer getDoorTime() {
        return doorTime;
    }

    public void setDoorTime(Integer doorTime) {
        this.doorTime = doorTime;
    }

    public Integer getSiteNumber() {
        return siteNumber;
    }

    public void setSiteNumber(Integer siteNumber) {
        this.siteNumber = siteNumber;
    }

    public Integer getDoorNumber() {
        return doorNumber;
    }

    public void setDoorNumber(Integer doorNumber) {
        this.doorNumber = doorNumber;
    }
}
