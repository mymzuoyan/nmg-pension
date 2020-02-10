package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 呼叫记录表
 * @author gengqiang
 */
public class CallInfo implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 来电号码
     */
    private String callerId;

    /**
     * 来电时间
     */
    private Date createTime;

    /**
     * 队列名称
     */
    private String queueName;

    /**
     * 坐席名称
     */
    private String monitorName;

    /**
     * 分机号
     */
    private String extension;

    /**
     * 应答时间
     */
    private Date answerTime;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 通话唯一标识 与呼叫中心关联
     */
    private String uniqueId;

    /**
     * 关联id
     */
    private String linkedId;

    /**
     * 1为未执行评价,0未评价,1为非常满意,2为满意,3为一般,4为不满意.
     */
    private Integer evaluateStar;

    /**
     * 评价内容
     */
    private String evaluateNotes;

    /**
     * 处理内容
     */
    private String handleContent;

    /**
     * 处理时间
     */
    private Date handleTime;

    /**
     * 录音
     */
    private String recording;

    /**
     * 类型：1是呼入（直接拨入），2是呼出（呼叫器呼叫，回拨）3是回访
     */
    private Integer type;

    /**
     * 服务类型：1.紧急救援、2.咨询服务、3.服务转介、4.投诉监管
     */
    private String request;

    /**
     * 具体需要名称
     */
    private String requestName;

    /**
     * 是否需要回放
     */
    private Integer returnVisit;

    /**
     * 状态：0：正在进行中 1：已完结
     */
    private Integer status;

    private String monitorAddress;

    public String getMonitorAddress() {
        return monitorAddress;
    }

    public void setMonitorAddress(String monitorAddress) {
        this.monitorAddress = monitorAddress;
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

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public Date getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(Date answerTime) {
        this.answerTime = answerTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }


    public String getLinkedId() {
        return linkedId;
    }

    public void setLinkedId(String linkedId) {
        this.linkedId = linkedId;
    }

    public Integer getEvaluateStar() {
        return evaluateStar;
    }

    public void setEvaluateStar(Integer evaluateStar) {
        this.evaluateStar = evaluateStar;
    }

    public String getEvaluateNotes() {
        return evaluateNotes;
    }

    public void setEvaluateNotes(String evaluateNotes) {
        this.evaluateNotes = evaluateNotes;
    }


    public String getRecording() {
        return recording;
    }

    public void setRecording(String recording) {
        this.recording = recording;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(String uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getHandleContent() {
        return handleContent;
    }

    public void setHandleContent(String handleContent) {
        this.handleContent = handleContent;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    public Integer getReturnVisit() {
        return returnVisit;
    }

    public void setReturnVisit(Integer returnVisit) {
        this.returnVisit = returnVisit;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public CallInfo() {
    }
}