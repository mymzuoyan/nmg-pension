package com.fedtech.pension.sys.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.RolePermission;
import com.fedtech.pension.sys.entity.SysPermission;

import java.util.List;

/**
 * Created by Gong on 2016/5/11.
 */
public interface SysPermissionService extends BaseService<SysPermission> {
    /**
     * 获取所有权限
     *
     * @return
     */
    List<SysPermission> selectAllPermissions();

    /**
     * 获取用户权限名称列表
     *
     * @param userId
     * @return
     */
    List<String> getPermNamesByUserId(Integer userId);

    /**
     * 保存角色权限关系集合
     *
     * @param rolePermissions
     * @return
     */
    int insertSomeRolePermissions(List<RolePermission> rolePermissions);

    /**
     * 获取角色的权限列表
     *
     * @param roleId
     * @return
     */
    List<RolePermission> selectRolePermissions(Integer roleId);
}
