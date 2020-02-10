package com.fedtech.pension.task.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 工单处理流程信息
 * @author gengqiang
 */
public class TaskHandle implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 工单id
     */
    private Integer taskId;

    /**
     * 处理人
     */
    private String handleName;

    /**
     * 处理时间
     */
    private Date handleTime;

    /**
     *  0：订单删除、撤销 1：未响应 2:组织已响应 3：组织已派遣 4:组织已拒绝5:服务人员已接单 6:服务人员已上门7:服务人员已拒绝8:已完成9:已评价
     */
    private Integer handleStatus;

    public TaskHandle() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getHandleName() {
        return handleName;
    }

    public void setHandleName(String handleName) {
        this.handleName = handleName;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public Integer getHandleStatus() {
        return handleStatus;
    }

    public void setHandleStatus(Integer handleStatus) {
        this.handleStatus = handleStatus;
    }
}