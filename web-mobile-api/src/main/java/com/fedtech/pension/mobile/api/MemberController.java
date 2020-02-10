package com.fedtech.pension.mobile.api;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fedtech.commons.FileUtil;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.mobile.redis.RedisAppTokenUtil;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.service.UserFuwuService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.JPushQuantity;
import com.fedtech.pension.task.service.JpushService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.google.common.base.Strings;
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
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Gong on 2016/5/4.
 */
@Controller
@RequestMapping("/api/")
public class MemberController {

    protected Logger logger = LoggerFactory.getLogger(MemberController.class);


    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private JpushService jpushService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Autowired
    private RedisAppTokenUtil redisAppTokenUtil;

    @Value("${server.media.url}")
    private String BASE_URL;

    /**
     * 登录
     *
     * @param account
     * @param password
     * @param type
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public AppResult login(@RequestParam("account") String account, @RequestParam("password") String password, @RequestParam("type") String type) {
        AppResult result = new AppResult();
        if (StringUtils.isEmpty(account) || StringUtils.isEmpty(password)) {
            result.markError("登录账号或登录密码为空");
            return result;
        } /*else if (account.length() < 5 || account.length() > 12) {
            result.markError("登陆账号过短或过长!");
            return result;
        }*/ else if (StringUtils.isEmpty(type)) {
            result.markError("登录类型不能为空");
            return result;
        }
        Integer roleId = 0;
        int roleIds[] = {0, RoleType.ZuAdmin.getId(), RoleType.ServiceUser.getId(), RoleType.ServiceObject.getId()};
        int pushTypes[] = {0, JPushQuantity.SERVICEADMIN, JPushQuantity.SERVICEUSER, JPushQuantity.SERVICEOBJECT};
        try {
            roleId = roleIds[Integer.parseInt(type)];
        } catch (Exception e) {
            e.printStackTrace();
            result.markError("登录类型错误");
            return result;
        }
        User user = userService.selectByLoginNameAndRole(account, roleId);
        if (ObjectUtils.isNotNull(user) && user.getPass_word().equals(password)) {
            user.setAppToken(UUID.randomUUID().toString().replace("-", ""));
            //更新 token 缓存
            String old_token = redisAppTokenUtil.getAppToken(user.getUid());
            if (!Strings.isNullOrEmpty(old_token)) {
                redisAppTokenUtil.removeAppToken(user.getUid());
            }
            redisAppTokenUtil.putAppToken(user.getUid(), user.getAppToken());
            //同步 token 到数据库
            if (userService.updateByPrimaryKeySelective(user)) {
                user.setPass_word("");
                result.markSuccess("登录成功", user);

                //推送登录通知
                List<String> receiverIds = new ArrayList<>();
                receiverIds.add(user.getUid() + "");
//                jpushService.sendUserMessage(receiverIds, user.getAppToken(), pushTypes[Integer.parseInt(type)]);

            } else {
                redisAppTokenUtil.removeAppToken(user.getUid());
                result.markError("登录失败，账号或密码错误");
            }
        } else {
            result.markError("登录失败，账号或密码错误");
        }
        return result;
    }

    /**
     * 退出
     *
     * @return
     */
    @RequestMapping(value = "logout", method = RequestMethod.POST)
    @ResponseBody
    public AppResult logout(HttpServletRequest request) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        User user = new User();
        user.setUid(Integer.parseInt(userId));
        user.setAppToken("");
        if (userService.updateByPrimaryKeySelective(user)) {
            result.markSuccess("退出成功", null);
        } else {
            result.markError("退出失败");
        }
        return result;
    }

    /**
     * 获取个人信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "user/profile")
    @ResponseBody
    public AppResult pullUserProfile(HttpServletRequest request, @RequestParam("type") Integer type) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        Integer roleId = 0;
        int roleIds[] = {0, RoleType.ZuAdmin.getId(), RoleType.ServiceUser.getId(), RoleType.ServiceObject.getId()};
        try {
            roleId = roleIds[type];
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = userService.selectInfoAndTaskCount(Integer.parseInt(userId), roleId);
        if (ObjectUtils.isNotNull(user)) {
            user.setPass_word("");
            if (ObjectUtils.isNotNull(user.getAvatar())) {
                user.setAvatar(user.getAvatar());
            }
            result.markSuccess("获取个人信息成功", user);
        } else {
            result.markError("获取个人信息失败");
        }
        return result;
    }


    /**
     * 修改密码
     *
     * @param userId
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "user/updatePwd")
    @ResponseBody
    public AppResult updatePwd(@RequestParam("userId") Integer userId,
                               @RequestParam("oldPwd") String oldPwd,
                               @RequestParam("newPwd") String newPwd) {
        AppResult result = new AppResult();
        User user = userService.selectByPrimaryKey(userId);
        if (ObjectUtils.isNotNull(user)) {
            if (user.getPass_word().equals(oldPwd)) {
                user.setPass_word(newPwd);
                if (userService.updateByPrimaryKeySelective(user)) {
                    result.markSuccess("修改密码成功", null);
                } else {
                    result.markError("修改密码失败");
                }
            } else {
                result.markError("旧密码错误");
            }
        } else {
            result.markError("用户不存在");
        }
        logger.info(result.toString());
        return result;
    }


    /**
     * 修改密码（不需要旧密码）
     *
     * @param userId
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "user/updatePwd2")
    @ResponseBody
    public AppResult updatePwd2(@RequestParam("userId") Integer userId,
                                @RequestParam("newPwd") String newPwd) {
        AppResult result = new AppResult();
        User user = new User();
        user.setUid(userId);
        user.setPass_word(newPwd);
        if (userService.updateByPrimaryKeySelective(user)) {
            result.markSuccess("修改密码成功", null);
        } else {
            result.markError("修改密码失败");
        }
        return result;
    }

    /**
     * 忘记密码
     *
     * @param loginName
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "user/forgetPwd")
    @ResponseBody
    public AppResult forgetPwd(@RequestParam("loginName") String loginName,
                               @RequestParam(value = "newPwd", required = false) String newPwd) {
        AppResult result = new AppResult();
        User user = userService.selectByLoginName(loginName);
        if (ObjectUtils.isNotNull(user)) {
            user.setPass_word(newPwd);
            if (userService.updateByPrimaryKeySelective(user)) {
                result.markSuccess("修改密码成功", null);
            } else {
                result.markError("修改密码失败");
            }
        } else {
            result.markError("用户不存在");
        }
        logger.info(result.toString());
        return result;
    }

    /**
     * 更新头像
     *
     * @param userId
     * @param avatar
     * @return
     */
    @RequestMapping(value = "user/updateUrl")
    @ResponseBody
    public AppResult updatePhotoUrl(HttpServletRequest request, Integer userId, MultipartFile avatar) {
        AppResult result = new AppResult();
        FileUtil util = new FileUtil();
        try {
            JsonResult saveResult = util.saveFile(request, avatar, util.SAVEURL_AVATAR);
            User user = userService.selectByPrimaryKey(userId);
            if (ObjectUtils.isNotNull(user)) {
                user.setAvatar(saveResult.getData().toString());
                if (userService.updateByPrimaryKeySelective(user)) {
                    result.markSuccess("更新头像成功", saveResult.getData().toString());
                } else {
                    result.markError("更新头像失败");
                }
            } else {
                result.markError("更新头像失败");
            }
        } catch (MultipartException e) {
            result.markError("更新头像失败");
        }
        return result;
    }

    /**
     * 更新个人信息
     *
     * @param request
     * @param nickName
     * @return
     */
    @RequestMapping(value = "user/updateProfile")
    @ResponseBody
    public AppResult updateProfile(HttpServletRequest request,
                                   @RequestParam(value = "nickName", required = false) String nickName,
                                   @RequestParam(value = "phone", required = false) String phone
    ) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        User user = userService.selectByPrimaryKey(Integer.parseInt(userId));
        if (ObjectUtils.isNotNull(user)) {
            if (userService.judgeNickName(nickName) > 0) {
                result.markError("昵称已经被使用");
            } else {
                user.setNick_name(nickName);
                user.setPhone(phone);
                if (userService.updateByPrimaryKeySelective(user)) {
                    //更新缓存
                    result.markSuccess("更新个人信息成功", null);
                } else {
                    result.markError("更新个人信息失败");
                }
            }
        } else {
            result.markError("无此用户信息");
        }
        logger.info(result.toString());
        return result;
    }


    /////////////////////////////////////以下接口现不使用///////////////////////////////////////

    /**
     * 更新姓名
     *
     * @param request
     * @param name
     * @return
     */
    @RequestMapping(value = "user/updateName")
    @ResponseBody
    public AppResult updateName(HttpServletRequest request, @RequestParam("name") String name) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        User user = userService.selectByPrimaryKey(Integer.parseInt(userId));
        if (ObjectUtils.isNotNull(user)) {
            user.setNick_name(name);
            if (userService.updateByPrimaryKeySelective(user)) {
                //更新缓存
                result.markSuccess("更新姓名成功", null);
            } else {
                result.markError("更新姓名失败");
            }
        } else {
            result.markError("更新姓名失败");
        }
        logger.info(result.toString());
        return result;
    }

    /**
     * 更新手机号码
     *
     * @param request
     * @param mobile
     * @return
     */
    @RequestMapping(value = "user/updatePhone")
    @ResponseBody
    public AppResult updatePhone(HttpServletRequest request, @RequestParam("mobile") String mobile, @RequestParam("type") Integer type) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        if (type == 2) {
            UserFuWu userFuWu = userFuwuService.selectByUserId(Integer.parseInt(userId));
            if (ObjectUtils.isNotNull(userFuWu)) {
                userFuWu.setMobile(mobile);
                if (userFuwuService.updateByUserId(userFuWu)) {
                    //更新缓存
                    result.markSuccess("更新手机号码成功", null);
                } else {
                    result.markError("更新手机号码失败");
                }
            } else {
                result.markError("更新手机号码失败");
            }
        } else {
            User user = new User();
            user.setUid(Integer.parseInt(userId));
            user.setPhone(mobile);
            if (userService.updateByPrimaryKeySelective(user)) {
                result.markSuccess("更新手机号码成功", null);
            } else {
                result.markError("更新手机号码失败");
            }
        }

        logger.info(result.toString());
        return result;
    }

    /**
     * 更新身份证号码
     *
     * @param request
     * @param idcardno
     * @return
     */
    @RequestMapping(value = "user/updateIdCardNo")
    @ResponseBody
    public AppResult updateIdCardNo(HttpServletRequest request, @RequestParam("idcardno") String idcardno) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        UserFuWu userFuWu = userFuwuService.selectByUserId(Integer.parseInt(userId));
        if (ObjectUtils.isNotNull(userFuWu)) {
            userFuWu.setIdcardno(idcardno);
            if (userFuwuService.updateByUserId(userFuWu)) {
                //更新缓存s
                result.markSuccess("更新身份证号成功", null);
            } else {
                result.markError("更新身份证号失败");
            }
        } else {
            result.markError("更新身份证号失败");
        }
        logger.info(result.toString());
        return result;
    }

    /**
     * 更新服务人员实际居住地
     *
     * @param request
     * @param realAddress
     * @return
     */
    @RequestMapping(value = "user/updateRealAddress")
    @ResponseBody
    public AppResult updateRealAddress(HttpServletRequest request, @RequestParam("realAddress") String realAddress) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        UserFuWu userFuWu = userFuwuService.selectByUserId(Integer.parseInt(userId));
        if (ObjectUtils.isNotNull(userFuWu)) {
            userFuWu.setRealAddress(realAddress);
            if (userFuwuService.updateByUserId(userFuWu)) {
                //更新缓存
                result.markSuccess("更新实际居住地成功", null);
            } else {
                result.markError("更新实际居住地失败");
            }
        } else {
            result.markError("更新实际居住地失败");
        }
        logger.info(result.toString());
        return result;
    }

    /**
     * 获取组织管理人员首页信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "user/index")
    @ResponseBody
    public AppResult getIndexInfo(HttpServletRequest request, @RequestParam("type") Integer type) {
        AppResult result = new AppResult();
        String userId = request.getHeader("userId");
        Integer roleId = 0;
        int roleIds[] = {0, RoleType.ZuAdmin.getId(), RoleType.ServiceUser.getId(), RoleType.ServiceObject.getId()};
        try {
            roleId = roleIds[type];
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = userService.selectInfoAndTaskCount(Integer.parseInt(userId), roleId);
        List<TaskReceive> taskReceives = taskReceiveService.selectCountByReceiverId(Integer.parseInt(userId));
        int taskHave = 0;//受领工单
        int taskAll1 = 0;// 已接单
        int taskAll2 = 0;// 已完成
        int taskAll3 = 0;// 已派遣
        if (!taskReceives.isEmpty()) {
            for (int i = 0; i < taskReceives.size(); i++) {
                if (!StringUtils.isEmpty(taskReceives.get(i).getStatus())) {
                    if (taskReceives.get(i).getStatus().equals(0)) {
                        taskHave = taskReceives.get(i).getTaskCount();
                    } else if (taskReceives.get(i).getStatus().equals(1)) {
                        taskAll1 = taskReceives.get(i).getTaskCount();
                    } else if (taskReceives.get(i).getStatus().equals(2)) {
                        taskAll2 = taskReceives.get(i).getTaskCount();
                    } else if (taskReceives.get(i).getStatus().equals(3)) {
                        taskAll3 = taskReceives.get(i).getTaskCount();
                    }
                }
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("userId", user.getUid());// 用户id
        jsonObject.put("nickName", user.getNick_name());// 昵称
        jsonObject.put("serviceOrgName", user.getServiceOrgName());//组织名称
        jsonObject.put("avatar", user.getAvatar());// 头像
        jsonObject.put("taskHave", taskHave);// 受领工单
        jsonObject.put("taskAll", taskAll1 + taskAll2 + taskAll3);// 服务统计
        result.markSuccess("获取首页信息成功", jsonObject);
        return result;
    }
}
