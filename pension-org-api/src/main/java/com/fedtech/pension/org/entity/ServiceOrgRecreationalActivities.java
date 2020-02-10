package com.fedtech.pension.org.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author fww
 * 文娱活动信息管理
 */
public class ServiceOrgRecreationalActivities implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    private String organizationName;

    /**
     * 活动名称
     */
    private String activityName;

    /**
     * 活动时间
     */
    private String activityTime;

    /**
     * 参与人数
     */
    private Integer participantsNumber;

    /**
     * 活动内容
     */
    private String activityContent;

    /**
     * 活动地址
     */
    private String address;

    /**
     * 组织者
     */
    private String organizer;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    /**
     * 活动时长

     */
    private String duration;

    public Integer getId() {
        return id;
    }

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(String activityTime) {
        this.activityTime = activityTime;
    }

    public Integer getParticipantsNumber() {
        return participantsNumber;
    }

    public void setParticipantsNumber(Integer participantsNumber) {
        this.participantsNumber = participantsNumber;
    }

    public String getActivityContent() {
        return activityContent;
    }

    public void setActivityContent(String activityContent) {
        this.activityContent = activityContent;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }
}
