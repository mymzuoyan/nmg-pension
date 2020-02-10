package com.fedtech.pension.sys.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.SysPermission;

import java.util.List;

/**
 * @author Gong
 * @date 16/7/26
 */
public interface SysPermissionMapper extends BaseMapper<SysPermission> {
    /**
     * 获取所有列表
     *
     * @return
     */
    List<SysPermission> selectAllList();

    /**
     * 获取用户权限名称
     *
     * @param userId
     * @return
     */
    List<String> getSyspermissionName(Integer userId);
}
