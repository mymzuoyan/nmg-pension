package com.fedtech.entity;

import java.io.Serializable;
import java.util.HashMap;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
public class LiAnNurseRequest implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 对方系统类别监测id
     */
    private String testRecordID;

    /**
     * 本系统内老人id
     */
    private String memberID;

    /**
     * 老人身份证
     */
    private String idcardno;


    /**
     * 监测类别 1:血压，2:血糖，3:体重，4:运动，5:睡眠，6:身体指数，
     * 7:血脂，8:血尿酸，9:血氧，10:心电，11:呼吸率，12:精神指数，
     * 13:皮肤指数,14:体温
     */
    private Integer testType;

    /**
     * 监测时间yyyy-MM-dd HH:mm:ss
     */
    private String testTime;

    /**
     * 来源采集方式CODE，1 APP、2 微信、3 会员网站端
     */
    private Integer collectType;

    /**
     * 来源采集平台
     */
    private String collectSys;

    /**
     * 设备型号
     */
    private String deviceType;

    /**
     * 设备串号
     */
    private String deviceSid;

    /**
     * 监测项目json字符串结构体
     */
    private HashMap testBody;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTestRecordID() {
        return testRecordID;
    }

    public void setTestRecordID(String testRecordID) {
        this.testRecordID = testRecordID;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
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

    public String getCollectSys() {
        return collectSys;
    }

    public void setCollectSys(String collectSys) {
        this.collectSys = collectSys;
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

    public HashMap getTestBody() {
        return testBody;
    }

    public void setTestBody(HashMap testBody) {
        this.testBody = testBody;
    }
}