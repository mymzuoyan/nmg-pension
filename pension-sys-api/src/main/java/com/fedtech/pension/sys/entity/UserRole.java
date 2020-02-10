package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 用户角色表
 * @author GQ
 * @date 16/5/17
 */
public class UserRole implements Serializable {

    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 用户Id
     */
    private Integer userId;

    /**
     * 角色Id
     */
    private Integer roleId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
