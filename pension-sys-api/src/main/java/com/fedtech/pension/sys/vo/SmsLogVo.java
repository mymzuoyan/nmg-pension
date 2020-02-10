package com.fedtech.pension.sys.vo;

import java.util.Date;

/**
 * Created by CoderQiang on 2017/3/23.
 */
public class SmsLogVo {

    private Integer id;
    private String phone;
    private String content;
    private String ip;
    private Integer type;
    private Integer elderId;
    private String elderName;
    private Date createTime;
    private Integer status;

    public SmsLogVo() {
    }

    public SmsLogVo(Integer id, String phone, String content, String ip, Date createTime) {
        this.id = id;
        this.phone = phone;
        this.content = content;
        this.ip = ip;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "SmsLog{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", content='" + content + '\'' +
                ", ip='" + ip + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIp() {
        return ip;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getElderId() {
        return elderId;
    }

    public void setElderId(Integer elderId) {
        this.elderId = elderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public String getElderName() {
        return elderName;
    }

    public void setElderName(String elderName) {
        this.elderName = elderName;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
