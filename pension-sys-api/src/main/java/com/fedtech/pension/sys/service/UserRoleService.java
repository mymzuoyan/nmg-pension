package com.fedtech.pension.sys.service;


import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.commons.base.BaseService;

import java.util.List;

/**
 * Created by GQ on 16/5/17.
 */
public interface UserRoleService extends BaseService<UserRole>{

    /**
     * 批量插入
     * @param userRoleList
     * @return
     */
    int insertSomeUserRole(List<UserRole> userRoleList);

    /**
     * 根据角色id删除
     * @param id
     * @return
     */
    boolean deleteByRoleID(Integer id);

    /**
     * 根据userId来获取角色
     * @param userId
     * @return
     */
    List<UserRole> getUserRolesByUserId(Integer userId);

    /**
     * 更新
     * @param userRole
     * @return
     */
    boolean  updateUsrRole(UserRole userRole);


    /**
     * 根据角色获取用户id
     * @param roleIds
     * @return
     */
    List<Integer> selectUserIdsByRoles(List<Integer> roleIds);
}
