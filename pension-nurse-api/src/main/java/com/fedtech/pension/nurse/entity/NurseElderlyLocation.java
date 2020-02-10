package com.fedtech.pension.nurse.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

/**
 * @author gengqiang
 */
public class NurseElderlyLocation  implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    private Integer elderId;

    private String elderName;

    private Integer elderSex;

    private Integer elderAge;
    /**
     * 来源
     */
    private String source;
    /**
     * 来源编码
     */
    private String sourceNumber;

    private String alarmType;

    private Date alarmTime;

    private Map<Integer,String> signResult;

    private Double lat;

    private Double lng;
    /**
     * fenceStatus
     */
    private Integer fenceStatus;

    private Date createTime;

    public NurseElderlyLocation() {
    }

    public NurseElderlyLocation(Integer elderId, String elderName, Integer elderSex, Integer elderAge, String source, String sourceNumber, Double lat, Double lng, Integer fenceStatus, Date createTime) {
        this.elderId = elderId;
        this.elderName = elderName;
        this.elderSex = elderSex;
        this.elderAge = elderAge;
        this.source = source;
        this.sourceNumber = sourceNumber;
        this.lat = lat;
        this.lng = lng;
        this.fenceStatus = fenceStatus;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public Integer getElderSex() {
        return elderSex;
    }

    public void setElderSex(Integer elderSex) {
        this.elderSex = elderSex;
    }

    public Integer getElderAge() {
        return elderAge;
    }

    public void setElderAge(Integer elderAge) {
        this.elderAge = elderAge;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSourceNumber() {
        return sourceNumber;
    }

    public void setSourceNumber(String sourceNumber) {
        this.sourceNumber = sourceNumber;
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


    public Map<Integer, String> getSignResult() {
        return signResult;
    }

    public void setSignResult(Map<Integer, String> signResult) {
        this.signResult = signResult;
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

    public Integer getFenceStatus() {
        return fenceStatus;
    }

    public void setFenceStatus(Integer fenceStatus) {
        this.fenceStatus = fenceStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}