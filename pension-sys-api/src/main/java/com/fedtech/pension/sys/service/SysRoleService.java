package com.fedtech.pension.sys.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;

import java.util.List;
import java.util.Map;

/**
 * Created by GQ on 16/5/12.
 */
public interface SysRoleService extends BaseService<SysRole> {

    /**
     * 获取用户角色名称列表
     *
     * @param userId
     * @return
     */
    List<String> getRoleList(Integer userId);

    /**
     * 批量保存用户角色集合
     *
     * @param userRoleList
     * @return
     */
    boolean insertSomeUserRole(List<UserRole> userRoleList);


    /**
     * 获取用户所有角色Id
     *
     * @param userId
     * @return
     */
    List<UserRole> getUserRolesByUserId(Integer userId);

    /**
     * 根据多个用户id获取角色名称
     * @param users
     * @return
     */
    Map<Integer,String> getRoleNamesByUids(List<User> users);
}


