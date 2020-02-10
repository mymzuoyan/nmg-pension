package com.fedtech.pension.mobile.api;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.AlipayKeys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.quantity.PayTypeQuantity;
import com.fedtech.pension.org.service.ServiceOrgBalanceService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import com.github.binarywang.wxpay.bean.WxPayOrderNotifyResponse;
import com.github.binarywang.wxpay.bean.result.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.service.WxPayService;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by gengqiang on 2017/7/11.
 */
@Controller
@RequestMapping("/api/")
public class PayController {

    protected Logger logger = LoggerFactory.getLogger(PayController.class);

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private ServiceOrgBalanceService serviceOrgBalanceService;

    @Resource(name = "wxPayService")
    private WxPayService wxPayService;


    @RequestMapping("alipay/notify")
    @ResponseBody
    public String AlipayNotify(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, IOException {
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        boolean flag = AlipaySignature.rsaCheckV1(params, AlipayKeys.ALIPAY_PUBLIC_KEY, "utf-8", "RSA2");
        if (flag) {
            //更新状态
            String trade_no = params.get("out_trade_no");
            if (updateTaskAndNotice(trade_no, PayTypeQuantity.ZHIFUBAOPAYMENT)) {
                return "success";
            }
        }
        return "";
    }

    @RequestMapping("wxpay/notify")
    @ResponseBody
    public String WxpayNotify(HttpServletRequest request, HttpServletResponse response) {
        try {
            String xmlResult = IOUtils.toString(request.getInputStream(), request.getCharacterEncoding());
            WxPayOrderNotifyResult result = wxPayService.getOrderNotifyResult(xmlResult);
            // 结果正确
            String orderId = result.getOutTradeNo();
            if (updateTaskAndNotice(orderId, PayTypeQuantity.WECHATPAYMENT)) {
                return WxPayOrderNotifyResponse.success("处理成功");
            } else {
                return WxPayOrderNotifyResponse.fail("处理失败");
            }
        } catch (Exception e) {
            logger.error("微信结果回调异常，异常原因{}", e.getMessage());
            return WxPayOrderNotifyResponse.fail(e.getMessage());
        }
    }


    public synchronized boolean updateTaskAndNotice(String trade_no, Integer type) {
        Task old = taskService.findByNumber(trade_no);
        if (TaskQuantity.PAY.equals(old.getStatus())) {
            Task task = new Task();
            task.setId(old.getId());
            task.setStatus(TaskQuantity.COMPLETE);
            task.setPayType(type);
            task.setPayTime(new Date());
            task.setUpdateTime(new Date());
            task.setReceiverServiceOrg(old.getReceiverServiceOrg());
            task.setReceiverName(old.getReceiverName());
            if (taskService.updateByPrimaryKeySelective(task)) {
                Task cache = (Task) taskService.getCache(task.getId());
                //更新缓存
                cache.setStatus(TaskQuantity.COMPLETE);
                cache.setPayType(type);
                cache.setPayTime(new Date());
                cache.setUpdateTime(new Date());
                taskService.updateCache(cache);
                TaskReceive taskReceive = taskReceiveService.getTaskByTaskIdAndRole(cache.getId(), RoleType.ServiceUser.getId());
                //推送
                if (ObjectUtils.isNotNull(taskReceive)) {
                    taskService.sendTasktoUser(cache, 0, "", taskReceive.getReceiverId(), 4);
                }
                //组织增加金额
                if (ObjectUtils.isNotNull(taskReceive)) {
                    User user = userService.selectByPrimaryKey(taskReceive.getReceiverId());
                    if (ObjectUtils.isNotNull(user)) {
                        return serviceOrgBalanceService.addBalance(Integer.parseInt(user.getServiceOrgId()), cache.getMoney(), type);
                    }
                }
                return true;
            }
        }
        return false;
    }
}
