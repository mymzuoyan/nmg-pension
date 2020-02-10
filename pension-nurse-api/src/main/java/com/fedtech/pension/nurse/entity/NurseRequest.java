package com.fedtech.pension.nurse.entity;

import com.fedtech.pension.sys.entity.User;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;

/**
 * @author miaoyueming
 * 请求
 */
public class NurseRequest implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 对方系统类别监测id
     */
    private String recordId;

    /**
     * 本系统内老人id
     */
    private Integer elderId;

    /**
     * 老人名称
     */
    private String  elderName;

    /**
     * 老人身份证
     */
    private String idcardno;


    /**
     * 监测类别 1:血压，2:血糖，3:体重，4:运动，5:睡眠，6:身体指数，
     * 7:血脂，8:血尿酸，9:血氧，10:心电，11:呼吸率，12:精神指数，
     * 13:皮肤指数,14:体温
     */
    private Integer type;

    /**
     * 监测时间yyyy-MM-dd HH:mm:ss
     */
    private String time;

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
    private HashMap body;

    /**
     * 结果
     */
    private String result;

    /**
     * 关联id
     */
    private Integer associationId;

    /**
     * 创建人
     */
    private User creator;

    /**
     *  创建时间
     */
    private Date createTime;





    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
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

    public String getIdcardno() {
        return idcardno;
    }

    public void setIdcardno(String idcardno) {
        this.idcardno = idcardno;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
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

    public HashMap getBody() {
        return body;
    }

    public void setBody(HashMap body) {
        this.body = body;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Integer getAssociationId() {
        return associationId;
    }

    public void setAssociationId(Integer associationId) {
        this.associationId = associationId;
    }


    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
