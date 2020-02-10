package com.fedtech.pension.call.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 呼叫记录处理信息表（弃用）
 * @author CodingQiang
 * @date 2016/10/17
 */
public class CallHandle implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 电话记录id
     */
    private Integer callInfoId;

    /**
     * 坐席名称
     */
    private String monitorName;

    private String content;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCallInfoId() {
        return callInfoId;
    }

    public void setCallInfoId(Integer callInfoId) {
        this.callInfoId = callInfoId;
    }

    public String getMonitorName() {
        return monitorName;
    }

    public void setMonitorName(String monitorName) {
        this.monitorName = monitorName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public CallHandle() {
    }
}
