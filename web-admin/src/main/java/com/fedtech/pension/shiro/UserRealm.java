package com.fedtech.pension.shiro;

import com.fedtech.commons.utils.Keys;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.service.SysPermissionService;
import com.fedtech.pension.sys.service.SysRoleService;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.web.shiro.session.RedisSessionDao;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.List;


/**
 * @author gengqiang
 */
public class UserRealm extends AuthorizingRealm {

    static Logger logger = LoggerFactory.getLogger(UserRealm.class);

    @Autowired
    private UserService userService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysPermissionService sysPermissionService;
    @Autowired
    private RedisSessionDao redisSessionDao;

    /**
     * 为当前登录的Subject授予角色和权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        logger.info("doGetAuthorizationInfo...");
        //获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
        String currentUsername = (String) super.getAvailablePrincipal(principals);
        List<String> roleList;
        List<String> permissionList;
        //从数据库中获取当前登录用户的详细信息
        User user = userService.selectByLoginName(currentUsername);
        roleList = sysRoleService.getRoleList(user.getUid());
        permissionList = sysPermissionService.getPermNamesByUserId(user.getUid());
        //为当前用户设置角色和权限
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        if (currentUsername != null) {
            simpleAuthorInfo.addRoles(roleList);
            simpleAuthorInfo.addStringPermissions(permissionList);
            return simpleAuthorInfo;
        }
        return null;
    }


    /**
     * 验证当前登录的Subject
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {

        //获取基于用户名和密码的令牌
        //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
        //两个token的引用都是一样的
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.selectByLoginName(token.getUsername());
        if (null != user) {
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getLogin_name(), user.getPass_word(), this.getName());
            if (user.getPass_word().equals(String.valueOf(token.getPassword()))) {
                this.setSession(user);
            }
            return authcInfo;
        } else {
            return null;
        }
    }


    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     */
    private void setSession(Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Serializable sessionId = currentUser.getSession().getId();
            Session session = redisSessionDao.readSession(sessionId);
            session.setTimeout(2 * 60 * 60 * 1000);
            if (null != session) {
                List<UserRole> roleList = sysRoleService.getUserRolesByUserId(((User) value).getUid());
                if (roleList.size() > 0) {
                    SysRole sysRole = sysRoleService.selectByPrimaryKey(roleList.get(0).getRoleId());
                    session.setAttribute(Keys.LOGIN_ROLE, sysRole);
                }
                session.setAttribute(Keys.LOGIN_USER, value);
            }
            redisSessionDao.updateSession(session);
        }
    }


}
