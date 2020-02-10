package com.fedtech.pension.sys.mapper;


import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * @author Gong
 * @date 16/7/26
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 获取角色值集合
     *
     * @param userId
     * @return
     */
    List<String> getRoleList(Integer userId);

    /**
     * 获取用户的角色
     * @param users
     * @return
     */
    List<Map<String, Object>> getRoleNamesByUids(@Param("users") List<User> users);

}
