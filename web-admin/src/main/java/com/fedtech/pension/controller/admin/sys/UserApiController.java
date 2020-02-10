package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.*;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.commons.utils.MD5;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.CallInfo;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.service.CallInfoService;
import com.fedtech.pension.call.service.MonitorService;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.elderly.service.ElderlyOrderAppService;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.power.entity.Bill;
import com.fedtech.pension.power.service.BillService;
import com.fedtech.pension.redis.RedisUserStateUtil;
import com.fedtech.pension.sys.entity.*;
import com.fedtech.pension.sys.service.*;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.service.TaskPlanService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import com.fedtech.pension.task.service.UserLinkElderService;
import com.fedtech.pension.volunteer.entity.Volunteer;
import com.fedtech.web.shiro.session.RedisSessionDao;
import com.google.common.base.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.fedtech.commons.enums.RoleType.ServiceUser;
import static com.fedtech.commons.enums.RoleType.ZuAdmin;


/**
 * @author gengqiang
 * @date 2016/9/8
 */
@Controller
@RequestMapping("/admin/api/user/")
public class UserApiController extends BaseController {
    protected Logger logger = LoggerFactory.getLogger(UserApiController.class);

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private SysRoleService sysRoleService;

    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private ServiceOrgAssessmentService serviceOrgAssessmentService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Autowired
    private RedisSessionDao sessionDAO;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private TaskPlanService taskPlanService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private ServiceOrgCardDataService serviceOrgCardDataService;

    @Reference(version = "1.0.0")
    private MonitorService monitorService;

    @Reference(version = "1.0.0")
    private CallInfoService callInfoService;

    @Reference(version = "1.0.0")
    private ElderlyOrderAppService elderlyOrderAppService;

    @Reference(version = "1.0.0")
    private BillService billService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private UserLinkElderService userLinkElderService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyService serviceOrgElderlyService;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerCourtyardInformationService serviceOrgTowerCourtyardInformationService ;

    @Reference(version = "1.0.0")
    private ServiceOrgFloorInformationService serviceOrgFloorInformationService  ;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerRoomInformationService serviceOrgTowerRoomInformationService  ;

    @Reference(version = "1.0.0")
    private ServiceOrgBedsInformationService serviceOrgBedsInformationService ;


    @Autowired
    private RedisUserStateUtil redisUserStateUtil;

    @Value("${server.media.url}")
    private String BASE_URL;

    @Value("${user.password}")
    private String PASS_WORD;

    private static String CREATE_ROLE_PREFIX = "system:user:create:";

    @Value("${assess.url}")
    private String assessUrl;

    @Value("${assess.userfrom}")
    private String assessUserfrom;

    @Value("${assess.token}")
    private String assessToken;


    /**
     * 实时获取用户状态
     *
     * @return
     */
    @RequestMapping(value = "getUserStatus", method = RequestMethod.POST)
    @ResponseBody
    public Integer getUserStatus() {
        if (ObjectUtils.isNotNull(currentUser())) {
            return currentUser().getUid();
        } else {
            return 0;

        }
    }

    /**
     * 获取组织管理员
     *
     * @param serviceOrgId
     * @return
     */
    @RequestMapping(value = "getZuAdmin", method = RequestMethod.POST)
    @ResponseBody
    public List<User> getZuAdmin(Integer serviceOrgId) {
        User user = new User();
        user.setServiceOrgId(serviceOrgId + "");
        return userService.selectAllUserByRole(user, ZuAdmin.getId());
    }

    /**
     * 获取可以创建的角色
     *
     * @return
     */
    @RequestMapping(value = "getCanCreateRoles", method = RequestMethod.POST)
    @ResponseBody
    public List<SysRole> getCanCreateRoles() {
        List<SysRole> sysRoles = sysRoleService.getAllRecode(new SysRole());
        List<SysRole> result = new ArrayList<>();
        sysRoles.forEach(c -> {
            if (getCurrentUser().isPermitted(CREATE_ROLE_PREFIX + c.getRole())) {
                result.add(c);
            }
        });
        return result;
    }


    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加用户")
    public JsonResult addUser(User user, Integer sysRoleId, String areaOrServiceId, String areaOrServiceName, Integer fuwuId) {
        JsonResult result = new JsonResult();
        //判断是否存在账号
        if (ObjectUtils.isNotNull(userService.selectByLoginName(user.getLogin_name()))) {
            result.markError("账号已存在");
            return result;
        }
        if (sysRoleId == ZuAdmin.getId() || sysRoleId == ServiceUser.getId()) {
            areaOrServiceId = areaOrServiceId.replace("serviceOrg", "");
            user.setServiceOrgId(areaOrServiceId);
            user.setServiceOrgName(areaOrServiceName);
            if (areaOrServiceId.indexOf(",") < 0) {
                int serviceOrgId = Integer.parseInt(areaOrServiceId);
                ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgId);

                user.setAreaId(serviceOrg.getAreaId());
                user.setAreaName(serviceOrg.getAreaName());
            }

        } else {
            user.setAreaId(Integer.parseInt(areaOrServiceId));
            user.setAreaName(areaService.getAreaName(user.getAreaId()));
        }

        user.setPass_word(MD5.MD5Encode(PASS_WORD));
        user.setCreate_time(System.currentTimeMillis());
        user = userService.insertBackId(user);

        if (!Objects.isNull(user.getUid())) {
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUid());
            userRole.setRoleId(sysRoleId);

            if (userRoleService.insert(userRole)) {
                UserFuWu userFuWu = new UserFuWu();
                if (sysRoleId == ServiceUser.getId()) {
                    if (!StringUtils.isEmpty(fuwuId)) {
                        UserState us = new UserState();
                        us.setUid(user.getUid());
                        us.setServiceOrgId(user.getServiceOrgId());
                        us.setServiceOrgName(user.getServiceOrgName());
                        us.setOnLine(0);
                        us.setUserStatus(0);
                        userFuWu.setId(fuwuId);
                        userFuWu.setUserId(user.getUid());
                        if (userFuwuService.updateByPrimaryKeySelective(userFuWu)) {
                            UserFuWu userFuWu1 = userFuwuService.selectByPrimaryKey(fuwuId);
                            us.setServiceType(userFuWu1.getServiceType());
                            us.setUserName(userFuWu1.getName());
                            us.setPhone(userFuWu1.getMobile());
                            redisUserStateUtil.putUserState(us.getUid(), us);
                            result.markSuccess("添加成功", null);
                        } else {
                            result.markError("添加失败");
                        }
                    }
                }
                result.markSuccess("添加成功", null);
            } else {
                result.markError("添加失败");
            }
        } else {
            result.markError("添加失败");
        }
        return result;
    }


    /**
     * 删除人员
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除用户")
    public JsonResult deleteUser(Integer userId) {
        JsonResult result = new JsonResult();
        if (userService.deleteByPrimaryKey(userId)) {
            redisUserStateUtil.removeUserState(userId);
            UserFuWu userFuWu = new UserFuWu();
            userFuWu.setUserId(userId);// 登陆账号删除，服务表更新userId为NULL
            if (userFuwuService.updateNullByUserId(userId)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 更新成员
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新用户")
    public JsonResult updateUser(User user, Integer roleId, String flag) throws ParseException {

        JsonResult result = new JsonResult();
        if ("reset".equals(flag)) {
            user.setPass_word(MD5.MD5Encode(PASS_WORD));
        }
        if (userService.updateByPrimaryKeySelective(user)) {
            if (roleId != null) {
                logger.info("roleId:" + roleId);
                UserRole ur = new UserRole();
                ur.setRoleId(roleId);
                ur.setUserId(user.getUid());
                if (sysRoleService.insertSomeUserRole(new ArrayList(Arrays.asList(ur)))) {
                    result.markSuccess("更新成功", null);

                }
            }
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 更新多个成员状态
     *
     * @param status
     * @param users
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "updateUsers", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateUsers(Integer status, String users) throws ParseException {
        JsonResult result = new JsonResult();
        List<Integer> userIds = new ArrayList<Integer>();
        if (users != null) {
            for (int i = 0; i < users.split(",").length; i++) {
                if (users.split(",")[i] != null & users.split(",")[i] != "") {
                    userIds.add(Integer.parseInt(users.split(",")[i]));
                }
            }
            if (userService.updateUsers(status, userIds)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 得到人员列表
     *
     * @param user
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getList", method = RequestMethod.POST)
    @ResponseBody
    public String getUsers(User user, Integer roleId, PageRequest pageRequest) {
        PageResponse<User> dataTable = null;
        dataTable = userService.selectPageListByRoleId(user, pageRequest, roleId);
        List<User> users = dataTable.getData();
        Map<Integer, String> roleNames = sysRoleService.getRoleNamesByUids(users);
        JSONObject result = new JSONObject();
        result.put("draw", dataTable.getDraw());
        result.put("error", dataTable.getError());
        result.put("recordsFiltered", dataTable.getRecordsFiltered());
        result.put("recordsTotal", dataTable.getRecordsTotal());
        JSONArray ja = new JSONArray();
        JSONObject data = null;
        for (int i = 0; i < users.size(); i++) {
            data = new JSONObject();
            User item = users.get(i);
            data.put("id", item.getUid());
            data.put("name", item.getLogin_name());
            data.put("areaName", item.getAreaName());
            data.put("nickName", item.getNick_name());
            data.put("serviceOrgName", item.getServiceOrgName());
            data.put("status", item.getStatus());
            data.put("unitAndDuty", item.getUnitAndDuty());
            data.put("email", item.getEmail());
            if (roleNames.get(item.getUid()) != null) {
                data.put("roleName", roleNames.get(item.getUid()));
            } else {
                data.put("roleName", "");
            }
            ja.add(data);
        }
        result.put("data", ja);
        return result.toString();
    }

    /**
     * 获取用户在线列表
     *
     * @param user
     * @param roleId
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getOnlineList", method = RequestMethod.POST)
    @ResponseBody
    public String getOnlineList(User user, Integer roleId, PageRequest pageRequest) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int count = 0;
        int start = pageRequest.getStart();
        int length = pageRequest.getLength();
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        List<String> usernames = new ArrayList<>();
        Map<String, String> ips = new HashMap<>();
        Map<String, Date> times = new HashMap<>();
        for (Session session : sessions) {

            String loginUsername = String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));//获得session中已经登录用户的名字
            if (!StringUtils.isEmpty(loginUsername) && !usernames.contains(loginUsername) && !"null".equals(loginUsername)) {
                count++;
                ips.put(loginUsername, session.getHost());
                usernames.add(loginUsername);
                times.put(loginUsername, session.getLastAccessTime());
            }
        }
        if (usernames.size() > (length + start)) {
            usernames = usernames.subList(start, length);
        }
        JSONObject result = new JSONObject();
        result.put("draw", pageRequest.getDraw());
        result.put("error", "");
        result.put("recordsFiltered", count);
        result.put("recordsTotal", count);
        if (!StringUtils.isEmpty(user.getLogin_name())) {
            if (usernames.contains(user.getLinkName())) {
                usernames.clear();
                usernames.add(user.getLinkName());
            } else {
                result.put("data", null);
                return result.toString();
            }
        }
        List<User> users = userService.selectByLoginNamesAndRoleId(usernames, roleId);
        Map<Integer, String> roleNames = sysRoleService.getRoleNamesByUids(users);
        JSONArray ja = new JSONArray();
        JSONObject data = null;
        for (int i = 0; i < users.size(); i++) {
            data = new JSONObject();
            User item = users.get(i);
            data.put("id", item.getUid());
            data.put("nickName", item.getNick_name());
            data.put("ip", ips.get(item.getLogin_name()));
            data.put("lastTime", df.format(times.get(item.getLogin_name())));
            if (roleNames.get(item.getUid()) != null) {
                data.put("roleName", roleNames.get(item.getUid()));
            } else {
                data.put("roleName", "");
            }
            ja.add(data);
        }
        result.put("data", ja);
        return result.toString();
    }


    /**
     * 获取区域组织用户tree
     *
     * @return
     */
    @RequestMapping(value = "getUserTree", method = RequestMethod.POST)
    @ResponseBody
    public List<TreeBean> getUserTree() {
        List<TreeBean> treeBeens = new ArrayList<TreeBean>();
        List<Area> areas = null;
        List<User> users = null;
        List<ServiceOrg> serviceOrgs = null;
        Subject currentUser = SecurityUtils.getSubject();
        User user = new User();
        if (currentUser.hasRole(RoleType.SuAdmin.getValue()) || currentUser.hasRole(RoleType.MuAdmin.getValue())) {
            //超级管理员|市级管理员
            //给区域管理员，组织管理员
            areas = areaService.getAllRecode(null);
            serviceOrgs = serviceOrgService.getAllRecode(null);
            List<Integer> roleds = new ArrayList<Integer>();
            roleds.add(RoleType.ReAdmin.getId());
            roleds.add(ZuAdmin.getId());
            users = userService.selectAllUserByRoles(user, roleds);
        } else if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区级管理员
            //给组织管理员
            Area area = areaService.selectByPrimaryKey(currentUser().getAreaId());
            areas = new ArrayList<Area>();
            area.setParentId(0);
            areas.add(area);
            ServiceOrg serviceOrg = new ServiceOrg();
            serviceOrg.setAreaId(currentUser().getAreaId());
            serviceOrgs = serviceOrgService.getAllRecode(serviceOrg);
            user.setAreaId(currentUser().getAreaId());
            users = userService.selectAllUserByRole(user, ZuAdmin.getId());

        } else if (currentUser.hasRole(ZuAdmin.getValue())) {
            String serviceOrgIds = currentUser().getServiceOrgId();
            if (serviceOrgIds.indexOf(",") < 0) {

                //组织管理员
                ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(serviceOrgIds));
                serviceOrgs = new ArrayList<ServiceOrg>();
                serviceOrg.setAreaId(0);
                serviceOrgs.add(serviceOrg);
                user.setAreaId(currentUser().getAreaId());
                user.setServiceOrgId(currentUser().getServiceOrgId());
                users = userService.selectAllUserByRole(user, ServiceUser.getId());
            } else {
                //组织群管理员
            }
        } else if (currentUser.hasRole(RoleType.MonitorAdmin.getValue()) || currentUser.hasRole(RoleType.MonitorUser.getValue())) {
            //坐席人员
            areas = areaService.getAllRecode(null);
            serviceOrgs = serviceOrgService.getAllRecode(null);
            List<Integer> roleds = new ArrayList<Integer>();
            roleds.add(ZuAdmin.getId());
            users = userService.selectAllUserByRoles(user, roleds);
        }
        if (ObjectUtils.isNotNull(areas)) {
            for (Area a : areas) {
                TreeBean bean = new TreeBean();
                bean.setId(a.getId().toString());
                bean.setParent(a.getParentId().toString());
                bean.setText(a.getName());
                treeBeens.add(bean);
            }
        }
        if (ObjectUtils.isNotNull(serviceOrgs)) {
            for (ServiceOrg so : serviceOrgs) {
                TreeBean bean = new TreeBean();
                bean.setId("serviceOrg" + so.getId().toString());
                bean.setParent(so.getAreaId().toString());
                bean.setText(so.getInstitutionName());
                bean.setType("serviceOrg");
                treeBeens.add(bean);
            }
        }
        if (ObjectUtils.isNotNull(users)) {
            for (User u : users) {
                //不包括自己
                if (u.getUid() != currentUser().getUid()) {
                    TreeBean bean = new TreeBean();
                    bean.setId("user" + u.getUid().toString());
                    if (ObjectUtils.isNotNull(u.getServiceOrgId())) {
                        bean.setParent("serviceOrg" + u.getServiceOrgId().toString());
                    } else if (ObjectUtils.isNotNull(u.getAreaId())) {
                        bean.setParent(u.getAreaId().toString());
                    } else {
                        continue;
                    }
                    bean.setType("user");
                    bean.setText(u.getLogin_name());
                    treeBeens.add(bean);
                }
            }
        }
        return treeBeens;
    }


    /**
     * 得到组织tree
     *
     * @return
     */
    @RequestMapping(value = "getServiceOrgTree", method = RequestMethod.POST)
    @ResponseBody
    public List<TreeBean> getServiceOrgTree() {
        List<TreeBean> treeBeens = new ArrayList<TreeBean>();
        List<Area> areas = null;
        List<ServiceOrg> serviceOrgs = null;
        Subject currentUser = SecurityUtils.getSubject();
        User user = new User();
        if (currentUser.hasRole(RoleType.SuAdmin.getValue()) || currentUser.hasRole(RoleType.MuAdmin.getValue())) {
            //市级管理员
            //给区域管理员，组织管理员
            areas = areaService.getAllRecode(null);
            serviceOrgs = serviceOrgService.getAllRecode(null);
            List<Integer> roleds = new ArrayList<Integer>();
            roleds.add(RoleType.ReAdmin.getId());
            roleds.add(ZuAdmin.getId());
        } else if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区级管理员
            //给组织管理员
            Area area = areaService.selectByPrimaryKey(currentUser().getAreaId());
            areas = new ArrayList<Area>();
            area.setParentId(0);
            areas.add(area);
            ServiceOrg serviceOrg = new ServiceOrg();
            serviceOrg.setAreaId(currentUser().getAreaId());
            serviceOrgs = serviceOrgService.getAllRecode(serviceOrg);
            user.setAreaId(currentUser().getAreaId());

        } else if (currentUser.hasRole(ZuAdmin.getValue())) {
            String serviceOrgIds = currentUser().getServiceOrgId();
            if (serviceOrgIds.indexOf(",") < 0) {
                //组织管理员
                ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(serviceOrgIds));
                serviceOrgs = new ArrayList<ServiceOrg>();
                serviceOrg.setAreaId(0);
                serviceOrgs.add(serviceOrg);
                user.setAreaId(currentUser().getAreaId());
                user.setServiceOrgId(currentUser().getServiceOrgId());
            } else {
                //组织群管理员
            }
        }
        if (ObjectUtils.isNotNull(areas)) {
            for (Area a : areas) {
                TreeBean bean = new TreeBean();
                bean.setId(a.getId().toString());
                bean.setParent(a.getParentId().toString());
                bean.setText(a.getName());
                treeBeens.add(bean);
            }
        }
        if (ObjectUtils.isNotNull(serviceOrgs)) {
            for (ServiceOrg so : serviceOrgs) {
                TreeBean bean = new TreeBean();
                bean.setId("serviceOrg" + so.getId().toString());
                bean.setParent(so.getAreaId().toString());
                bean.setText(so.getInstitutionName());
                bean.setType("serviceOrg");
                treeBeens.add(bean);
            }
        }
        return treeBeens;
    }


    /**
     * 更新用户信息
     *
     * @param user
     * @param queueName
     * @param extension
     * @return
     */
    @RequestMapping(value = "updateUserInfo", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新用户信息")
    public JsonResult updateUserInfo(HttpServletRequest request, User user, String queueName, String extension) {
        boolean b = false;
        JsonResult result = new JsonResult();
        if (userService.updateByPrimaryKeySelective(user)) {
            if (!Strings.isNullOrEmpty(queueName) && !Strings.isNullOrEmpty(extension)) {
                Monitor monitor = new Monitor();
                monitor.setUserId(user.getUid());
                monitor.setQueueName(queueName);
                monitor.setExtension(extension);
                if (monitorService.updateByUserId(monitor)) {
                    b = true;
                }
            }
            setCurrentUser(request, user);
            b = true;
        }
        if (b) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 更新头像
     *
     * @param avatar
     * @return
     */
    @RequestMapping(value = "updateUrl")
    @ResponseBody
    @SystemControllerLog(description = "更新头像")
    public JsonResult updatePhotoUrl(HttpServletRequest request, MultipartFile avatar) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult saveResult = util.saveFile(request, avatar, util.SAVEURL_AVATAR, false);
        User me = currentUser();
        if (ObjectUtils.isNotNull(me)) {
            me.setAvatar(saveResult.getData().toString());
            if (userService.updateByPrimaryKeySelective(me)) {
                setCurrentUser(request, me);
                result.markSuccess("更新头像成功", BASE_URL + saveResult.getData().toString());
            } else {
                result.markError("更新头像失败");
            }
        } else {
            result.markError("更新头像失败");
        }
        return result;
    }

    /**
     * 更新密码
     *
     * @param uid
     * @param currentPassword
     * @param newPassword
     * @return
     * @throws ParseException
     */
    @SystemControllerLog(description = "更新密码")
    @RequestMapping(value = "updatepwd", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateUserPwd(Integer uid, String currentPassword, String newPassword) throws ParseException {
        if (uid == null) {
            return null;
        }
        JsonResult result = new JsonResult();
        User user = new User();
        user.setUid(uid);
        User oldUser = userService.selectByPrimaryKey(user.getUid());
        if (oldUser != null && oldUser.getPass_word().equals(MD5.MD5Encode(currentPassword))) {
            user.setPass_word(MD5.MD5Encode(newPassword));
            if (userService.updateByPrimaryKeySelective(user)) {
                result.markSuccess("密码修改成功", null);
            } else {
                result.markError("密码修改失败");
            }
        } else {
            result.markError("当前密码错误");
        }
        return result;
    }

    /**
     * 平台注册用户审核
     *
     * @param uid
     * @param status
     * @return
     * @throws ParseException
     */
    @SystemControllerLog(description = "平台注册用户审核")
    @RequestMapping(value = "approved", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult approved(Integer uid, Integer status) throws ParseException {
        if (uid == null) {
            return null;
        }
        JsonResult result = new JsonResult();
        User user = new User();
        user.setUid(uid);
        user.setStatus(status);
        User oldUser = userService.selectByPrimaryKey(user.getUid());
        if (oldUser != null) {
            if (userService.approved(user)) {
                result.markSuccess("审核通过", null);
            } else {
                result.markError("审核失败");
            }
        } else {
            result.markError("当前用户不存在");
        }
        return result;
    }

    /**
     * 判断昵称是否重复
     *
     * @param nick_name
     * @return
     */
    @RequestMapping("judgeNickName")
    @ResponseBody
    public AppResult judgeNickName(String nick_name) {
        AppResult result = new AppResult();
        if (userService.judgeNickName(nick_name) > 0) {
            result.markSuccess("重复", null);
        } else {
            result.markSuccess("可用", null);
        }
        return result;
    }

    @RequestMapping("hasAMsgOrNot")
    @ResponseBody
    public JsonResult hasAMsgOrNot() {
        JsonResult result = new JsonResult();
        String serviceOrgIds = currentUser().getServiceOrgId();
        if (serviceOrgIds.indexOf(",") < 0) {
            //组织管理员
            Integer serviceOrgId = Integer.parseInt(serviceOrgIds);
            if (ObjectUtils.isNotNull(serviceOrgId)) {
                ServiceOrgAssessment serviceOrgAssessment = serviceOrgAssessmentService.selectByServiceOrgId(serviceOrgId);
                if (ObjectUtils.isNotNull(serviceOrgAssessment)) {
                    if (serviceOrgAssessment.getFlag() == 0) {
                        if (serviceOrgAssessment.getStandard() == 0) {
                            result.markSuccess("很抱歉，组织评估没有通过！", null);
                            serviceOrgAssessment.setFlag(1);
                            serviceOrgAssessmentService.updateByPrimaryKeySelective(serviceOrgAssessment);
                        } else if (serviceOrgAssessment.getStandard() == 1) {
                            result.markSuccess("恭喜您，组织评估通过！", null);
                            serviceOrgAssessment.setFlag(1);
                            serviceOrgAssessmentService.updateByPrimaryKeySelective(serviceOrgAssessment);
                        }
                    }
                }
            }
        } else {
            //组织群管理员

        }
        return result;
    }

    /**
     * 平台首页统计数据
     *
     * @return
     */
    @RequestMapping("getStatisticsData")
    @ResponseBody
    public Map<String, Integer> getStatisticsData() {
        Map<String, Integer> result = new LinkedHashMap<>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Subject subject = getCurrentUser();
        //老人数据
        ElderlyMsg elderlyMsg = new ElderlyMsg();
        ServiceOrg serviceOrg = new ServiceOrg();
        String areaName = "";
        if (!subject.hasRole(RoleType.SuAdmin.getValue()) && !subject.hasRole(RoleType.MuAdmin.getValue())) {
            elderlyMsg.setAreaName(currentUser().getAreaName());
            serviceOrg.setAreaName(currentUser().getAreaName());
            areaName = (currentUser().getAreaName());
        }
        try {
            result.put("老人总量", elderlyMsgService.count(elderlyMsg));
        } catch (Exception e) {
            result.put("老人总量", 0);
        }
        try {
            result.put("组织总量", serviceOrgService.count(serviceOrg));
        } catch (Exception e) {
            result.put("组织总量", 0);
        }
        result.put("涉老社区", 0);
        try {
            if (areaName == "") {
                result.put("刷卡总量", taskService.count(new Task()) + taskPlanService.count(new TaskPlan()));
            } else {
                result.put("刷卡总量", taskService.taskCountByCity(areaName) + taskPlanService.taskCountByCity(areaName));
            }
        } catch (Exception e) {
            result.put("刷卡总量", 0);
        }
        try {
            result.put("呼叫总量", callInfoService.count(new CallInfo()));
        } catch (Exception e) {
            result.put("呼叫总量", 0);
        }
        result.put("养老金", 0);

        return result;
    }

    /**
     * 平台首页统计数据(机构管理员)
     *
     * @return
     */
    @RequestMapping("getOrgStatisticsData")
    @ResponseBody
    public Map<String, Integer> getOrgStatisticsData() {
        Map<String, Integer> result = new LinkedHashMap<>();
        int orgId = Integer.parseInt(currentUser().getServiceOrgId());
        User user = userService.selectByServiceOrgId(orgId);
        ServiceOrgElderly serviceOrgElderly = new ServiceOrgElderly();
        serviceOrgElderly.setServiceOrgId(user.getUid());
        int elderlyCount = serviceOrgElderlyService.count(serviceOrgElderly);
        try {
            result.put("在院老人数", elderlyCount);
        } catch (Exception e) {
            result.put("在院老人数", 0);
        }
        //床位数
        int bedNums=0;
        //空余床位数
        int unoccupiedBedNums=0;

        //int unoccupiedBedNums=bedNums-elderlyCount;

        List<ServiceOrgTowerCourtyardInformation> serviceOrgTowerCourtyardInformations = serviceOrgTowerCourtyardInformationService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        for (ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation : serviceOrgTowerCourtyardInformations) {
            bedNums+= serviceOrgTowerCourtyardInformation.getBedNum();
            List<ServiceOrgFloorInformation> serviceOrgFloorInformations = serviceOrgFloorInformationService.selectByTowerCourtyardId(serviceOrgTowerCourtyardInformation.getId());
            for (ServiceOrgFloorInformation serviceOrgFloorInformation : serviceOrgFloorInformations) {
                List<ServiceOrgTowerRoomInformation> serviceOrgTowerRoomInformations = serviceOrgTowerRoomInformationService.selectByFloorId(serviceOrgFloorInformation.getId());
                for (ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation : serviceOrgTowerRoomInformations) {
                    List<ServiceOrgBedsInformation> serviceOrgBedsInformations = serviceOrgBedsInformationService.selectByRoomId(serviceOrgTowerRoomInformation.getId());
                    for (ServiceOrgBedsInformation serviceOrgBedsInformation : serviceOrgBedsInformations) {
                        if(serviceOrgBedsInformation.getBedsState()==1){
                            unoccupiedBedNums++;
                        }
                    }

                }
            }

        }
        try {
            result.put("床位数", bedNums);
        } catch (Exception e) {
            result.put("床位数", 0);
        }

        try {
            result.put("空床位数", unoccupiedBedNums);
        } catch (Exception e) {
            result.put("空床位数", 0);
        }






     /*   //普通住宿床位床位数 + 护理床位床位数 + 日间照料床位床位数
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(orgId);
        int count = (serviceOrg.getBedCount() != null ? serviceOrg.getBedCount() : 0) +
                (serviceOrg.getBedNurseCount() != null ? serviceOrg.getBedNurseCount() : 0) +
                (serviceOrg.getBedCareCount() != null ? serviceOrg.getBedCareCount() : 0);
        try {
            result.put("床位数", count);
        } catch (Exception e) {
            result.put("床位数", 0);
        }
        //空床位数 = 总床位数 - 在院老人数
        try {
            int num = count - elderlyCount;
            result.put("空床位数", num > 0 ? num : 0);
        } catch (Exception e) {
            result.put("空床位数", 0);
        }*/
        try {
            UserFuWu query = new UserFuWu();
            query.setServiceOrgId(orgId);
            result.put("服务人员数", userFuwuService.count(query));
        } catch (Exception e) {
            result.put("服务人员数", 0);
        }

        result.put("志愿者数", 0);
        return result;
    }

    /**
     * 平台首页统计数据(组织管理员)
     *
     * @return
     */
    @RequestMapping("getZuZhiStatisticsData")
    @ResponseBody
    public Map<String, Integer> getZuZhiStatisticsData() {
        Map<String, Integer> result = new LinkedHashMap<>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Subject subject = getCurrentUser();
        try {
            Task query = new Task();
            query.setReceiverServiceOrg(currentUser().getServiceOrgName());
            TaskPlan queryPlan = new TaskPlan();
            queryPlan.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            result.put("居家养老服务量", taskService.count(query) + taskPlanService.count(queryPlan));
        } catch (Exception e) {
            result.put("居家养老服务量", 0);
        }

        try {
            UserFuWu query = new UserFuWu();
            query.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            result.put("服务人员数", userFuwuService.count(query));
        } catch (Exception e) {
            result.put("服务人员数", 0);
        }


        try {
            UserLinkElder query = new UserLinkElder();
            Task task = new Task();
            task.setReceiverServiceOrg(currentUser().getServiceOrgName());
            query.setTask(task);
            result.put("服务老人数", userLinkElderService.selectPageCount(query));
        } catch (Exception e) {
            result.put("服务老人数", 0);
        }

        result.put("志愿者数", 0);
        result.put("设备数", 0);


        return result;
    }

    /**
     * 根据角色查询用户信息
     *
     * @return
     */
    @RequestMapping("selectAllUserByRoles")
    @ResponseBody
    public JsonResult selectAllUserByRoles() {
        JsonResult result = new JsonResult();
        List<Integer> roleds = new ArrayList<Integer>();
        roleds.add(1);
        roleds.add(2);
        List<User> users = userService.selectAllUserByRoles(new User(), roleds);
        List<Integer> uids = new ArrayList<Integer>();
        for (User user : users
                ) {
            uids.add(user.getUid());
        }
        result.markSuccess("查询成功", uids);
        return result;
    }

    /**
     * 生成街道社区用户
     *
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping(value = "/createUser_JD_SH")
    public void createUser_JD_SH(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Area> areas = areaService.getAllRecode(new Area());
        List<User> users = new ArrayList<>();
        List<UserRole> userRoles = new ArrayList<>();
        for (Area area : areas) {
            if (area.getLevel() > 1) {
                User user = new User();
                user.setLogin_name(area.getDistrictId() + "001");
                user.setPass_word(MD5.MD5Encode("yl123456"));
                user.setNick_name(area.getName());
                user.setAreaId(area.getId());
                user.setGender(1);
                user.setCreate_time(System.currentTimeMillis());
                user.setAreaName(areaService.getAreaName(area.getId()));
                user.setStatus(1);
                users.add(user);
                user = userService.insertBackId(user);
                if (user.getUid() > 0) {
                    UserRole userRole = new UserRole();
                    userRole.setUserId(user.getUid());
                    if (area.getLevel() == 3) {
                        //街道
                        userRole.setRoleId(RoleType.StAdmin.getId());
                    } else if (area.getLevel() == 4) {
                        userRole.setRoleId(RoleType.CoAdmin.getId());
                    }
                    userRoles.add(userRole);
                }
            }
        }
        if (userRoleService.insertSomeUserRole(userRoles) > 0) {
            response.setContentType("octets/stream");
            String fileName = "街道社区用户表.xls";
            fileName = URLEncoder.encode(fileName, "UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
            OutputStream out = response.getOutputStream();
            ExportExcel<User> ex = new ExportExcel<>();
            String[] headers = {"用户名", "昵称"};
            String[] fieldNames = {"login_name", "nick_name"};
            ex.exportExcel(fileName, headers, fieldNames, users, out, "yyyy-MM-dd");
            out.close();
        }
    }


}
