package com.fedtech.pension.annotation;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.Keys;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.service.UserLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;

/**
 * 切点类
 *
 * @author CoderQiang
 * @date 2017/1/16
 */
@Aspect
@Component
public class SystemLogAspect {

    @Reference(version = "1.0.0")
    private UserLogService logService;

    /**
     * 本地异常日志记录对象
     */
    private static final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);

    /**
     * Service层切点
     */
    @Pointcut("@annotation(com.fedtech.pension.annotation.SystemServiceLog)")
    public void serviceAspect() {
    }

    /**
     * Controller层切点
     */
    @Pointcut("@annotation(com.fedtech.pension.annotation.SystemControllerLog)")
    public void controllerAspect() {
    }


    /**
     * 前置通知 用于拦截Controller层记录用户的操作
     *
     * @param joinPoint 切点
     */
    @After("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //读取session中的用户
        User user = (User) request.getSession().getAttribute(Keys.LOGIN_USER);
        //请求的IP
        String ip = request.getRemoteAddr();
        try {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            UserLog log = new UserLog();
            log.setDescription(getControllerMethodDescription(joinPoint));
            log.setIp(ip);
            //获取方法名
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = signature.getName();
            HashMap<String,String> action = new HashMap<>();
            action.put("method",className + "." + methodName + "()");
            //获取请求参数
            Object[] args = joinPoint.getArgs();
            try {
                String params = new ObjectMapper().writeValueAsString(args[0]);
                action.put("params",params);

            } catch (Exception ex) {
            }
            //获取执行时间
            log.setAction(JacksonUtil.bean2Json(action));
            log.setUid(user.getUid());
            log.setCreateTime(new Date());
            //保存数据库
            logService.insert(log);
        } catch (Exception e) {
        }
    }

    /**
     * 异常通知 用于拦截service层记录异常日志
     *
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //读取session中的用户
        User user = (User) request.getSession().getAttribute(Keys.LOGIN_USER);
        String ip = request.getRemoteAddr();
        //获取用户请求方法的参数并序列化为JSON格式字符串
        String params = "";
        if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
            for (int i = 0; i < joinPoint.getArgs().length; i++) {
                params += JSON.toJSONString(joinPoint.getArgs()[i]) + ";";
            }
        }
        try {
            UserLog log = new UserLog();
            log.setDescription(getServiceMthodDescription(joinPoint));
            log.setAction((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            log.setUid(user.getUid());
            log.setCreateTime(new Date());
            //保存数据库
            logService.insert(log);
        } catch (Exception ex) {
        }

    }


    /**
     * 获取注解中对方法的描述信息 用于service层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static String getServiceMthodDescription(JoinPoint joinPoint)
            throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(SystemServiceLog.class).description();
                    break;
                }
            }
        }
        return description;
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static String getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(SystemControllerLog.class).description();
                    break;
                }
            }
        }
        return description;
    }
}