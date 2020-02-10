package com.fedtech.pension.elderly.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 */
public class ElderlyGovbuyApplyHandle implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;
    /**
     * 申请数据id
     */
    private Integer applyId;
    /**
     * 处理人id
     */
    private Integer handlerId;
    /**
     * 处理人姓名
     */
    private String handleName;
    /**
     * 处理内容
     */
    private String handleContent;
    /**
     * 处理时间
     */
    private Date handleTime;
    /**
     * 记录创建时间
     */
    private Date createTime;

    public ElderlyGovbuyApplyHandle() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Integer getHandlerId() {
        return handlerId;
    }

    public void setHandlerId(Integer handlerId) {
        this.handlerId = handlerId;
    }

    public String getHandleName() {
        return handleName;
    }

    public void setHandleName(String handleName) {
        this.handleName = handleName;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}