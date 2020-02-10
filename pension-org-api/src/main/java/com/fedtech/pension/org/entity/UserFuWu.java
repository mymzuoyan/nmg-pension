package com.fedtech.pension.org.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zhnn
 * @date 2017/2/17
 */
public class UserFuWu implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    private Integer userId;
    private Integer volunteerId;
    private String name;
    private Integer age;
    private Integer userType;
    private Integer userLevel;
    private String serviceType;
    private String gender;
    private String idcardno;
    private String QQ;
    private String realAddress;
    private String serviceOrgName;
    private Integer serviceOrgType;
    private String cityAddress;
    private String volFlag;
    private Integer serviceOrgId;
    private String areaName;
    private String mobile;
    private Double startLevel;
    private String idPhotos;
    private String idPhotos2;
    private String idPhotos3;
    private String idPhotos4;
    private String avatar;
    private String serviceProject;
    private Integer adminFlag;
    private Integer workType;
    private Integer certificate;
    private Integer train;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date socialTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date certificateTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date educationTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date entryTime;
    private Integer recordCount;

    private String namePy;
    private String namePySx;
    private Integer status;//app登录权限 1有 0 无
    private String password;
    private String headImage;

    private Integer  onServerNum;//服务数
    private Double lng;//经度
    private Double lat;//纬度

    //服务人员市场工单统计
    private String scCount;
    //服务人员计划工单统计
    private String jhCount;

    //服务人员好评率反馈
    private String favorableRate;

    public String getFavorableRate() {
        return favorableRate;
    }

    public void setFavorableRate(String favorableRate) {
        this.favorableRate = favorableRate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVolunteerId() {
        return volunteerId;
    }

    public void setVolunteerId(Integer volunteerId) {
        this.volunteerId = volunteerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(Integer userLevel) {
        this.userLevel = userLevel;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getQQ() {
        return QQ;
    }

    public void setQQ(String QQ) {
        this.QQ = QQ;
    }

    public String getRealAddress() {
        return realAddress;
    }

    public void setRealAddress(String realAddress) {
        this.realAddress = realAddress;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public Integer getServiceOrgType() {
        return serviceOrgType;
    }

    public void setServiceOrgType(Integer serviceOrgType) {
        this.serviceOrgType = serviceOrgType;
    }

    public String getCityAddress() {
        return cityAddress;
    }

    public void setCityAddress(String cityAddress) {
        this.cityAddress = cityAddress;
    }

    public String getVolFlag() {
        return volFlag;
    }

    public void setVolFlag(String volFlag) {
        this.volFlag = volFlag;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Double getStartLevel() {
        return startLevel;
    }

    public void setStartLevel(Double startLevel) {
        this.startLevel = startLevel;
    }

    public String getIdPhotos() {
        return idPhotos;
    }

    public void setIdPhotos(String idPhotos) {
        this.idPhotos = idPhotos;
    }

    public String getIdPhotos2() {
        return idPhotos2;
    }

    public void setIdPhotos2(String idPhotos2) {
        this.idPhotos2 = idPhotos2;
    }

    public String getIdPhotos3() {
        return idPhotos3;
    }

    public void setIdPhotos3(String idPhotos3) {
        this.idPhotos3 = idPhotos3;
    }

    public String getIdPhotos4() {
        return idPhotos4;
    }

    public void setIdPhotos4(String idPhotos4) {
        this.idPhotos4 = idPhotos4;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getServiceProject() {
        return serviceProject;
    }

    public void setServiceProject(String serviceProject) {
        this.serviceProject = serviceProject;
    }

    public Integer getAdminFlag() {
        return adminFlag;
    }

    public void setAdminFlag(Integer adminFlag) {
        this.adminFlag = adminFlag;
    }

    public Integer getWorkType() {
        return workType;
    }

    public void setWorkType(Integer workType) {
        this.workType = workType;
    }

    public Integer getCertificate() {
        return certificate;
    }

    public void setCertificate(Integer certificate) {
        this.certificate = certificate;
    }

    public Integer getTrain() {
        return train;
    }

    public void setTrain(Integer train) {
        this.train = train;
    }

    public Date getSocialTime() {
        return socialTime;
    }

    public void setSocialTime(Date socialTime) {
        this.socialTime = socialTime;
    }

    public Date getCertificateTime() {
        return certificateTime;
    }

    public void setCertificateTime(Date certificateTime) {
        this.certificateTime = certificateTime;
    }

    public Date getEducationTime() {
        return educationTime;
    }

    public void setEducationTime(Date educationTime) {
        this.educationTime = educationTime;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }

    public String getNamePy() {
        return namePy;
    }

    public void setNamePy(String namePy) {
        this.namePy = namePy;
    }

    public String getNamePySx() {
        return namePySx;
    }

    public void setNamePySx(String namePySx) {
        this.namePySx = namePySx;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public Integer getOnServerNum() {
        return onServerNum;
    }

    public void setOnServerNum(Integer onServerNum) {
        this.onServerNum = onServerNum;
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

    public String getScCount() {
        return scCount;
    }

    public void setScCount(String scCount) {
        this.scCount = scCount;
    }

    public String getJhCount() {
        return jhCount;
    }

    public void setJhCount(String jhCount) {
        this.jhCount = jhCount;
    }
}
