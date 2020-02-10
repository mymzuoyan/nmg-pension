package com.fedtech.pension.sys.service;


import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.commons.base.BaseService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Gong
 * @date 2016/5/31
 */
public interface UserService extends BaseService<User> {

    /**
     * 根据用户名称和密码查询
     *
     * @param loginName
     * @param loginPwd
     * @return
     */
    User login(String loginName, String loginPwd);

    /**
     * 根据serviceOrgId获取信息
     * @param serviceOrgId
     * @return
     */
    User selectByServiceOrgId(Integer serviceOrgId);

    /**
     * 获取用户简要信息
     *
     * @param uid
     * @return
     */
    User getSimpleInfo(Long uid);

    /**
     * 根据用户名查询
     *
     * @param loginName
     * @return
     */
    User selectByLoginName(String loginName);

    /**
     * 根据用户名称和密码查询
     *
     * @param loginName
     * @param loginPwd
     * @return
     */
    User loginApp(String loginName, String loginPwd);


    /**
     * 根据用户名和角色id查询
     *
     * @param loginName
     * @param roleId
     * @return
     */
    User selectByLoginNameAndRole(String loginName, Integer roleId);

    /**
     * 根据用户 id 批量查询
     *
     * @param userIds
     * @return
     */
    List<User> selectSimpleUserByIds(List<Long> userIds);

    /**
     * 根据用户AuthCode查询
     *
     * @param authCode
     * @return
     */
    User selectByAuthCode(String authCode);

    /**
     * 更新多个用户
     *
     * @param status
     * @param userIds
     * @return
     */
    boolean updateUsers(Integer status, List<Integer> userIds);

    /**
     * 根据用户id更改userIdCardNo
     *
     * @param uid
     * @param userIdCardNo
     * @return
     */
    Integer updateUserIdCardNoById(Integer uid, String userIdCardNo);

    /**
     * 插入新注册信息同时插入普通用户角色
     *
     * @param user
     * @return
     */
    boolean insertOrRole(User user);

    /**
     * 分页获取特定角色的用户
     *
     * @param t
     * @param pageRequest
     * @param roleId
     * @return
     */
    PageResponse<User> selectPageListByRoleId(User t, PageRequest pageRequest, Integer roleId);

    /**
     * 分页获取特定角色的用户
     *
     * @param t
     * @param pageNum
     * @param length
     * @param roleId
     * @return
     */
    List<User> selectPageListByRoleId(User t, Integer pageNum, Integer length, Integer roleId);

    /**
     * 根据角色获取所有人员
     *
     * @param roleId
     * @return
     */
    List<User> selectAllUserByRole(User t, Integer roleId);

    /**
     * 根据角色获取所有人员
     *
     * @param roleId
     * @return
     */
    List<Integer> selectAllUserIdByRole(User t, Integer roleId);

    /**
     * 根据多个角色获取所有人员
     *
     * @param roleIds
     * @return
     */
    List<User> selectAllUserByRoles(User t, List<Integer> roleIds);


    /**
     * 分页获取特定角色的用户
     *
     * @param t
     * @param pageRequest
     * @param roleId
     * @return
     */
    PageResponse<User> selectPageListByRoleIds(User t, PageRequest pageRequest, List<Integer> roleIds);

    /**
     * 根据多个角色获取所有人员
     *
     * @param roleIds
     * @return
     */
    List<Integer> selectAllUserIdByRoles(User t, List<Integer> roleIds);

    /**
     * 获取工单的接收人员
     *
     * @param taskId
     * @return
     */
    List<User> selectUserByTaskId(Integer taskId);

    int judgeNickName(String nick_name);

    User selectInfoAndTaskCount(Integer id, Integer roleId);

    /**
     * 获取以areaCode开头的最新的loginName
     *
     * @param areaCode
     * @return
     */
    String selectLastZuAdmin(String areaCode, Integer roleId);

    /**
     * 获取某角色的人员数量
     *
     * @param roleId
     * @param user
     * @return
     */
    int countUserByRoleId(Integer roleId, User user);

    /**
     * 获取服务人员列表
     *
     * @param serviceOrgId
     * @return
     */
    List<User> selectFuwuUserByOrgId(Integer serviceOrgId, String serviceType, Integer pageNum, Integer length);


    /**
     * 根据用户名和角色来获取
     *
     * @param names
     * @param roleId
     * @return
     */
    List<User> selectByLoginNamesAndRoleId(List<String> names, Integer roleId);

    /**
     * 更新用户
     *
     * @param status
     * @param serviceOrgIds
     * @return
     */
    boolean updateUsersByServiceOrgIds(Integer status, List<Integer> serviceOrgIds);

    /**
     * 更新用户组织名称
     *
     * @param serviceOrgId
     * @param serviceOrgName
     * @return
     */
    boolean updateUserServiceOrgName(Integer serviceOrgId, String serviceOrgName);


    /**
     * 批量插入
     *
     * @param users
     * @return
     */
    boolean insertSomeUser(List<User> users);

    /**
     * 根据用户名查询uid
     *
     * @param loginName
     * @return
     */
    User selectUidByLoginName(String loginName);

    /**
     * 平台管理用户审核
     *
     * @param user
     * @return
     */
    boolean approved(User user);

    /**
     * 删除服务组织用户信息
     * @param serviceOrgId
     * @return
     */
    //boolean deleteByServiceOrgId(Integer serviceOrgId);
    /**
     * 所有用户
     */
    List<User> selectUsers();

    /**
     * 根据nick_name获取Uid
     * @param nick_name
     * @return
     */
    String selectUidByNickName(String nick_name);
}
