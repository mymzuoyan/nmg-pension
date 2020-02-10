package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 回访信息表
 * Created by CoderQiang on 2017/2/9.
 */
public class ReturnVisit  implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 回访id
     */
    private  Integer visitorId;

    /**
     * 回访客户类型 1：政府购买老人 2： 2A服务组织  3：3A以上服务组织
     */
    private Integer visitorType;

    /**
     * 回访时间
     */
    private Date createTime;

    /**
     * 通话记录id
     */
    private Integer callInfoId;

    /**
     * 内容
     */
    private  String content;

    /**
     * 回拨者
     */
    private Integer creatorId;

    /**
     * 1 已回访 0：未接听
     */
    private Integer visitResult;

    /**
     * 状态 0：过时 1：最新
     */
    private  Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVisitorId() {
        return visitorId;
    }

    public void setVisitorId(Integer visitorId) {
        this.visitorId = visitorId;
    }

    public Integer getVisitorType() {
        return visitorType;
    }

    public void setVisitorType(Integer visitorType) {
        this.visitorType = visitorType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCallInfoId() {
        return callInfoId;
    }

    public void setCallInfoId(Integer callInfoId) {
        this.callInfoId = callInfoId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }

    public Integer getVisitResult() {
        return visitResult;
    }

    public void setVisitResult(Integer visitResult) {
        this.visitResult = visitResult;
    }

    public ReturnVisit() {
    }
}
