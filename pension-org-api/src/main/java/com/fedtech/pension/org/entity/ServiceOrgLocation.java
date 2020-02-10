package com.fedtech.pension.org.entity;

import java.io.Serializable;

/**
 * @author Administrator
 * @date 2016/9/23
 */
public class ServiceOrgLocation implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Integer serviceOrgId;

    private String serviceOrgName;

    private String serviceProject;

    private String serviceProjectName;

    private Integer type;

    private String institutionTypeDictId;

    private Integer gradeDictId;

    private int serviceUserCount;

    private Double feedbackRate;

    private Integer areaId;

    private String areaName;

    private String address;

    private String linkMan;

    private String phone;

    private Integer bedCount;

    private Integer bedEmptyCount;

    private Double bedMoney;

    private Integer bedNurseCount;

    private Integer bedNurseEmptyCount;

    private Double bedNurseMoney;

    private Integer bedCareCount;

    private Integer bedCareEmptyCount;

    private Double bedCareMoney;

    private Double lng;

    private Double lat;

    private Double serviceRadius;// 服务半径

    private Integer sort;// 避免对象相同

    public ServiceOrgLocation() {

    }

    public ServiceOrgLocation(ServiceOrgLocation serviceOrgLocation) {
        this.id = serviceOrgLocation.getId();

        this.serviceOrgId = serviceOrgLocation.getServiceOrgId();

        this.serviceOrgName = serviceOrgLocation.getServiceOrgName();

        this.serviceProject = serviceOrgLocation.getServiceOrgName();

        this.serviceProjectName = serviceOrgLocation.getServiceOrgName();

        this.type = serviceOrgLocation.getType();

        this.institutionTypeDictId = serviceOrgLocation.getInstitutionTypeDictId();

        this.gradeDictId = serviceOrgLocation.getGradeDictId();

        this.serviceUserCount = serviceOrgLocation.getServiceUserCount();

        this.feedbackRate = serviceOrgLocation.getFeedbackRate();

        this.areaId = serviceOrgLocation.getAreaId();

        this.areaName = serviceOrgLocation.getAreaName();

        this.address = serviceOrgLocation.getAddress();

        this.linkMan = serviceOrgLocation.getLinkMan();

        this.phone = serviceOrgLocation.getPhone();

        this.bedCount = serviceOrgLocation.getBedCount();

        this.bedEmptyCount = serviceOrgLocation.getBedEmptyCount();

        this.bedMoney = serviceOrgLocation.getBedMoney();

        this.bedNurseCount = serviceOrgLocation.getBedNurseCount();

        this.bedNurseEmptyCount = serviceOrgLocation.getBedNurseEmptyCount();

        this.bedNurseMoney = serviceOrgLocation.getBedNurseMoney();

        this.bedCareCount = serviceOrgLocation.getBedCareCount();

        this.bedCareEmptyCount = serviceOrgLocation.getBedCareEmptyCount();

        this.bedCareMoney = serviceOrgLocation.getBedCareMoney();

        this.lng = serviceOrgLocation.getLng();

        this.lat = serviceOrgLocation.getLat();

        this.serviceRadius = serviceOrgLocation.getServiceRadius();
    }

    @Override
    public String toString() {
        return "ServiceOrgLocation{" +
                "id=" + id +
                ", serviceOrgId=" + serviceOrgId +
                ", serviceOrgName='" + serviceOrgName + '\'' +
                ", institutionTypeDictId='" + institutionTypeDictId + '\'' +
                ", gradeDictId=" + gradeDictId +
                ", serviceUserCount=" + serviceUserCount +
                ", areaId=" + areaId +
                ", areaName='" + areaName + '\'' +
                ", address='" + address + '\'' +
                ", linkMan='" + linkMan + '\'' +
                ", phone='" + phone + '\'' +
                ", lng=" + lng +
                ", lat=" + lat +
                '}';
    }

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

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getServiceProject() {
        return serviceProject;
    }

    public void setServiceProject(String serviceProject) {
        this.serviceProject = serviceProject;
    }

    public String getServiceProjectName() {
        return serviceProjectName;
    }

    public void setServiceProjectName(String serviceProjectName) {
        this.serviceProjectName = serviceProjectName;
    }

    public String getInstitutionTypeDictId() {
        return institutionTypeDictId;
    }

    public void setInstitutionTypeDictId(String institutionTypeDictId) {
        this.institutionTypeDictId = institutionTypeDictId;
    }

    public Integer getGradeDictId() {
        return gradeDictId;
    }

    public void setGradeDictId(Integer gradeDictId) {
        this.gradeDictId = gradeDictId;
    }

    public int getServiceUserCount() {
        return serviceUserCount;
    }

    public void setServiceUserCount(int serviceUserCount) {
        this.serviceUserCount = serviceUserCount;
    }

    public Double getFeedbackRate() {
        return feedbackRate;
    }

    public void setFeedbackRate(Double feedbackRate) {
        this.feedbackRate = feedbackRate;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLinkMan() {
        return linkMan;
    }

    public void setLinkMan(String linkMan) {
        this.linkMan = linkMan;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }


    public Integer getBedCount() {
        return bedCount;
    }

    public void setBedCount(Integer bedCount) {
        this.bedCount = bedCount;
    }

    public Double getBedMoney() {
        return bedMoney;
    }

    public void setBedMoney(Double bedMoney) {
        this.bedMoney = bedMoney;
    }

    public Integer getBedNurseCount() {
        return bedNurseCount;
    }

    public void setBedNurseCount(Integer bedNurseCount) {
        this.bedNurseCount = bedNurseCount;
    }

    public Double getBedNurseMoney() {
        return bedNurseMoney;
    }

    public void setBedNurseMoney(Double bedNurseMoney) {
        this.bedNurseMoney = bedNurseMoney;
    }

    public Integer getBedCareCount() {
        return bedCareCount;
    }

    public void setBedCareCount(Integer bedCareCount) {
        this.bedCareCount = bedCareCount;
    }

    public Double getBedCareMoney() {
        return bedCareMoney;
    }

    public void setBedCareMoney(Double bedCareMoney) {
        this.bedCareMoney = bedCareMoney;
    }


    public Integer getBedEmptyCount() {
        return bedEmptyCount;
    }

    public void setBedEmptyCount(Integer bedEmptyCount) {
        this.bedEmptyCount = bedEmptyCount;
    }

    public Integer getBedNurseEmptyCount() {
        return bedNurseEmptyCount;
    }

    public void setBedNurseEmptyCount(Integer bedNurseEmptyCount) {
        this.bedNurseEmptyCount = bedNurseEmptyCount;
    }

    public Integer getBedCareEmptyCount() {
        return bedCareEmptyCount;
    }

    public void setBedCareEmptyCount(Integer bedCareEmptyCount) {
        this.bedCareEmptyCount = bedCareEmptyCount;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }


    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    public Double getServiceRadius() {
        return serviceRadius;
    }

    public void setServiceRadius(Double serviceRadius) {
        this.serviceRadius = serviceRadius;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
