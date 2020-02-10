package com.fedtech.pension.org.entity;

import com.fedtech.pension.sys.entity.User;

import java.io.Serializable;
import java.util.Date;

/**
 * @author gengqiang
 * @date 2019/6/27
 */
public class ServiceOrgWareHouse implements Serializable {

    private static final Long serialVersionUID = 1L;

    /**
     * id
     */
    private Integer id;

    /**
     * 组织
     */
    private ServiceOrg serviceOrg;

    /**
     * 货物名称
     */
    private String name;


    /**
     * 数量
     */
    private Integer number;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private User creator;


    /**
     * 类型 1：入库 2：出库
     */
    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ServiceOrg getServiceOrg() {
        return serviceOrg;
    }

    public void setServiceOrg(ServiceOrg serviceOrg) {
        this.serviceOrg = serviceOrg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }
}
