package com.fedtech.entity;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
public class LiAnElderly {

    /**
     * 用户注册所在系统的唯一ID
     */
    private String memberID;

    /**
     * 性别编码1:男，2:女, 0:未说明
     */
    private Integer genderCode;

    /**
     * 姓名
     */
    private String name;

    /**
     * 出生日期yyyy-MM-dd
     */
    private String birthDate;


    /**
     * 记录创建时间yyyy-MM-dd HH:mm:ss
     */
    private String recordDateTime;


    /**
     * 备注。UrlEncode转码UTF-8格式
     */
    private String remark;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 身份证号码
     */
    private String idCardNo;

    /**
     * 设备串号
     */
    private String deviceSid;

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
