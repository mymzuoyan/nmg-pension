package com.fedtech.pension.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.pension.sys.service.SmsLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author gengqiang
 * @date 2018/4/12
 */
@RequestMapping("/api/")
@Controller
public class CommentController {


    @Reference(version = "1.0.0")
    private SmsLogService smsLogService;


    /**
     * 发送验证码
     *
     * @param phone
     * @param num
     * @return
     */
    @RequestMapping(value = "sendVerificationCode", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendVerificationCode(HttpServletRequest request, @RequestParam("phone") String phone, @RequestParam("num") String num) {
        AppResult result = new AppResult();
        String ip = request.getRemoteAddr();
        String resultStr = smsLogService.sendYZM(phone, num, ip);
        if ("true".equals(resultStr)) {
            result.markSuccess("发送成功", null);
        } else {
            result.markError(resultStr);
        }
        return result;
    }

}
