package com.fedtech.pension.nurse.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 * @date 2019/7/4
 */
public class NurseElderly implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**
     * id
     */
    private Integer id;


    /**
     * 区划代码
     */
    private String regionCode;

    /**
     * 关联ID
     */
    private String memberId;

    /**
     * 身份证
     */
    private String idcardno;

    /**
     * 老人姓名
     */
    private String elderName;

    /**
     * 电话
     */
    private String phone;

    /**
     * 设备串号
     */
    private String deviceSid;

    /**
     * 创建时间
     */
    private Date createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeviceSid() {
        return deviceSid;
    }

    public void setDeviceSid(String deviceSid) {
        this.deviceSid = deviceSid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }
}
