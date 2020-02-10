package com.fedtech.pension.datadock.api;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.entity.Account;
import com.fedtech.pension.datadock.redis.RedisAppTokenUtil;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserRole;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserRoleService;
import com.fedtech.pension.sys.service.UserService;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.UUID;


/**
 * @author zhnn
 * @date 2017/4/14
 */
@Controller
@RequestMapping("/api/")
public class CommonApiController {

    protected Logger logger = LoggerFactory.getLogger(CommonApiController.class);


    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Autowired
    private RedisAppTokenUtil redisAppTokenUtil;

    /**
     * 获取token
     *
     * @return
     */
    @RequestMapping(value = "getToken", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getToken(@RequestBody Account account, HttpServletResponse response) {
        response.setContentType("octets/stream");
        response.setHeader("Access-Control-Allow-Origin","*");
        response.setHeader("Access-Control-Allow-Methods","GET,POST");
        AppResult result = new AppResult();
        String username = account.getUsername();
        String password = account.getPassword();
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            result.markError("账号密码不可为空。");
            return result;
        }
        User user = userService.selectByLoginName(username);
        if (ObjectUtils.isNotNull(user)) {
            List<UserRole> userRoles = userRoleService.getUserRolesByUserId(user.getUid());
            boolean b = false;
            for (UserRole role : userRoles) {
                if (role.getRoleId().equals(RoleType.ApiUser.getId())) {
                    b = true;
                    break;
                }
            }
            if (!b) {
                result.markError("您没有这个权限");
                return result;
            }
            if (user.getPass_word().equals(password)) {
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
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("userId", user.getUid());
                    jsonObject.put("token", user.getAppToken());
                    result.markSuccess("获取token成功", jsonObject);
                } else {
                    redisAppTokenUtil.removeAppToken(user.getUid());
                    result.markError("获取token失败");
                }
            } else {
                result.markError("用户密码错误");
            }
        } else {
            result.markError("没有该用户");
        }
        return result;
    }

    /**
     * 获取区域全称
     *
     * @param areaId
     * @return
     */
    @RequestMapping(value = "getAreaName", method = RequestMethod.POST)
    @ResponseBody
    public String getAreaName(Integer areaId) {

        return areaService.getAreaName(areaId);
    }

}
