package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 回拨信息表
 * @author CodingQiang
 * @date 2016/10/19
 */
public class CallBack implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 回拨号码
     */
    private String callerId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 队列号
     */
    private String queueName;

    /**
     * 坐席名称
     */
    private String monitorName;

    /**
     * 唯一标识
     */
    private String uniqueId;

    /**
     * 连接id
     */
    private String linkedId;

    /**
     * 1正常回拨 2：回访
     */
    private Integer type;

    /**
     * 分机号
     */
    private String extension;


    public CallBack() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCallerId() {
        return callerId;
    }

    public void setCallerId(String callerId) {
        this.callerId = callerId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getQueueName() {
        return queueName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public String getMonitorName() {
        return monitorName;
    }

    public void setMonitorName(String monitorName) {
        this.monitorName = monitorName;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getLinkedId() {
        return linkedId;
    }

    public void setLinkedId(String linkedId) {
        this.linkedId = linkedId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }
}

