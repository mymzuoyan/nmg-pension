package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.ipccp.entity.Ipccpcdr;
import com.fedtech.pension.ipccp.service.IpccpcdrService;
import com.fedtech.pension.call.entity.CallBack;
import com.fedtech.pension.call.entity.CallInfo;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.entity.CustomerRelate;
import com.fedtech.pension.call.service.CallInfoService;
import com.fedtech.pension.call.service.CustomerService;
import com.fedtech.pension.call.vo.MonitorInfo;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderLinkManService;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/13
 */
@Controller
@RequestMapping("/admin/call/")
public class IndexController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(IndexController.class);

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Reference(version = "1.0.0")
    private CustomerService customerService;

    @Reference(version = "1.0.0")
    private CallInfoService callInfoService;
    @Reference(version = "1.0.0")
    private ElderLinkManService elderLinkManService;
    //
    @Reference(version = "1.0.0")
    private IpccpcdrService ipccpcdrService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @RequestMapping("index")
    public String showIndex() {
        return ADMIN_CALL_PREFIX + "call_index";
    }

    @RequestMapping("home")
    public String showHome() {
        return ADMIN_CALL_PREFIX + "call_home";
    }


    @RequestMapping("nowCallInfo")
    public String showNowCallInfo(CallInfo callInfo, String createTimeStr, Model model) {
        if (ObjectUtils.isNull(callInfo.getCallerId())) {
            //判断当前状态：
            String param = "agentid=" + currentUser().getLogin_name();
            String sr = HttpRequest.sendGet(Keys.IP + "//cti/lt_agent_get_agent_state.php", param);
            if (sr.equals("1")) {
                MonitorInfo monitorInfo = (MonitorInfo) callInfoService.getMonitorInfo(currentUser().getLogin_name());
                if (ObjectUtils.isNotNull(monitorInfo.getCallBack())) {
                    //todo 回拨
                    CallBack back = monitorInfo.getCallBack();
                    Integer type = (back.getType()) + 1;
                    param = "?createTimeStr=" + df.format(back.getCreateTime()) +
                            "&queueName=" + back.getQueueName() +
                            "&monitorName=" + back.getMonitorName() +
                            "&extension=" + back.getExtension() +
                            "&callerId=" + back.getCallerId() +
                            "&uniqueId=" + back.getUniqueId() +
                            "&linkedId=" + back.getLinkedId() +
                            "&type=" + type;
                    return "redirect:" + "/admin/call/nowCallInfo" + param;
                } else {
                    //todo 通话中
                    Ipccpcdr ipccpcdr = ipccpcdrService.selectOneByAgentId(currentUser().getLogin_name());
                    if (ObjectUtils.isNotNull(ipccpcdr)) {
                        param = "?createTimeStr=" + df.format(ipccpcdr.getRingtime()) +
                                "&queueName=" + ipccpcdr.getQueue() +
                                "&monitorName=" + ipccpcdr.getAgentid() +
                                "&extension=" + ipccpcdr.getExtension() +
                                "&callerId=" + ipccpcdr.getCallerid() +
                                "&uniqueId=" + ipccpcdr.getUniqueid() +
                                "&linkedId=" + ipccpcdr.getLinkedid() +
                                "&type=1";
                        return "redirect:" + "/admin/call/nowCallInfo" + param;
                    }
                }
            }
            return ADMIN_CALL_PREFIX + "call_nowCallInfo";
        }
        if (Strings.isNullOrEmpty(createTimeStr)) {
            try {
                callInfo.setCreateTime(df.parse(createTimeStr));//呼入时间
            } catch (ParseException e) {
                e.printStackTrace();
                callInfo.setCreateTime(new Date());
            }
        } else {
            callInfo.setCreateTime(new Date());
        }
        model.addAttribute("createTimeStr", createTimeStr);
        if (!Strings.isNullOrEmpty(callInfo.getUniqueId())) {
            if (Strings.isNullOrEmpty(callInfo.getLinkedId())) {
                callInfo.setLinkedId(callInfo.getUniqueId());
            }
            CallInfo callInfo1 = callInfoService.selectByUniqueId(callInfo.getUniqueId());
            if (ObjectUtils.isNotNull(callInfo1)) {
                model.addAttribute("callInfo", callInfo1);
            } else {
                callInfo.setAnswerTime(new Date());
                callInfo = callInfoService.insertBackId(callInfo);
                model.addAttribute("callInfo", callInfo);
            }
            Customer customer = customerService.selectByCallNum(callInfo.getCallerId());
            if (ObjectUtils.isNotNull(customer)) {
                //获取该客户的相关联系人
                CustomerRelate filter = new CustomerRelate();
                filter.setRelateCustomerId(customer.getId());
                ElderLinkMan elderLinkMan = new ElderLinkMan();
                elderLinkMan.setElderId(customer.getElderId());
                List<ElderLinkMan> elderLinkManes = elderLinkManService.getAllRecode(elderLinkMan);
                model.addAttribute(customer);
                if (ObjectUtils.isNotNull(elderLinkManes))
                    model.addAttribute("customerRelate", elderLinkManes.get(0));
                ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(customer.getElderId());
                if (ObjectUtils.isNotNull(elderlyMsg)) {
                    model.addAttribute("elderlyMsg", elderlyMsg);
                }

            }

        }
        return ADMIN_CALL_PREFIX + "call_nowCallInfo";
    }

    /**
     * 显示历史服务记录
     *
     * @return
     */
    @RequestMapping("list")
    public String showCallList(@RequestParam(value = "method", required = false, defaultValue = "new") String method) {
        if (method.equals("new")) {
            return ADMIN_CALL_PREFIX + "call_list";
        } else {
            return ADMIN_CALL_PREFIX + "old_call_list";
        }

    }


    /**
     * 显示异常服务记录
     *
     * @return
     */
    @RequestMapping("abnormal/list")
    public String showCallAbnormalList() {
        return ADMIN_CALL_PREFIX + "call_abnormal_list";

    }

    /**
     * 显示数据统计
     *
     * @return
     */
    @RequestMapping("call_statistics")
    public String showStatistics() {
        return ADMIN_CALL_PREFIX + "call_statistics";
    }

    /**
     * 显示坐席人员的数据统计
     *
     * @return
     */
    @RequestMapping("monitor_statistics")
    public String showStatisticsForMonitor() {
        return ADMIN_CALL_PREFIX + "monitor_statistics";

    }


}
