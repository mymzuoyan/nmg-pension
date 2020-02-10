package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.MD5;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.service.SysRoleService;
import com.fedtech.pension.sys.service.UserLogService;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/5/11
 */
@Controller
public class PageLoginController extends BaseController {

    @Reference(version = "1.0.0")
    private UserLogService userLogService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private SysRoleService sysRoleService;

    @RequestMapping(value = {"/login"})
    public String login(User user, HttpServletRequest request, HttpSession session) {
        //登录失败返回登录页面
        String resultPageURL = VIEW_PREFIX + "home";
        if (null == user || StringUtils.isEmpty(user.getLogin_name()) || StringUtils.isEmpty(user.getPass_word())) {
            return resultPageURL;
        }
        //判断权限
        List<String> roleList;
        User filter = userService.selectByLoginName(user.getLogin_name());
        if (!ObjectUtils.isNotNull(filter)) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名不存在");
            return resultPageURL;
        }
        roleList = sysRoleService.getRoleList(filter.getUid());
        if (!roleList.contains(RoleType.ZuAdmin.getValue()) && !roleList.contains(RoleType.ServiceObject.getValue())) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名不存在");
            return resultPageURL;
        }
        user.setPass_word(MD5.MD5Encode(user.getPass_word()));
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLogin_name(), user.getPass_word());
        token.setRememberMe(true);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);
        } catch (IncorrectCredentialsException ice) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "密码不正确");
        } catch (UnknownAccountException uae) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名不存在");
        } catch (LockedAccountException lae) {
            logger.info("对用户[" + user.getLogin_name() + "]进行登录验证..验证未通过,账户已锁定");
            request.setAttribute(Keys.MESSAGE_LOGIN, "账户已锁定");
        } catch (ExcessiveAttemptsException eae) {
            logger.info("对用户[" + user.getLogin_name() + "]进行登录验证..验证未通过,错误次数过多");
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名或密码错误次数过多");
        } catch (AuthenticationException ae) {
            ae.printStackTrace();
            logger.info("对用户[" + user.getLogin_name() + "]进行登录验证..验证未通过,堆栈轨迹如下");
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名或密码不正确");
        }
        // 验证是否登录成功
        if (currentUser.isAuthenticated()) {
            UserLog log = new UserLog();
            Integer uid = currentUser().getUid();
            log.setUid(uid);
            log.setAction("login()");
            log.setDescription("用户登陆");
            log.setCreateTime(new Date());
            log.setIp(request.getRemoteAddr());
            userLogService.insert(log);
            return "redirect:/home.html";
        } else {
            token.clear();
            return resultPageURL;
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        Integer uid = currentUser().getUid();
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout();
            UserLog log = new UserLog();
            log.setUid(uid);
            log.setAction("logout()");
            log.setDescription("用户注销");
            log.setCreateTime(new Date());
            log.setIp(request.getRemoteAddr());
            userLogService.insert(log);
        }
        return "redirect:/home.html";
    }

}
