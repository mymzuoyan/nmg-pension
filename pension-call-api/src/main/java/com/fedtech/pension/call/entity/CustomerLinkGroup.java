package com.fedtech.pension.call.entity;

import java.io.Serializable;

/**
 * 呼叫客户，组关联信息表
 * @author Administrator
 * @date 2016/9/29
 */
public class CustomerLinkGroup implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 呼叫客户id
     */
    private Integer customerId;

    /**
     * 呼叫客户组id
     */
    private Integer groupId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public CustomerLinkGroup() {
    }
}
