package com.fedtech.pension.sys.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.sys.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author GQ
 * @date 16/5/30
 * Modified by Gong on 16/6/31
 */
public interface UserMapper extends BaseMapper<User> {
    /**
     * 根据login_name和password来获取用户
     *
     * @param login_name
     * @param pass_word
     * @return
     */
    User selectByLoginNameandPwd(String login_name, String pass_word);

    /**
     * 根据uid获取人员信息
     *
     * @param uid
     * @return
     */
    User selectSimpleInfo(Long uid);

    /**
     * 根据用户id更改userIdCardNo
     *
     * @param uid
     * @param userIdCardNo
     * @return
     */
    Integer updateUserIdCardNoById(@Param("uid")Integer uid, @Param("userIdCardNo")String userIdCardNo);

    /**
     * 根据serviceOrgId获取信息
     * @param serviceOrgId
     * @return
     */
    User selectByServiceOrgId(@Param("serviceOrgId")Integer serviceOrgId);


    /**
     * 根据login_name和password来获取用户
     *
     * @param login_name
     * @param pass_word
     * @return
     */
    User selectAppByLoginNameandPwd(@Param("login_name") String login_name,@Param("pass_word") String pass_word);

    /**
     * 根据用户名查询
     *
     * @param loginName
     * @return
     */
    User selectByLoginName(@Param("loginName") String loginName);


    /**
     * 根据用户名和角色id查询
     *
     * @param loginName
     * @param roleId
     * @return
     */
    User selectByLoginNameAndRole(@Param("loginName") String loginName, @Param("roleId") Integer roleId);

    /**
     * 根据用户id获取用户列表
     *
     * @param userIds
     * @return
     */
    List<User> selectSimpleUserInfo(List<Long> userIds);

    /**
     * 根据验证码查询
     *
     * @param authCode
     * @return
     */
    User selectByAuthCode(@Param("authCode") String authCode);


    int updateUsers(@Param("status") Integer status, @Param("userIds") List<Integer> userIds);

    /**
     * 插入新注册信息同时插入普通用户角色
     *
     * @param uid
     * @return
     */
    boolean insertOrRole(@Param("uid") Integer uid);

    /**
     * 根据角色分页查询
     *
     * @param user
     * @param pageRequest
     * @param roleId
     * @return
     */
    List<User> selectPageListByRoleId(@Param("filter") User user, @Param("page") PageRequest pageRequest, @Param("roleId") Integer roleId);

    /**
     * 获取某一个角色的人员数量
     *
     * @param roleId
     * @param user
     * @return
     */
    int countUserByRoleId(@Param("roleId") Integer roleId, @Param("filter") User user);

    /**
     * 根据角色获取所有人员
     *
     * @param t
     * @param roleId
     * @return
     */
    List<User> selectAllUserByRole(@Param("filter") User t, @Param("roleId") Integer roleId);

    /**
     * 根据角色获取所有人员id
     *
     * @param t
     * @param roleId
     * @return
     */
    List<Integer> selectAllUserIdByRole(@Param("filter") User t, @Param("roleId") Integer roleId);


    /**
     * 根据多个角色获取所有人员
     *
     * @param t
     * @param roleIds
     * @return
     */
    List<User> selectAllUserByRoles(@Param("filter") User t, @Param("roleIds") List<Integer> roleIds);

    /**
     * 根据多个角色获取所有人员ID
     *
     * @param t
     * @param roleIds
     * @return
     */
    List<Integer> selectAllUserIdsByRoles(@Param("filter") User t, @Param("roleIds") List<Integer> roleIds);


    /**
     * 获取多个角色的人员数量
     *
     * @param roleIds
     * @param user
     * @return
     */
    int countUserByRoleIds(@Param("roleIds") List<Integer> roleIds, @Param("filter") User user);

    /**
     * 根据角色分页查询
     *
     * @param user
     * @param pageRequest
     * @param roleId
     * @return
     */
    List<User> selectPageListByRoleIds(@Param("filter") User user, @Param("page") PageRequest pageRequest, @Param("roleIds") List<Integer> roleId);


    /**
     * 获取工单的接收人员
     *
     * @param taskId
     * @return
     */
    List<User> selectUserByTaskId(@Param("taskId") Integer taskId);

    /**
     * 判断昵称
     *
     * @param nick_name
     * @return
     */
    int judgeNickName(@Param("nick_name") String nick_name);

    /**
     * 获取用户信息和工单数量 -组织
     *
     * @param id
     * @return
     */
    User selectZuZhiInfoAndTaskCount(@Param("uid") Integer id);


    /**
     * 获取用户信息和工单数量 -服务
     *
     * @param id
     * @return
     */
    User selectUserFuwuInfoAndTaskCount(@Param("uid") Integer id);


    /**
     * 获取用户信息和工单数量 -服务对象
     *
     * @param id
     * @return
     */
    User selectObjectInfoAndTaskCount(@Param("uid") Integer id);


    /**
     * 获取以areaCode开头的最新的loginName
     *
     * @param areaCode
     * @param roleId
     * @return
     */
    String selectLastZuAdmin(@Param("areaCode") String areaCode, @Param("roleId") Integer roleId);


    /**
     * 获取服务人员列表
     *
     * @param serviceOrgId
     * @param serviceType
     * @param pageRequest
     * @return
     */
    List<User> selectFuwuUserByOrgId(@Param("serviceOrgId") Integer serviceOrgId, @Param("serviceType") String serviceType, @Param("page") PageRequest pageRequest);

    /**
     * 根据用户名和角色来获取
     *
     * @param names
     * @param roleId
     * @return
     */
    List<User> selectByLoginNamesAndRoleId(@Param("names") List<String> names, @Param("roleId") Integer roleId);


    /**
     * 根据组织id修改用户状态
     *
     * @param status
     * @param serviceOrgIds
     * @return
     */
    int updateUsersByServiceOrgIds(@Param("status") Integer status, @Param("serviceOrgIds") List<Integer> serviceOrgIds);


    /**
     * 更新用户组织名称
     *
     * @param serviceOrgId
     * @param serviceOrgName
     * @return
     */
    int updateUserServiceOrgName(@Param("serviceOrgId") Integer serviceOrgId, @Param("serviceOrgName") String serviceOrgName);


    /**
     * 批量插入
     *
     * @param users
     * @return
     */
    int insertSomeUser(@Param("users") List<User> users);

    /**
     * 通过loginName查询uid
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
    int approved(@Param("user") User user);
    /**
     * 获取所有用户
     */
    List<User> selectUsers();

    /**
     * 根据nick_name获取Uid
     * @param nick_name
     * @return
     */
    String selectUidByNickName(@Param("nick_name")String nick_name);
}
