package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.service.MonitorService;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.*;
import com.fedtech.pension.sys.service.*;
import com.fedtech.web.shiro.session.RedisSessionDao;
import com.google.common.base.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by Gong on 2016/6/15.
 */
@Controller
@RequestMapping("/admin")
public class LoginController extends BaseController {
    @Reference(version = "1.0.0")
    public SysRoleService roleService;
    @Reference(version = "1.0.0")
    private MonitorService monitorService;
    @Reference(version = "1.0.0")
    private UserLogService userLogService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private UserService userService;
    @Autowired
    private RedisSessionDao sessionDAO;
    @Reference(version = "1.0.0")
    private ExceptionInfoService exceptionInfoService;

    //
    @RequestMapping(value = {"signin", "login", ""})
    @SystemControllerLog(description = "用户登录")
    public String login(User user, String codevalidate, HttpServletRequest request, HttpSession session) {
        //登录失败返回登录页面
        String resultPageURL = ADMIN_PREFIX + "login";
        if (null == user || StringUtils.isEmpty(user.getLogin_name()) || StringUtils.isEmpty(user.getPass_word())) {
            return resultPageURL;
        }
        String code = (String) session.getAttribute("codeValidate");
        if (codevalidate == null || !codevalidate.equalsIgnoreCase(code)) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "验证码错误");
            return resultPageURL;
        }

        UsernamePasswordToken token = new UsernamePasswordToken(user.getLogin_name(), user.getPass_word());
        token.setRememberMe(true);
        Subject currentUser = SecurityUtils.getSubject();
        try {
            currentUser.login(token);
        } catch (UnknownAccountException uae) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名不存在");
        } catch (IncorrectCredentialsException ice) {
            request.setAttribute(Keys.MESSAGE_LOGIN, "密码不正确");
        } catch (LockedAccountException lae) {
            logger.info("对用户[" + user.getLogin_name() + "]进行登录验证..验证未通过,账户已锁定");
            request.setAttribute(Keys.MESSAGE_LOGIN, "账户已锁定");
        } catch (ExcessiveAttemptsException eae) {
            logger.info("对用户[" + user.getLogin_name() + "]进行登录验证..验证未通过,错误次数过多");
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名或密码错误次数过多");
        } catch (AuthenticationException ae) {
            ae.printStackTrace();
            // 通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
            logger.info("对用户[" + user.getLogin_name() + "]进行登录验证..验证未通过,堆栈轨迹如下");
            request.setAttribute(Keys.MESSAGE_LOGIN, "用户名或密码不正确");
        }
        // 验证是否登录成功
        if (currentUser.isAuthenticated()) {
            //判断用户角色
//            if (currentUser.hasRole(RoleType.MonitorAdmin.getValue()) || currentUser.hasRole(RoleType.MonitorUser.getValue())) {
////                //坐席人员
//                Monitor monitor = monitorService.selectByUserId(currentUser().getUid());
//                if (Strings.isNullOrEmpty(monitor.getExtension())) {
//                    request.setAttribute(Keys.MESSAGE_LOGIN, "该坐席的分机号为空");
//                    token.clear();
//                    return resultPageURL;
//                }
//                if (Strings.isNullOrEmpty(monitor.getQueueName())) {
//                    request.setAttribute(Keys.MESSAGE_LOGIN, "该坐席的队列号为空");
//                    token.clear();
//                    return resultPageURL;
//                }
//                String param = "agentid=" + user.getLogin_name() + "&interface=SIP/" + monitor.getExtension() + "&queue=" + monitor.getQueueName();
//                String sr = HttpRequest.sendPost(Keys.IP + "//cti/lt_agent_login.php", param);
//                if ("1".equals(sr) || "0".equals(sr)) {
//                    //改变状态
//                    param = "agentid=" + user.getLogin_name() + "&newstate=0";
//                    String re = HttpRequest.sendPost(Keys.IP + "//cti/lt_agent_set_agent_state.php", param);
//                    if (!"0".equals(re)) {
//                        request.setAttribute(Keys.MESSAGE_LOGIN, "坐席登陆失败");
//                        token.clear();
//                        return resultPageURL;
//                    }
//                } else {
//                    request.setAttribute(Keys.MESSAGE_LOGIN, "坐席登陆失败");
//                    token.clear();
//                    return resultPageURL;
//                }
//            } else if (currentUser.hasRole(RoleType.ServiceUser.getValue())) {
//                request.setAttribute(Keys.MESSAGE_LOGIN, "您没有后台权限");
//                token.clear();
//                return resultPageURL;
//            }
            return "redirect:/admin/index.html";
        } else {
            token.clear();
            return resultPageURL;
        }
    }

    @RequestMapping(value = {"beforeLogin"})
    @ResponseBody
    public JsonResult beforeLogin(User user, String codevalidate, HttpSession session) {
        JsonResult result = new JsonResult();
        if (user.getLogin_name() == null || user.getPass_word() == null) {
            result.markError("请输入用户名或密码");
            return result;
        }
        //验证码验证
        String code = (String) session.getAttribute("codeValidate");
        if (codevalidate == null || !codevalidate.equalsIgnoreCase(code)) {
            result.markError("验证码错误");
            return result;
        }
        User correct = userService.selectByLoginName(user.getLogin_name());
        if (ObjectUtils.isNotNull(correct)) {
            if (correct.getPass_word().equals(user.getPass_word())) {
                result.markSuccess("可以登陆", 1);
            } else {
                result.markError("密码错误");
            }
        } else {
            result.markError("不存在该用户名");
        }
        return result;
    }


    @RequestMapping(value = {"isLogin"})
    @ResponseBody
    public int getIsLogin(@RequestParam("name") String name) {
        //判断是否在线
        if (isLogin(name)) {
            return 1;
        } else {
            return 0;
        }
    }


    @RequestMapping("index.html")
    public String showIndex(Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            UserLog userLog = new UserLog();
            userLog.setUid(currentUser().getUid());
            userLog.setDescription("更新服务组织信息");// 需求：组织一直不更新服务组织信息，就一直提示弹出框
            PageResponse<UserLog> dataTable1 = userLogService.selectPageList(userLog, new PageRequest());
            // 未修改组织信息
            if (dataTable1.getData().isEmpty() || dataTable1.getData().size() == 0) {
                model.addAttribute("serOrgId", currentUser().getServiceOrgId());
                model.addAttribute("serOrgName", currentUser().getServiceOrgName());
                model.addAttribute("oneLogin", "oneLogin");
            }
        }
        List<UserRole> userRoles = roleService.getUserRolesByUserId(currentUser().getUid());
        if (userRoles.size() > 0) {
            SysRole sysRole = roleService.selectByPrimaryKey(userRoles.get(0).getRoleId());
            model.addAttribute("userRole", sysRole);
        }
//        Monitor monitor = monitorService.selectByUserId(currentUser().getUid());
//        if (ObjectUtils.isNotNull(monitor)) {
//            model.addAttribute("extension", monitor.getExtension());
//            model.addAttribute("queueName", monitor.getQueueName());
//            model.addAttribute("password", monitor.getPassword());
//            model.addAttribute("pstnnumber", monitor.getPstnnumber());
//        }
        return ADMIN_PREFIX + "index";
    }

    @RequestMapping("unauth")
    public String unauth() {
        return UNAUTH_PAGE;
    }


    @RequestMapping("kickou")
    public String kickou(HttpServletRequest request) {
        request.setAttribute(Keys.MESSAGE_LOGIN, "账号已在异地登录");
        return ADMIN_PREFIX + "login";
    }


    @RequestMapping(value = "logout")
    public String logout(HttpServletRequest request) {
        Integer uid = currentUser().getUid();
        String name = currentUser().getLogin_name();
        Subject subject = SecurityUtils.getSubject();
        if (subject.hasRole(RoleType.MonitorUser.getValue()) || subject.hasRole(RoleType.MonitorAdmin.getValue())) {
//            坐席退出
//            Monitor monitor = monitorService.selectByUserId(currentUser().getUid());
//            if (ObjectUtils.isNotNull(monitor)) {
//                String param = "&interface=SIP/" + monitor.getExtension() + "&queue=" + monitor.getQueueName();
//                HttpRequest.sendPost(Keys.IP + "//cti/lt_agent_logoff.php", param);
//            }
        }
        if (subject.isAuthenticated()) {
            subject.logout();
        }
        //记录注销
        UserLog log = new UserLog();
        log.setUid(uid);
        log.setAction("logout()");
        log.setDescription("用户注销");
        log.setCreateTime(new Date());
        log.setIp(request.getRemoteAddr());
        userLogService.insert(log);
        return "redirect:" + ADMIN_PREFIX + "login.jsp";
    }

    @RequestMapping(value = {"login.html"})
    public String showLogin() {
        return ADMIN_PREFIX + "login";
    }


    @RequestMapping(value = {"home"})
    public String showHome(Model model) {
        Subject subject = getCurrentUser();
        if (subject.hasRole(RoleType.ZuAdmin.getValue())) {
            return ADMIN_PREFIX + "home_zuzhi";
        } else if (subject.hasRole(RoleType.JgAdmin.getValue())) {
            return ADMIN_PREFIX + "home_org";
        } else if (subject.hasRole(RoleType.MonitorUser.getValue())) {
            return ADMIN_CALL_PREFIX + "call_list";
        } else {
            Area area = areaService.selectByPrimaryKey(currentUser().getAreaId());
            model.addAttribute("area", area);
            return ADMIN_PREFIX + "home";
        }
    }

    /**
     * 错误页面
     *
     * @return
     */
    @RequestMapping(value = {"error.html"})
    public String showError(Exception ex) {
        ExceptionInfo exceptionInfo = new ExceptionInfo();
        exceptionInfo.setLoginName(currentUser().getLogin_name());
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        exceptionInfo.setContent(sw.toString());
        exceptionInfo.setCreateTime(new Date());
        exceptionInfoService.insert(exceptionInfo);
        return "/error";
    }

    /**
     * 判断是否已登陆
     *
     * @param loginName
     * @return
     */
    private boolean isLogin(String loginName) {
        boolean b = false;
        //判断是否已登陆
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            User loginUser = (User) session.getAttribute(Keys.LOGIN_USER);//获得session中已经登录用户的名字
            if (ObjectUtils.isNotNull(loginUser) && loginName.equals(loginUser.getLogin_name())) {  //这里的username也就是当前登录的username
                b = true;
            }
        }
        return b;
    }


}