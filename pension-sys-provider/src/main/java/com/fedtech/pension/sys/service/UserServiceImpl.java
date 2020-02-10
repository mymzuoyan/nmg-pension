package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.sys.entity.SysPermission;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.fedtech.commons.utils.ObjectUtils.isNotNull;


/**
 * Created by Gong on 2016/5/31.
 */
@Service(version = "1.0.0", interfaceClass = UserService.class)
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Reference(version = "1.0.0")
    private SysPermissionService sysPermissionService;

    @Override
    public BaseMapper<User> getMapper() {
        return userMapper;
    }

    @Override
    public User login(String loginName, String loginPwd) {
        return userMapper.selectByLoginNameandPwd(loginName, loginPwd);
    }

    @Override
    public User selectByServiceOrgId(Integer serviceOrgId) {
        return userMapper.selectByServiceOrgId(serviceOrgId);
    }

    @Override
    public User getSimpleInfo(Long uid) {
        return userMapper.selectSimpleInfo(uid);
    }

    @Override
    public User selectByLoginName(String loginName) {
        System.out.println(sysPermissionService.count(new SysPermission()));
        return userMapper.selectByLoginName(loginName);
    }

    @Override
    public User loginApp(String loginName, String loginPwd) {
        return userMapper.selectAppByLoginNameandPwd(loginName, loginPwd);
    }

    @Override
    public List<User> selectSimpleUserByIds(List<Long> userIds) {
        return userMapper.selectSimpleUserInfo(userIds);
    }

    @Override
    public User selectByAuthCode(String authCode) {
        return userMapper.selectByAuthCode(authCode);
    }

    @Override
    public boolean updateUsers(Integer status, List<Integer> userIds) {
        if (isNotNull(userIds))
            return userMapper.updateUsers(status, userIds) > 0;
        return false;
    }

    @Override
    public Integer updateUserIdCardNoById(Integer uid, String userIdCardNo) {
        return userMapper.updateUserIdCardNoById(uid, userIdCardNo);
    }

    /**
     * 插入新注册信息同时插入普通用户角色
     *
     * @param user
     * @return
     */
    @Override
    public boolean insertOrRole(User user) {
        if (insert(user) && ObjectUtils.isNotNull(user.getUid()))
            return userMapper.insertOrRole(user.getUid());
        return false;
    }

    @Override
    public PageResponse<User> selectPageListByRoleId(User filter, PageRequest pageRequest, Integer roleId) {
        PageResponse<User> pageResponse = new PageResponse<User>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(userMapper.countUserByRoleId(roleId, filter));
        pageResponse.setRecordsFiltered(pageResponse.getRecordsTotal());
        pageResponse.setData(userMapper.selectPageListByRoleId(filter, pageRequest, roleId));
        return pageResponse;
    }


    @Override
    public List<User> selectPageListByRoleId(User filter, Integer pageNum, Integer length, Integer roleId) {
        PageRequest pageRequest = new PageRequest();
        pageRequest.setStart((pageNum - 1) * length);
        pageRequest.setLength(length);
        return userMapper.selectPageListByRoleId(filter, pageRequest, roleId);
    }

    @Override
    public List<User> selectAllUserByRole(User t, Integer roleId) {
        return userMapper.selectAllUserByRole(t, roleId);
    }

    @Override
    public List<Integer> selectAllUserIdByRole(User t, Integer roleId) {
        return userMapper.selectAllUserIdByRole(t, roleId);
    }

    @Override
    public List<User> selectAllUserByRoles(User t, List<Integer> roleIds) {
        return userMapper.selectAllUserByRoles(t, roleIds);
    }

    @Override
    public List<Integer> selectAllUserIdByRoles(User t, List<Integer> roleIds) {
        return userMapper.selectAllUserIdsByRoles(t, roleIds);
    }

    @Override
    public List<User> selectUserByTaskId(Integer taskId) {
        return userMapper.selectUserByTaskId(taskId);
    }

    @Override
    public int judgeNickName(String nick_name) {
        return userMapper.judgeNickName(nick_name);
    }

    @Override
    public User selectInfoAndTaskCount(Integer id, Integer roleId) {
        User user = new User();
        if (RoleType.ZuAdmin.getId() == roleId.intValue()) {
            user = userMapper.selectZuZhiInfoAndTaskCount(id);
            return user;
        } else if (RoleType.ServiceUser.getId() == roleId.intValue()) {
            user = userMapper.selectUserFuwuInfoAndTaskCount(id);
            return user;
        } else if (RoleType.ServiceObject.getId() == roleId.intValue()) {
            user = userMapper.selectObjectInfoAndTaskCount(id);
            return user;
        }
        return null;
    }

    @Override
    public User selectByLoginNameAndRole(String loginName, Integer roleId) {
        return userMapper.selectByLoginNameAndRole(loginName, roleId);
    }

    @Override
    public String selectLastZuAdmin(String areaCode, Integer roleId) {
        return userMapper.selectLastZuAdmin(areaCode, roleId);
    }

    @Override
    public int countUserByRoleId(Integer roleId, User user) {
        return userMapper.countUserByRoleId(roleId, user);
    }

    @Override
    public List<User> selectFuwuUserByOrgId(Integer serviceOrgId, String serviceType, Integer pageNum, Integer length) {
        PageRequest pageRequest = new PageRequest();
        if (ObjectUtils.isNotNull(pageNum) && ObjectUtils.isNotNull(length)) {
            if (pageNum > 0 && length > 0) {
                pageRequest.setStart((pageNum - 1) * length);
                pageRequest.setLength(length);
            }
        }
        return userMapper.selectFuwuUserByOrgId(serviceOrgId, serviceType, pageRequest);
    }

    @Override
    public List<User> selectByLoginNamesAndRoleId(List<String> names, Integer roleId) {
        return userMapper.selectByLoginNamesAndRoleId(names, roleId);
    }

    @Override
    public boolean updateUsersByServiceOrgIds(Integer status, List<Integer> serviceOrgIds) {
        return userMapper.updateUsersByServiceOrgIds(status, serviceOrgIds) >= 0;
    }


    @Override
    public PageResponse<User> selectPageListByRoleIds(User t, PageRequest pageRequest, List<Integer> roleIds) {
        PageResponse<User> pageResponse = new PageResponse<User>();
        pageResponse.setDraw(pageRequest.getDraw());
        pageResponse.setRecordsTotal(userMapper.countUserByRoleIds(roleIds, t));
        pageResponse.setRecordsFiltered(pageResponse.getRecordsTotal());
        pageResponse.setData(userMapper.selectPageListByRoleIds(t, pageRequest, roleIds));
        return pageResponse;
    }


    @Override
    public boolean updateUserServiceOrgName(Integer serviceOrgId, String serviceOrgName) {
        if (ObjectUtils.isNotNull(serviceOrgId) && ObjectUtils.isNotNull(serviceOrgName)) {
            return userMapper.updateUserServiceOrgName(serviceOrgId, serviceOrgName) > 0;
        }
        return false;
    }


    @Override
    public boolean insertSomeUser(List<User> users) {
        return userMapper.insertSomeUser(users) > 0;
    }

    /**
     * 通过loginName查询uid
     *
     * @param loginName
     * @return
     */
    @Override
    public User selectUidByLoginName(String loginName) {
        return userMapper.selectUidByLoginName(loginName);
    }


    @Override
    public boolean approved(User user) {
        return userMapper.approved(user) > 0;
    }

    @Override
    public List<User> selectUsers() {
        return userMapper.selectUsers();
    }

    @Override
    public String selectUidByNickName(String nick_name) {
        return userMapper.selectUidByNickName(nick_name);
    }
}
