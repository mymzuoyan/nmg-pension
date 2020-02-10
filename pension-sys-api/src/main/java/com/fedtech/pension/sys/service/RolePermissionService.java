package com.fedtech.pension.sys.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.RolePermission;

import java.util.List;

/**
 * Created by GQ on 16/5/17.
 */
public interface RolePermissionService extends BaseService<RolePermission> {

    /**
     * 批量添加
     *
     * @param rolePermissions
     * @return
     */
    int insertSomeRolePermissions(List<RolePermission> rolePermissions);

    /**
     * 删除
     *
     * @param id
     * @return
     */
    boolean deleteByRoleID(Integer id);
}
