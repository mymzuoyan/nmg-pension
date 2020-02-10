package com.fedtech.pension.nurse.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * @author gengqiang
 */
public class NurseAlarm  implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String number;

    private Integer elderId;

    private Integer serviceOrgId;

    private String elderName;
    /**
     * 报警类型
     */
    private String alarmType;

    private Date alarmTime;
    /**
     * 围栏名称
     */
    private String fenceName;
    /**
     * 围栏类型
     */
    private String fenceType;
    /**
     * 建筑物
     */
    private String building;
    /**
     * 楼层
     */
    private String floor;

    private Integer signType;

    private String  signResult;
    /**
     * 创建时间
     */
    private Date createTime;

    private Date startTime;

    private Date endTime;

    private Double lat;

    private Double lng;

    private String jhrXm;//监护人姓名

    private String jhrPhone;//监护人手机号码

    private String gx;//与监护人关系

    public String getJhrXm() {
        return jhrXm;
    }

    public void setJhrXm(String jhrXm) {
        this.jhrXm = jhrXm;
    }

    public String getJhrPhone() {
        return jhrPhone;
    }

    public void setJhrPhone(String jhrPhone) {
        this.jhrPhone = jhrPhone;
    }

    public String getGx() {
        return gx;
    }

    public void setGx(String gx) {
        this.gx = gx;
    }

    public NurseAlarm() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public Integer getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(Integer serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getAlarmType() {
        return alarmType;
    }

    public void setAlarmType(String alarmType) {
        this.alarmType = alarmType;
    }

    public Date getAlarmTime() {
        return alarmTime;
    }

    public void setAlarmTime(Date alarmTime) {
        this.alarmTime = alarmTime;
    }

    public String getFenceName() {
        return fenceName;
    }

    public void setFenceName(String fenceName) {
        this.fenceName = fenceName;
    }

    public String getFenceType() {
        return fenceType;
    }

    public void setFenceType(String fenceType) {
        this.fenceType = fenceType;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }
}