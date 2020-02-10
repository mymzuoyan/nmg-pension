package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author fww
 * 突发事件管理
 */
public class ServiceOrgEmergencyManagement implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 事件类型(1.自然灾害 2.事故灾难 3.公共卫生事件 4.社会安全事件）
     */
    private String eventType;

    /**
     * 服务组织
     */
    private String serviceOrgName;

    /**
     * 发生时间
     */
    private String occurrenceTime;


    /**
     * 事件描述
     */
    private String eventDescription;

    /**
     * 事件照片
     */
    private String eventPhoto;

    /**
     * 处理人
     */
    private String dealPeople;

    /**
     * 处理时间
     */
    private String dealTime;

    /**
     * 处理结果
     */
    private String dealResult;

    /**
     * 处理照片
     */
    private String dealPhoto;

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public String getOccurrenceTime() {
        return occurrenceTime;
    }

    public void setOccurrenceTime(String occurrenceTime) {
        this.occurrenceTime = occurrenceTime;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public String getEventPhoto() {
        return eventPhoto;
    }

    public void setEventPhoto(String eventPhoto) {
        this.eventPhoto = eventPhoto;
    }

    public String getDealPeople() {
        return dealPeople;
    }

    public void setDealPeople(String dealPeople) {
        this.dealPeople = dealPeople;
    }

    public String getDealTime() {
        return dealTime;
    }

    public void setDealTime(String dealTime) {
        this.dealTime = dealTime;
    }

    public String getDealResult() {
        return dealResult;
    }

    public void setDealResult(String dealResult) {
        this.dealResult = dealResult;
    }

    public String getDealPhoto() {
        return dealPhoto;
    }

    public void setDealPhoto(String dealPhoto) {
        this.dealPhoto = dealPhoto;
    }
}
