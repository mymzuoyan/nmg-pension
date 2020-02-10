package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.RolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * @author Gong
 * @date 16/7/26
 */
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

    /**
     * 保存角色权限关系集合
     *
     * @param rolePermissions
     * @return
     */
    int insertSomeRolePermissions(@Param("rolePermissions") List<RolePermission> rolePermissions);

    /**
     * 根据角色ID删除权限关系
     *
     * @param roleId
     * @return
     */
    int deleteByRoleID(Integer roleId);
}
