package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.mapper.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author GQ
 * @date 16/5/17
 */
@Service(version = "1.0.0", interfaceClass = UserRoleService.class)
public class UserRoleServiceImpl extends BaseServiceImpl<UserRole> implements UserRoleService {

    @Autowired
    private UserRoleMapper mapper;

    @Override
    public BaseMapper<UserRole> getMapper() {
        return mapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertSomeUserRole(List<UserRole> userRoleList) {
        return mapper.insertSomeUserRole(userRoleList);
    }

    @Override
    public boolean deleteByRoleID(Integer id) {
        if (null != id) {
            return 1 == mapper.deleteByRoleID(id);
        }
        return false;
    }

    @Override
    public List<UserRole> getUserRolesByUserId(Integer userId) {
        return mapper.getUserRolesByUserId(userId);
    }

    @Override
    public boolean updateUsrRole(UserRole userRole) {
        if (null != userRole) {
            if (0 == mapper.updateUsrRole(userRole)) {
                return 1 == getMapper().insert(userRole);
            } else {
                return true;
            }
        }
        return false;
    }


    @Override
    public boolean updateByPrimaryKeySelective(UserRole record) {
        if (null != record) {
            if (record.getId() != null)
                return 1 == getMapper().updateByPrimaryKeySelective(record);
            else {
                return 1 == getMapper().insert(record);
            }
        }
        return false;
    }

    @Override
    public List<Integer> selectUserIdsByRoles(List<Integer> roleIds) {
        return mapper.selectUserIdsByRoles(roleIds);
    }
}
