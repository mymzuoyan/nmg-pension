package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 服务类型
 * @author CodingQiang
 * @date 2016/10/27
 */
public class ServiceType implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 服务类型
     */
    private String name;

    /**
     * 计次操作 0'>否 '1'>是
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

    public ServiceType() {
    }
}
