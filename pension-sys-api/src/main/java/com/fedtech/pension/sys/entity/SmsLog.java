package com.fedtech.pension.sys.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 短信发送记录
 * @author CoderQiang
 * @date 2017/3/23
 */
public class SmsLog implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 发送内容
     */
    private String content;

    /**
     * IP地址
     */
    private String ip;

    /**
     * 类型 0:验证码 1:提示信息 2:健康数据推送
     */
    private Integer type;

    /**
     * 老人id
     */
    private Integer elderId;


    /**
     * 状态（0:失败 1:成功）
     */
    private Integer status;

    /**
     *
     */
    private Date createTime;

    public SmsLog() {
    }

    public SmsLog(Integer id, String phone, String content, String ip, Date createTime) {
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
