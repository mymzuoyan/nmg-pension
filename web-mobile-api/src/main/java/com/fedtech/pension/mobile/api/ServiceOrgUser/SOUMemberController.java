package com.fedtech.pension.mobile.api.ServiceOrgUser;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.FileUtil;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.mobile.api.MyValidateApiController;
import com.fedtech.pension.mobile.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.mobile.redis.RedisUserStateUtil;
import com.fedtech.pension.mobile.vo.PersonVo;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.org.service.UserFuwuService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.entity.UserState;
import com.fedtech.pension.sys.service.UserRoleService;
import com.fedtech.pension.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.regex.Pattern;

/**
 * Created by CoderQiang on 2017/3/17.
 */
@Controller
@RequestMapping("/api/serviceUser/")
public class SOUMemberController {

    protected Logger logger = LoggerFactory.getLogger(SOUMemberController.class);

    private String SAVEURL_serviceUser = "/file/app/serviceUser/";

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Autowired
    private MyValidateApiController myValidateApiController;

    @Autowired
    private RedisUserStateUtil redisUserStateUtil;


    /**
     * 获取服务人员详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getServiceUserInfoById", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getServiceUserInfoById(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        UserFuWu userFuWu1 = userFuwuService.selectByPrimaryKey(id);
        if (!ObjectUtils.isNotNull(userFuWu1)) {
            result.markError("此服务人员不存在");
            return result;
        } else {
            if (!StringUtils.isEmpty(userFuWu1.getUserId())) {
                UserFuWu userFuWu = userFuwuService.selectByUserId(userFuWu1.getUserId());
                if (userFuWu != null) {
                    result.markSuccess("获取服务人员详情成功", userFuWu);
                } else {
                    result.markError("获取服务人员失败");
                }
            } else {
                result.markSuccess("获取服务人员详情成功", userFuWu1);
            }
        }
        return result;
    }

    /**
     * 获取服务人员详情
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "getServiceUserInfoByUserId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getServiceUserInfoByUserId(@RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();
        UserFuWu userFuWu = userFuwuService.selectByUserId(userId);
        if (userFuWu != null) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", userFuWu.getName());
            jsonObject.put("id", userFuWu.getId());
            jsonObject.put("userId", userFuWu.getUserId());
            jsonObject.put("mobile", userFuWu.getMobile());
            jsonObject.put("realAddress", userFuWu.getRealAddress());
            jsonObject.put("serviceType", userFuWu.getServiceType());
            jsonObject.put("idcardno", userFuWu.getIdcardno());
            jsonObject.put("idPhotos", userFuWu.getIdPhotos());
            jsonObject.put("startLevel", userFuWu.getStartLevel());
            jsonObject.put("gender", userFuWu.getGender());
            jsonObject.put("avatar", userFuWu.getAvatar());
            result.markSuccess("获取服务人员详情成功", jsonObject);
        } else {
            result.markError("此服务人员信息不存在");
        }
        return result;
    }

    /**
     * 添加服务人员
     *
     * @param request
     * @param personVo
     * @return
     */
    @RequestMapping(value = "addServiceUser", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public AppResult addServiceUser(HttpServletRequest request, PersonVo personVo) {
        AppResult result = new AppResult();
        if (StringUtils.isEmpty(personVo.getName())) {
            result.markError("姓名是必须要的参数");
            return result;
        }
        if (StringUtils.isEmpty(personVo.getIdcardno())) {
            result.markError("身份证号码是必须要的参数");
            return result;
        }
        if (StringUtils.isEmpty(personVo.getServiceOrgId())) {
            result.markError("所属组织是必须要的参数");
            return result;
        }
        if (userFuwuService.selectByIdCardNo(personVo.getIdcardno()) != null) {
            result.markError("改服务人员已经存在");
            return result;
        }
        JsonResult validateResult = myValidateApiController.IDCardValidate(personVo.getIdcardno(), "fuwu");
        if (!validateResult.isSuccess()) {
            result.markError(validateResult.getMessage());
        }
        UserFuWu userFuWu = (UserFuWu) myValidateApiController.autoAnalysisIdentity(personVo.getIdcardno(), "fuwu");
        userFuWu.setIdcardno(personVo.getIdcardno());
        userFuWu.setName(personVo.getName());
        userFuWu.setRealAddress(personVo.getRealAddress());
        userFuWu.setMobile(personVo.getMobile());
        userFuWu.setServiceOrgId(personVo.getServiceOrgId());
        try {
            ServiceOrgLocation sl = ((ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(personVo.getServiceOrgId()));
            userFuWu.setAreaName(sl.getAreaName());
            userFuWu.setServiceOrgName(sl.getServiceOrgName());
        } catch (Exception e) {
            ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(personVo.getServiceOrgId());
            userFuWu.setAreaName(serviceOrg.getAreaName());
            userFuWu.setServiceOrgName(serviceOrg.getInstitutionName());
        }
        userFuWu.setServiceType(personVo.getServiceType());
        AppResult saveResult = new AppResult();
        if (personVo.getIdPhotos() != null) {
            saveResult = fileUpload(request, personVo.getIdPhotos(), personVo.getServiceOrgId(), userFuWu.getId());
        }
        if (!StringUtils.isEmpty(saveResult.getData())) {
            userFuWu.setIdPhotos(saveResult.getData().toString());
        }
        if (userFuwuService.insert(userFuWu)) {
            result.markSuccess("登记人员成功", null);
        } else {
            result.markError("登记人员失败");
        }

        return result;
    }


    /**
     * 分配服务人员账号
     *
     * @param mobile
     * @param serviceOrgId
     * @return
     */
    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public AppResult addUser(@RequestParam("id") Integer id,
                             @RequestParam(value = "nickName", required = false) String nickName,
                             @RequestParam(value = "loginName") String loginName,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "mobile", required = false) String mobile,
                             @RequestParam("serviceOrgId") Integer serviceOrgId) {
        AppResult result = new AppResult();
        //判断是否存在账号
        if (ObjectUtils.isNotNull(userService.selectByLoginName(loginName))) {
            result.markError("账号已经存在");
            return result;
        }
        if (StringUtils.isEmpty(nickName)) {
            nickName = loginName;
        }
        User user = new User();
        user.setLogin_name(loginName);
        user.setNick_name(nickName);
        user.setPhone(mobile);
        user.setServiceOrgId(serviceOrgId.toString());
        try {
            ServiceOrgLocation sl = ((ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(serviceOrgId));

            user.setAreaName(sl.getAreaName());
            user.setServiceOrgName(sl.getServiceOrgName());
            user.setAreaId(sl.getAreaId());
        } catch (Exception e) {
            ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgId);
            user.setAreaName(serviceOrg.getAreaName());
            user.setServiceOrgName(serviceOrg.getInstitutionName());
            user.setAreaId(serviceOrg.getAreaId());
        }
        user.setPass_word(password);
        user.setCreate_time(System.currentTimeMillis());
        user.setStatus(1);
        user = userService.insertBackId(user);
        if (ObjectUtils.isNotNull(user.getUid())) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("uid", user.getUid());
            jsonObject.put("loginName", user.getLogin_name());
            jsonObject.put("nickName", user.getNick_name());
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getUid());
            userRole.setRoleId(RoleType.ServiceUser.getId());
            if (userRoleService.insert(userRole)) {
                UserFuWu userFuWu = new UserFuWu();
                userFuWu.setId(id);
                userFuWu.setUserId(user.getUid());
                if (userFuwuService.updateByPrimaryKeySelective(userFuWu)) {
                    // 更新缓存
                    UserFuWu u = userFuwuService.selectByPrimaryKey(userFuWu.getId());
                    UserState us = new UserState();
                    us.setUid(u.getUserId());
                    us.setUserName(u.getName());
                    us.setServiceOrgId(user.getServiceOrgId());
                    us.setServiceOrgName(u.getServiceOrgName());
                    us.setPhone(user.getPhone());
                    us.setGender(user.getGender1());
                    us.setServiceType(u.getServiceType());
                    us.setOnLine(0);
                    us.setUserStatus(0);
                    redisUserStateUtil.putUserState(user.getUid(), us);
                    result.markSuccess("添加账号成功", jsonObject);
                } else {
                    result.markError("添加账号失败");
                }
            }
        } else {
            result.markError("添加账号失败");
        }
        return result;
    }

    @RequestMapping(value = "deleteUser", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public AppResult deleteUser(@RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();
        if (userService.deleteByPrimaryKey(userId)) {
            if (userFuwuService.updateNullByUserId(userId)) {
                redisUserStateUtil.removeUserState(userId);
                result.markSuccess("删除成功", null);
            }
        } else {
            result.markError("删除失败");
        }

        return result;
    }


    /**
     * 更新服务人员信息
     *
     * @param request
     * @param personVo
     * @return
     */
    @RequestMapping(value = "updateServiceUser", method = RequestMethod.POST)
    @ResponseBody
    public AppResult updateServiceUser(HttpServletRequest request, PersonVo personVo) {
        AppResult result = new AppResult();
        if (StringUtils.isEmpty(personVo.getId())) {
            result.markError("id是必须要的参数");
            return result;
        }
        UserFuWu userFuWu = userFuwuService.selectByPrimaryKey(personVo.getId());
        AppResult saveResult = new AppResult();
        if (personVo.getIdPhotos() != null) {
            saveResult = fileUpload(request, personVo.getIdPhotos(), userFuWu.getServiceOrgId(), personVo.getId());
        }
        userFuWu.setMobile(personVo.getMobile());
        userFuWu.setRealAddress(personVo.getRealAddress());
        userFuWu.setServiceType(personVo.getServiceType());
        if (!StringUtils.isEmpty(saveResult.getData())) {
            userFuWu.setIdPhotos(saveResult.getData().toString());
        }
        if (userFuwuService.updateByPrimaryKeySelective(userFuWu)) {
            result.markSuccess("更新服务人员信息成功", null);
        } else {
            result.markError("更新服务人员信息失败");
        }
        return result;
    }


    /**
     * 更新服务人员信息
     *
     * @param userId
     * @param nickName
     * @param mobile
     * @param realAddress
     * @return
     */
    @RequestMapping(value = "updateServiceUserByUserId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult updateServiceUserByUserId(@RequestParam("userId") Integer userId,
                                               @RequestParam(value = "nickName", required = false) String nickName,
                                               @RequestParam(value = "mobile", required = false) String mobile,
                                               @RequestParam(value = "realAddress", required = false) String realAddress) {
        AppResult result = new AppResult();
        User user = userService.selectByPrimaryKey(userId);
        UserFuWu userFuWu = userFuwuService.selectByUserId(userId);
        AppResult saveResult = new AppResult();
        user.setUid(userId);
        user.setNick_name(nickName);
        if (userService.updateByPrimaryKeySelective(user)) {
            userFuWu.setUserId(userId);
            userFuWu.setMobile(mobile);
            userFuWu.setRealAddress(realAddress);
            if (!StringUtils.isEmpty(saveResult.getData())) {
                userFuWu.setIdPhotos(saveResult.getData().toString());
            }
            if (userFuwuService.updateByUserId(userFuWu)) {
                result.markSuccess("更新服务人员信息成功", null);
            } else {
                result.markError("更新服务人员信息失败");
            }
        }
        return result;
    }

    /**
     * 删除服务人员
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "deleteUserService", method = RequestMethod.POST)
    @ResponseBody
    public AppResult deleteUserFuwu(@RequestParam("id") Integer id, @RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();
        if (!StringUtils.isEmpty(id)) {
            if (userFuwuService.deleteByPrimaryKey(id)) {
                if (!StringUtils.isEmpty(userId) && userId != 0) {
                    if (userService.deleteByPrimaryKey(userId)) {
                        redisUserStateUtil.removeUserState(userId);
                        result.markSuccess("删除成功", null);
                    } else {
                        result.markError("删除失败");
                    }
                } else {
                    result.markSuccess("删除成功", null);
                }
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    public static boolean matcher(String contidion, String str) {
        boolean b = Pattern.matches(contidion, str);
        return b;
    }

    public AppResult fileUpload(HttpServletRequest request,
                                MultipartFile[] idPhotos,
                                Integer serviceOrgId,
                                Integer serviceUserId) {
        AppResult result = new AppResult();
        String fileNames = "";
        if (idPhotos != null && idPhotos.length > 0) {
            for (int i = 0; i < idPhotos.length; i++) {
                MultipartFile file = idPhotos[i];
                if (!StringUtils.isEmpty(serviceOrgId)) {
                    FileUtil util = new FileUtil();
                    if (!file.isEmpty()) {
                        JsonResult result1 = util.saveFile(request, file, SAVEURL_serviceUser + serviceOrgId + "/" + serviceUserId + "/");
                        fileNames += result1.getData() + ",";
                    }
                }
            }
            if (!StringUtils.isEmpty(fileNames)) {
                fileNames = fileNames.substring(0, fileNames.length() - 1);
            }
            result.markSuccess("文件上传成功", fileNames);
        }
        return result;
    }


    /**
     * 实时定位
     *
     * @param request
     * @param lat
     * @param lng
     * @return
     */
    @RequestMapping(value = "updateLocation")
    @ResponseBody
    public AppResult updateLocation(HttpServletRequest request,
                                    @RequestParam("lat") String lat,
                                    @RequestParam("lng") String lng) {
        AppResult result = new AppResult();
        Integer userId = Integer.parseInt(request.getHeader("userId"));
        try {

            double loc_lat = Double.parseDouble(lat);
            double loc_lng = Double.parseDouble(lng);

            // 定位信息更新到(用户定位信息)缓存中
            Date currentDate = new Date();
            // 更新用户实时位置
            Object userState = redisUserStateUtil.getUserState(userId);
            if (null != userState) {
                UserState us = (UserState) userState;
                us.setLat(loc_lat);
                us.setLng(loc_lng);
                us.setOnLine(1);
                us.setLastTime(currentDate.getTime());
                redisUserStateUtil.putUserState(userId, us);
                result.markSuccess("定位上传成功", null);
            } else {
                result.markError("更新地址失败，此服务人员不在缓存列表中");
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.info(e.getMessage());
            result.markError("更新地址失败");
        }
        return result;
    }


    /**
     * 更新用户状态
     *
     * @param id
     * @param status
     * @return
     */
    @RequestMapping(value = "updateUserStatus")
    @ResponseBody
    public AppResult updateUserStatus(@RequestParam("id") Integer id, @RequestParam("status") Integer status, @RequestParam("taskId") Integer taskId) {
        AppResult result = new AppResult();
        Object userState = redisUserStateUtil.getUserState(id);
        if (null != userState) {
            UserState us = (UserState) userState;
            us.setUserStatus(status);
            us.setLastTime(System.currentTimeMillis());
            us.setTaskId(taskId);
            redisUserStateUtil.putUserState(id, us);
            result.markSuccess("更新成功", us);
        } else {
            result.markSuccess("更新失败", null);
        }
        return result;
    }


}
