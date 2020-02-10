package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by GQ on 16/5/17.
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {
    /**
     * 批量保存用户角色集合
     *
     * @param userRoleList
     * @return
     */
    int insertSomeUserRole(@Param("userRoles") List<UserRole> userRoleList);

    /**
     * 删除用户角色关系
     *
     * @param roleId
     * @return
     */
    int deleteByRoleID(Integer roleId);

    /**
     * 删除用户角色关系
     *
     * @param userID
     * @return
     */
    int deleteByUserID(Integer userID);

    /**
     * 获取用户角色关系
     *
     * @param userId
     * @return
     */
    List<UserRole> getUserRolesByUserId(Integer userId);


    /**
     * 更新
     *
     * @param userRole
     * @return
     */
    int updateUsrRole(UserRole userRole);

    /**
     * 根据角色获取用户id
     *
     * @param roleIds
     * @return
     */
    List<Integer> selectUserIdsByRoles(@Param("roleIds") List<Integer> roleIds);

}
