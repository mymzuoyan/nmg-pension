package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.RolePermission;
import com.fedtech.pension.sys.entity.SysPermission;
import com.fedtech.pension.sys.mapper.RolePermissionMapper;
import com.fedtech.pension.sys.mapper.SysPermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Gong on 2016/5/11.
 */
@Service(version = "1.0.0", interfaceClass = SysPermissionService.class)
public class SysPermissionServiceImpl extends BaseServiceImpl<SysPermission> implements SysPermissionService {

    @Autowired
    private SysPermissionMapper permissionMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public BaseMapper<SysPermission> getMapper() {
        return permissionMapper;
    }

    @Override
    public List<SysPermission> selectAllPermissions() {
        return permissionMapper.selectAllList();
    }

    @Override
    public List<String> getPermNamesByUserId(Integer userId) {
        return permissionMapper.getSyspermissionName(userId);
    }


    @Override
    @Transactional
    public int insertSomeRolePermissions(List<RolePermission> rolePermissions) {
        if (rolePermissions == null || rolePermissions.size() < 1) {
            return 0;
        }
        if (rolePermissionMapper.deleteByRoleID(rolePermissions.get(0).getRoleId()) >= 0) {
            return rolePermissionMapper.insertSomeRolePermissions(rolePermissions);
        }
        return 0;

    }

    @Override
    public List<RolePermission> selectRolePermissions(Integer roleId) {
        RolePermission rp = new RolePermission();
        rp.setRoleId(roleId);
        return rolePermissionMapper.selectPageList(rp, new PageRequest());
    }

}
