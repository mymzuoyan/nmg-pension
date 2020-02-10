package com.fedtech.pension.power.entity;

import java.io.Serializable;

public class Enroll implements Serializable {
    private Integer id; //主键id
    private String memberID;//用户注册所在系统唯一id
    private Integer genderCode; //性别编码1：男2：女0：未说明
    private String name;//会员名
    private String birthDate;//出生日期 yyyy-MM-dd
    private String recordDateTime;//记录创建时间 yyyy-MM-dd HH:mm:ss
    private String remark;//备注 UrlEncode 转码utf-8格式
    private String phone;//手机号码
    private String idCardNo;//身份证号码

    public Integer getTestType() {
        return testType;
    }

    public void setTestType(Integer testType) {
        this.testType = testType;
    }

    private String deviceSid;//设备串号
    private Integer testType;

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

    public Integer getGenderCode() {
        return genderCode;
    }

    public void setGenderCode(Integer genderCode) {
        this.genderCode = genderCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getRecordDateTime() {
        return recordDateTime;
    }

    public void setRecordDateTime(String recordDateTime) {
        this.recordDateTime = recordDateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    public String getDeviceSid() {
        return deviceSid;
    }

    public void setDeviceSid(String deviceSid) {
        this.deviceSid = deviceSid;
    }
}
