package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * Created by CodingQiang on 2016/12/30.
 */
public class UserState implements Serializable {
    private static final Long serialVersionUID = 1L;
    private int uid;     // 用户id
    private String userName;// 姓名
    private String phone;  // 手机号
    private String serviceOrgId;//组织id
    private String serviceOrgName;//组织名称
    private long lastTime;  //最后一次更新位置时间
    private int onLine;     // 1在线 0离线
    private double lat;     // 当前位置纬度坐标
    private double lng;     // 当前位置经度坐标
    private int userStatus;   // 1忙 0闲
    private int taskId;     //当前执行的订单id
    private String gender;//性别
    private String serviceType;// 服务项目

    public static Long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getServiceOrgId() {
        return serviceOrgId;
    }

    public void setServiceOrgId(String serviceOrgId) {
        this.serviceOrgId = serviceOrgId;
    }

    public String getServiceOrgName() {
        return serviceOrgName;
    }

    public void setServiceOrgName(String serviceOrgName) {
        this.serviceOrgName = serviceOrgName;
    }

    public long getLastTime() {
        return lastTime;
    }

    public void setLastTime(long lastTime) {
        this.lastTime = lastTime;
    }

    public int getOnLine() {
        return onLine;
    }

    public void setOnLine(int onLine) {
        this.onLine = onLine;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }
}
