package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Blood implements Serializable {
    private Integer id; //主键id
    private String memberID;//用户注册所在系统唯一id
    private String testRecordID;//该类别监测记录唯一标识
    private Integer testType;//监测类别 1:血压，2:血糖，3:体重，4:运动，5:睡眠，6:身体指数，7:血脂，8: 血尿酸，9:血氧，10:心电，11:呼吸率，12:精神指数，13:皮肤指数,14:体温
    private String testTime;//监测时间yyyy-MM-dd HH:mm:ss
    private Integer collectType;//来源采集方式CODE，1 APP、2 微信、3 会员网站端
    private String deviceType;//设备型号
    private String deviceSid ;//设备串号
    private String testBody ;//监测项目json字符串结构体
    private Float hightValue; //收缩压 高压 单位 mmHg
    private Float lowValue;//舒张压 低压 单位 mmHg
    private Integer pulseValue;//脉率 单位 bpm
    private Integer level;//血压级别 -1:偏低, 0:正常, 1:正常高值,2:1级高血压, 3:2级高血压, 4:3级高血压
    private String levelName;//血压级别 -1:偏低, 0:正常, 1:正常高值,2:1级高血压, 3:2级高血压, 4:3级高血压

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getTestRecordID() {
        return testRecordID;
    }

    public void setTestRecordID(String testRecordID) {
        this.testRecordID = testRecordID;
    }

    public Integer getTestType() {
        return testType;
    }

    public void setTestType(Integer testType) {
        this.testType = testType;
    }

    public String getTestTime() {
        return testTime;
    }

    public void setTestTime(String testTime) {
        this.testTime = testTime;
    }

    public Integer getCollectType() {
        return collectType;
    }

    public void setCollectType(Integer collectType) {
        this.collectType = collectType;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getDeviceSid() {
        return deviceSid;
    }

    public void setDeviceSid(String deviceSid) {
        this.deviceSid = deviceSid;
    }

    public String getTestBody() {
        return testBody;
    }

    public void setTestBody(String testBody) {
        this.testBody = testBody;
    }

    public Float getHightValue() {
        return hightValue;
    }

    public void setHightValue(Float hightValue) {
        this.hightValue = hightValue;
    }

    public Float getLowValue() {
        return lowValue;
    }

    public void setLowValue(Float lowValue) {
        this.lowValue = lowValue;
    }

    public Integer getPulseValue() {
        return pulseValue;
    }

    public void setPulseValue(Integer pulseValue) {
        this.pulseValue = pulseValue;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }
}
