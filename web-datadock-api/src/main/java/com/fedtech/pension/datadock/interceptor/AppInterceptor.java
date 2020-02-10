package com.fedtech.pension.datadock.interceptor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.datadock.redis.RedisAppTokenUtil;
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
        AppResult result = new AppResult();
        boolean flag = false;
        Integer userId = 0;
        try {
            userId = Integer.parseInt(request.getHeader("userId"));
        } catch (NumberFormatException e) {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();
            result.markError("请输入正确的userId");
            out.print(JSONObject.toJSONString(result));
            return flag;
        }
        String appToken = request.getHeader("token");
        if (ObjectUtils.isNotNull(userId) && ObjectUtils.isNotNull(appToken)) {
            Object cacheToken = redisAppTokenUtil.getAppToken(userId);//从缓存中获取 token
            if (ObjectUtils.isNotNull(cacheToken)) {
                flag = appToken.equals(String.valueOf(cacheToken));
            } else {
                response.setContentType("application/json;charset=utf-8");
                PrintWriter out = response.getWriter();
                result.markError("token已过期");
                out.print(JSONObject.toJSONString(result));
                return flag;
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
