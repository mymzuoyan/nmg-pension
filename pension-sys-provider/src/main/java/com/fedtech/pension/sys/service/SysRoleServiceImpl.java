package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.mapper.RolePermissionMapper;
import com.fedtech.pension.sys.mapper.SysRoleMapper;
import com.fedtech.pension.sys.mapper.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by GQ on 16/5/12.
 */
@Service(version = "1.0.0", interfaceClass = SysRoleService.class)
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements SysRoleService {
    @Autowired
    private SysRoleMapper mapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public BaseMapper<SysRole> getMapper() {
        return mapper;
    }


    @Override
    public boolean deleteByPrimaryKey(Integer id, Integer userId) {
        boolean b = false;
        //删除角色
        if (super.deleteByPrimaryKey(id, userId)) {
            //删除用户角色关系
            if (userRoleMapper.deleteByRoleID(id.intValue()) >= 0) {
                //删除角色权限关系
                if (rolePermissionMapper.deleteByRoleID(id.intValue()) >= 0) {
                    b = true;
                }
            }
        }
        return b;

    }


    @Override
    public List<String> getRoleList(Integer userId) {
        return mapper.getRoleList(userId);
    }

    @Override
    public boolean insertSomeUserRole(List<UserRole> userRoleList) {
        if (userRoleMapper.deleteByUserID(userRoleList.get(0).getUserId()) >= 0) {
            return userRoleMapper.insertSomeUserRole(userRoleList) > 0;
        }
        return false;
    }

    @Override
    public List<UserRole> getUserRolesByUserId(Integer userId) {
        return userRoleMapper.getUserRolesByUserId(userId);
    }

    @Override
    public Map<Integer, String> getRoleNamesByUids(List<User> users) {
        if (users.size() == 0)
            return null;
        List<Map<String, Object>> regionMap = mapper.getRoleNamesByUids(users);
        Map<Integer, String> result = new HashMap<Integer, String>();
        for (Map<String, Object> map : regionMap) {
            String roleName = null;
            Integer uid = null;
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if ("roleName".equals(entry.getKey())) {
                    roleName = (String) entry.getValue();
                } else if ("uid".equals(entry.getKey())) {
                    uid = Integer.parseInt(entry.getValue().toString());
                }
            }
            result.put(uid, roleName);
        }
        return result;
    }
}
