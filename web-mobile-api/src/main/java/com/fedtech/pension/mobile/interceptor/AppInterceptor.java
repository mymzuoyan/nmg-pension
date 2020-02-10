package com.fedtech.pension.mobile.interceptor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.mobile.redis.RedisAppTokenUtil;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * APP TOKEN 拦截器
 *
 * @author Gong
 * @date 2016/5/4
 */
@Component
public class AppInterceptor extends HandlerInterceptorAdapter {

    Logger logger = LoggerFactory.getLogger(AppInterceptor.class);

    @Reference(version = "1.0.0")
    private UserService userService;

    @Autowired
    private RedisAppTokenUtil redisAppTokenUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Integer userId = Integer.parseInt(request.getHeader("userId"));
        String appToken = request.getHeader("appToken");
        boolean flag = false;
        AppResult result = new AppResult();
        if (ObjectUtils.isNotNull(userId) && ObjectUtils.isNotNull(appToken)) {
            Object cacheToken = redisAppTokenUtil.getAppToken(userId);//从缓存中获取 token
            if (ObjectUtils.isNotNull(cacheToken)) {
                flag = appToken.equals(String.valueOf(cacheToken));
            } else {
                User user = userService.selectByPrimaryKey(userId);
                flag = appToken.equals(user.getAppToken());
                if (flag) {
                    //将 token 写入缓存
                    redisAppTokenUtil.putAppToken(userId, appToken);
                } else {
                    flag = false;
                }
            }
        }
        if (!flag) {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();
            result.markError("token 验证失败");
            out.print(JSONObject.toJSONString(result));
        }
        return flag;
    }
}
