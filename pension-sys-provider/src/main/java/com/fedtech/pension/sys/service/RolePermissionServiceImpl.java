package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.RolePermission;
import com.fedtech.pension.sys.mapper.RolePermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author GQ
 * @date 16/5/17
 */
@Service(version = "1.0.0", interfaceClass = RolePermissionService.class)
public class RolePermissionServiceImpl extends BaseServiceImpl<RolePermission> implements RolePermissionService {

    @Autowired
    private RolePermissionMapper mapper;

    @Override
    public BaseMapper<RolePermission> getMapper() {
        return mapper;
    }

    @Override
    @Transactional
    public int insertSomeRolePermissions(List<RolePermission> rolePermissions) {
        if (rolePermissions == null || rolePermissions.size() < 1) {
            return 0;
        }
        if (deleteByRoleID(rolePermissions.get(0).getRoleId())) {
            return mapper.insertSomeRolePermissions(rolePermissions);
        }
        return 0;

    }

    @Override
    public boolean deleteByRoleID(Integer id) {
        if (null != id) {
            return mapper.deleteByRoleID(id) >= 0;
        }
        return false;
    }
}
