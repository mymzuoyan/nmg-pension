package com.fedtech.pension.sys.entity;

import java.io.Serializable;

/**
 * 角色，权限关联表
 * @author GQ
 * @date 16/5/17
 */
public class RolePermission implements Serializable {
    private static final Long serialVersionUID = 1L;

    private Integer id;

    /**
     * 角色id
     */
    private Integer roleId;

    /**
     * 权限id
     */
    private Integer permissionId;

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

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }
}
