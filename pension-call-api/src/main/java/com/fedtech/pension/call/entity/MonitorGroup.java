package com.fedtech.pension.call.entity;

import java.io.Serializable;

/**
 * 坐席组信息表
 * @author Administrator
 * @date 2016/9/26
 */
public class MonitorGroup implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 坐席组名称
     */
    private String name;

    /**
     * 状态：1：正常 0：删除
     * 默认1
     */
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public MonitorGroup() {
    }
}
