package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DateUtil;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.CallBack;
import com.fedtech.pension.call.entity.CallInfo;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.entity.ReturnVisit;
import com.fedtech.pension.call.service.*;
import com.fedtech.pension.call.vo.MonitorInfo;
import com.fedtech.pension.cdr.entity.Cdr;
import com.fedtech.pension.cdr.service.CdrService;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.ipccp.entity.Abandoned;
import com.fedtech.pension.ipccp.service.AbandonedService;
import com.fedtech.pension.org.service.ServiceOrgCardDataService;
import com.fedtech.pension.power.service.MoneyflowService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import com.fedtech.pension.task.service.TaskPlanService;
import com.fedtech.pension.task.service.TaskService;
import com.google.common.base.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author CodingQiang
 * @date 2016/10/14
 */
@Controller
@RequestMapping("/admin/call/api/callInfo/")
public class CallInfoApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(CallInfoApiController.class);

    SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Reference(version = "1.0.0")
    private CallInfoService callInfoService;

    @Reference(version = "1.0.0")
    private CdrService cdrService;

    @Reference(version = "1.0.0")
    private AbandonedService abandonedService;

    @Reference(version = "1.0.0")
    private CallBackService callBackService;

    @Reference(version = "1.0.0")
    private MonitorService monitorService;

    @Reference(version = "1.0.0")
    private CustomerService customerService;

    @Reference(version = "1.0.0")
    private ReturnVisitService returnVisitService;

    @Reference(version = "1.0.0")
    private ServiceOrgCardDataService serviceOrgCardDataService;

    @Reference(version = "1.0.0")
    private MoneyflowService moneyflowService;

    @Value("${callInfo.type.in}")
    private Integer TYPE_IN;

    @Value("${callInfo.type.out}")
    private Integer TYPE_OUT;

    /**
     * 获取12349呼叫记录
     *
     * @param page
     * @param info
     * @param content
     * @param startDateStr
     * @param endDateStr
     * @param startTimeStr
     * @param endTimeStr
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "查看呼叫记录")
    public JsonResult getCallInfoList(Integer page, CallInfo info, String content, String startDateStr, String endDateStr, String startTimeStr, String endTimeStr) {
        JsonResult result = new JsonResult();
        JSONObject jo = new JSONObject();
        PageRequest pageRequest = new PageRequest();
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        if (page < 1) {
            page = 1;
        }
        pageRequest.setStart(10 * (page - 1));
        pageRequest.setLength(10);
        if (!Strings.isNullOrEmpty(startDateStr)) {
            if (!Strings.isNullOrEmpty(startTimeStr)) {
                startDateStr += " " + startTimeStr.substring(0, startTimeStr.lastIndexOf(" ")) + ":00";
            } else {
                startDateStr += " 00:00:00";
            }
            try {
                info.setCreateTime(dateTime.parse(startDateStr));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (!Strings.isNullOrEmpty(endDateStr)) {
            if (!Strings.isNullOrEmpty(endTimeStr)) {
                endDateStr += " " + endTimeStr.substring(0, endTimeStr.lastIndexOf(" ")) + ":00";
            } else {
                endDateStr += " 23:59:59";
            }
            try {
                info.setEndTime(dateTime.parse(endDateStr));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        info.setUniqueId("1");//获取所有的工单（uniquedid和linkedId一样）
        PageResponse infos = callInfoService.selectPageList(info, pageRequest);
        int count = infos.getRecordsFiltered();
        List<CallInfo> callInfos = infos.getData();
        List<String> unqiueds = new ArrayList<>();
        List<CallInfo> linkedCall = new ArrayList<>();
        //获取工单相应的处理
        for (CallInfo c : callInfos) {
            unqiueds.add(c.getUniqueId());
        }
        if (ObjectUtils.isNotNull(unqiueds)) {
            linkedCall = callInfoService.selectLinkedCall(unqiueds);
        }
        jo.put("totalPage", count % 10 > 0 ? count / 10 + 1 : count / 10);
        jo.put("infos", infos.getData());
        if (ObjectUtils.isNotNull(linkedCall)) {
            jo.put("linkedCall", linkedCall);
        }
        jo.put("count", count);
        result.markSuccess("获取成功", jo);
        return result;
    }


    /**
     * 获取12349异常工单
     *
     * @param page
     * @param info
     * @return
     */
    @RequestMapping(value = "AbnormalList", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "查看异常工单")
    public JsonResult getCallInfoAbnormalList(Integer page, CallInfo info) {
        JsonResult result = new JsonResult();
        JSONObject jo = new JSONObject();
        PageRequest pageRequest = new PageRequest();
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        if (page < 1) {
            page = 1;
        }
        pageRequest.setStart(10 * (page - 1));
        pageRequest.setLength(10);
        info.setUniqueId("1");//获取所有的工单（uniquedid和linkedId一样）
        info.setStatus(0);
        Calendar end = Calendar.getInstance();
        end.add(Calendar.DAY_OF_MONTH, -2);
        info.setEndTime(end.getTime());
        PageResponse infos = callInfoService.selectPageList(info, pageRequest);
        int count = infos.getRecordsFiltered();
        List<CallInfo> callInfos = infos.getData();
        List<String> unqiueds = new ArrayList<>();
        List<CallInfo> linkedCall = new ArrayList<>();
        //获取工单相应的处理
        for (CallInfo c : callInfos) {
            unqiueds.add(c.getUniqueId());
        }
        if (ObjectUtils.isNotNull(unqiueds)) {
            linkedCall = callInfoService.selectLinkedCall(unqiueds);
        }
        jo.put("totalPage", count % 10 > 0 ? count / 10 + 1 : count / 10);
        jo.put("infos", infos.getData());
        if (ObjectUtils.isNotNull(linkedCall)) {
            jo.put("linkedCall", linkedCall);
        }
        jo.put("count", count);
        result.markSuccess("获取成功", jo);
        return result;
    }

    /**
     * 添加通话记录处理信息
     *
     * @return
     */
    @RequestMapping(value = "addHandle", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加通话记录处理信息")
    public JsonResult addCallInfoHandle(CallInfo info, Integer visitResult) {
        JsonResult result = new JsonResult();
        info.setHandleTime(new Date());
        if (visitResult != null) {
            info.setRequest("4");//投诉监管
            info.setRequestName("逐一服务回访");
        }
        if (callInfoService.updateByPrimaryKeySelective(info)) {
            if (visitResult != null) {
                //回访
                returnVisitService.updateResultByCallInfoId(visitResult, info.getId());
            }
            result.markSuccess("处理完成", null);
        } else {
            result.markError("填写处理情况失败");
        }
        return result;
    }


    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(CallInfo info) {
        JsonResult result = new JsonResult();
        if (ObjectUtils.isNotNull(info.getStatus()) && info.getStatus() == 1) {
            //完结工单
            info.setEndTime(new Date());
        }
        if (callInfoService.updateByPrimaryKeySelective(info)) {
            result.markSuccess("更新成功", null);
            return result;
        }
        result.markError("更新失败");
        return result;
    }


    @RequestMapping(value = "updateCallInfoByUniqueId", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateCallInfoByUniqueId(String uniqueId) {
        JsonResult result = new JsonResult();
        if (!Strings.isNullOrEmpty(uniqueId)) {
            Cdr cdr = cdrService.selectByUniqueId(uniqueId);
            CallInfo info = callInfoService.selectByUniqueId(uniqueId);
            if (ObjectUtils.isNotNull(cdr) && ObjectUtils.isNotNull(info)) {
                info.setAnswerTime(cdr.getAnswer());
                info.setCreateTime(cdr.getStart());
                if (!StringUtils.isEmpty(cdr.getRecording())) {
                    info.setRecording(Keys.IPLOADURL + cdr.getRecording());
                }
                info.setEvaluateStar(cdr.getServicelevel());
                if (callInfoService.updateByPrimaryKeySelective(info)) {
                    result.markSuccess("更新成功", null);
                    return result;
                }
            }
        }

        result.markError("更新失败");
        return result;
    }


    /**
     * @param pageRequest
     * @return
     */
//    @RequestMapping(value = "abandonedList", method = RequestMethod.POST)
//    @ResponseBody
//    public List<Abandoned> getCustomerList(Abandoned abandoned, PageRequest pageRequest) {
//        List<Abandoned> userAbanon = new ArrayList<>();
//        //判断
//        List<Abandoned> abandoneds = abandonedService.selectAbandoneds(abandoned, pageRequest);
//        for (Abandoned abandoned1 : abandoneds) {
//            Customer customer = customerService.selectByCallNum(abandoned1.getCallerid());
//            if (ObjectUtils.isNotNull(customer)) {
//                if (ObjectUtils.isNotNull(customer.getBeeperAddress()) && customer.getBeeperAddress().contains(currentUser().getAreaName())) {
//                    userAbanon.add(abandoned1);
//                }
//            } else {
//                userAbanon.add(abandoned1);
//            }
//        }
//        return userAbanon;
//    }

    @RequestMapping(value = "abandonedList", method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> getCustomerList(String queueName, PageRequest pageRequest) {
        List<Map<String,Object>> userAbanon = cdrService.selectQueueData(queueName);
        return userAbanon;
    }

    /**
     * @return
     */
    @RequestMapping(value = "handleAbandonedCall", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult handleAbandonedCall(Integer abandonedId, String agentId, String extension) {
        JsonResult result = new JsonResult();
        Abandoned abandoned = abandonedService.selectByPrimaryKey(abandonedId);
        if (!ObjectUtils.isNotNull(abandoned)) {
            result.markError("未找到该通话记录");
            return result;
        }
        if (abandoned.getCallbacked()) {
            result.markError("已响应");
            return result;
        }
        abandoned.setCallbacked(true);
        if (abandonedService.updateByPrimaryKeySelective(abandoned)) {
            CallBack callBack = new CallBack();
            callBack.setCreateTime(abandoned.getQtime());
            callBack.setCallerId(abandoned.getCallerid());
            callBack.setQueueName(abandoned.getQueue());
            callBack.setMonitorName(agentId);
            callBack.setExtension(extension);
            callBack.setType(1);
            if (callBackService.insert(callBack)) {
                result.markSuccess("响应成功", callBack);
                return result;
            }
        }
        return result;
    }


    /**
     * 需要用户回拨的列表
     *
     * @param back
     * @return
     */
    @RequestMapping(value = "needCallBackList", method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> needCallBackList(CallBack back, String agentnum, String pstnnumber) {
//        List<CallBack> backs = callBackService.getAllRecode(back);
        if("".equals(pstnnumber)){
            pstnnumber = null;
        }
        List<Map<String,Object>> backs = cdrService.selectMyRecord(agentnum,pstnnumber);
        return backs;
    }

    @RequestMapping(value = "callBack", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "回拨电话")
    public JsonResult callBack(Integer callBackId, String callerId, String agentId, String extension, String linkedId) {
        JsonResult result = new JsonResult();
        String param = "extension=" + extension + "&dest=" + callerId;
        String sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_placecall.php", param);
        switch (sr) {
            case "0":
                CallBack callBack = null;
                if (ObjectUtils.isNotNull(callBackId)) {
                    callBack = callBackService.selectByPrimaryKey(callBackId);
                    if (ObjectUtils.isNotNull(callBack)) {
                        MonitorInfo monitorInfo = callInfoService.getMonitorInfo(agentId);
                        monitorInfo.setCallBack(callBack);
                        callInfoService.putMonitorInfo(agentId, monitorInfo);
                    }
                    callBackService.deleteByPrimaryKey(callBackId);
                } else {
                    if (!StringUtils.isEmpty(linkedId)) {
                        CallInfo info = callInfoService.selectByUniqueId(linkedId);
                        callBack = new CallBack();
                        callBack.setCreateTime(info.getCreateTime());
                        callBack.setExtension(info.getExtension());
                        callBack.setCallerId(info.getCallerId());
                        callBack.setQueueName("out");
                        callBack.setType(1);
                        callBack.setMonitorName(info.getMonitorName());

                        //存缓存
                        MonitorInfo monitorInfo = callInfoService.getMonitorInfo(agentId);
                        monitorInfo.setCallBack(callBack);
                        monitorInfo.setLinkedId(linkedId);
                        callInfoService.putMonitorInfo(agentId, monitorInfo);
                    } else {
                        callBack = new CallBack();
                        callBack.setCreateTime(new Date());
                        callBack.setCallerId(callerId);
                        callBack.setMonitorName(agentId);
                        callBack.setExtension(extension);
                        callBack.setQueueName("out");
                        callBack.setType(1);

                        //存缓存
                        MonitorInfo monitorInfo = (MonitorInfo) callInfoService.getMonitorInfo(agentId);
                        monitorInfo.setCallBack(callBack);
                        monitorInfo.setLinkedId(linkedId);
                        callInfoService.putMonitorInfo(agentId, monitorInfo);
                    }
                }
//                成功
                result.markSuccess("回拨成功", null);
                break;
            case "1":
                result.markError("回拨失败");
                break;
            default:
                result.markError("回拨失败");
                break;
        }
        return result;
    }


    @RequestMapping(value = "returnVisit", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "回访")
    public JsonResult returnVisit(String callerId, String agentId, String extension, ReturnVisit returnVisit) {
        JsonResult result = new JsonResult();
        String param = "extension=" + extension + "&dest=" + callerId;
        String sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_placecall.php", param);
        switch (sr) {
            case "0":
                CallBack callBack = null;
                callBack = new CallBack();
                callBack.setCreateTime(new Date());
                callBack.setCallerId(callerId);
                callBack.setMonitorName(agentId);
                callBack.setExtension(extension);
                callBack.setQueueName("out");
                callBack.setType(2);

                //存缓存
                MonitorInfo monitorInfo = (MonitorInfo) callInfoService.getMonitorInfo(agentId);
                monitorInfo.setCallBack(callBack);
                monitorInfo.setLinkedId("");
                returnVisit.setCreatorId(currentUser().getUid());
                monitorInfo.setReturnVisit(returnVisit);
                callInfoService.putMonitorInfo(agentId, monitorInfo);

                //成功
                result.markSuccess("回访成功", null);
                break;
            case "1":
                result.markError("回访失败");
                break;
            default:
                result.markError("回访失败");
                break;
        }
        return result;
    }


    /**
     * 对通话纪录进行数据分析
     *
     * @param dataType
     * @param timeType
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping(value = "getCallInfoStatistics", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getCallInfoStatistics(String dataType, String timeType, String startTime, String endTime) {
        JsonResult result = new JsonResult();
        Map<String, Map<String, Integer>> data = null;
        try {
            data = callInfoService.getCallInfoStatistics(currentUser().getAreaName(), dataType, timeType, startTime, endTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (ObjectUtils.isNotNull(data)) {
            result.markSuccess("success", data);
        } else {
            result.markError("error");
        }

        return result;
    }


    @RequestMapping(value = "getMonitorStatistics", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject getMonitorStatistics() {
        JSONObject result = new JSONObject();
        Subject currentUser = SecurityUtils.getSubject();
        JSONArray ja = new JSONArray();
        if (currentUser.hasRole(RoleType.MonitorUser.getValue())) {
            //只显示登录坐席的数量
            JSONObject data = new JSONObject();
            data.put("account", currentUser().getLogin_name());
            data.put("name", currentUser().getNick_name());
            CallInfo callInfo = new CallInfo();
            callInfo.setType(1);//呼入
            callInfo.setMonitorName(currentUser().getLogin_name());
            data.put("in", callInfoService.count(callInfo));
            callInfo.setType(2);//回拨
            data.put("out", callInfoService.count(callInfo));
            data.put("all", data.getInteger("in") + data.getInteger("out"));
            ja.add(data);
        } else {
            Monitor filter = new Monitor();
            filter.setAreaName(currentUser().getAreaName());
            List<Monitor> monitors = monitorService.getAllRecode(filter);
//            Map<String, Long> ins = callInfoService.countByMonitors(monitors, 1);
 //           Map<String, Long> outs = callInfoService.countByMonitors(monitors, 2);
 //           for (int i = 0; i < monitors.size(); i++) {
 //               Monitor monitor = monitors.get(i);
 //               JSONObject data = new JSONObject();
 //               data.put("account", monitor.getAccount());
 //               data.put("name", monitor.getName());
  //              data.put("in", ins.get(monitor.getAccount()) == null ? 0 : ins.get(monitor.getAccount()));
  //              data.put("out", outs.get(monitor.getAccount()) == null ? 0 : outs.get(monitor.getAccount()));
  //              data.put("all", data.getInteger("in") + data.getInteger("out"));
  //              ja.add(data);
            JSONObject data = new JSONObject();
            data.put("account", "如花");
            data.put("name", "美眷");
            data.put("in", 0);
            data.put("out",0);
            data.put("all", 0);
            ja.add(data);
  //          }
        }
        result.put("data", ja);
        return result;
    }


    /**
     * 获取当月坐席人员的数据统计
     *
     * @return
     */
    @RequestMapping(value = "getMonitorStatisticsByMonth", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject getMonitorStatisticsByMonth() {
        JSONObject result = new JSONObject();
        JSONArray ja = new JSONArray();
        Monitor filter = new Monitor();
        List<Monitor> monitors = monitorService.getAllRecode(filter);
        Calendar c = Calendar.getInstance();
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.getActualMinimum(Calendar.DAY_OF_MONTH));
        Date startTime = c.getTime();
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date endTime = c.getTime();
        Map<String, Long> ins = callInfoService.countByMonitorsByTime(monitors, 1, startTime, endTime);
        Map<String, Long> visits = callInfoService.countByMonitorsByTime(monitors, 3, startTime, endTime);
        for (int i = 0; i < monitors.size(); i++) {
            Monitor monitor = monitors.get(i);
            JSONObject data = new JSONObject();
            data.put("account", monitor.getAccount());
            data.put("name", monitor.getName());
            data.put("in", ins.get(monitor.getAccount()) == null ? 0 : ins.get(monitor.getAccount()));
            data.put("visit", visits.get(monitor.getAccount()) == null ? 0 : visits.get(monitor.getAccount()));
            data.put("all", data.getInteger("in") + data.getInteger("visit"));
            ja.add(data);
        }
        result.put("data", ja);
        return result;
    }

    /**
     * 当月 满意度 统计
     *
     * @return
     */
    @RequestMapping(value = "getEvaluateStatisticsByMonth", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> getEvaluateStatisticsByMonth() {
        return callInfoService.getEvaluateStatisticsByMonth();
    }


    //座席将自己正在接听的电话转接到评分ivr上。
    @RequestMapping(value = "transfer2score", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult transfer2score(String extension) {
        JsonResult result = new JsonResult();
        String param = "extension=" + extension;
        String sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_transfer2score.php", param);
        switch (sr) {
            case "0":
                result.markSuccess("转接成功", null);
                break;
            case "1":
                result.markError("转接失败");
                break;
        }
        return result;
    }

    /**
     * 驻留
     *
     * @param extension
     * @return
     */
    @RequestMapping(value = "hold", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult hold(String extension) {
        JsonResult result = new JsonResult();
        String param = "extension=" + extension;
        String sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_put_on_hold.php", param);
        switch (sr) {
            case "0":
                result.markSuccess("驻留成功", null);
                break;
            case "1":
                result.markError("驻留失败");
                break;
        }
        return result;
    }

    /**
     * 拾取
     *
     * @param extension
     * @return
     */
    @RequestMapping(value = "resume", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult resume(String extension) {
        JsonResult result = new JsonResult();
        //先获取驻留号码
        String param = "extension=" + extension;
        String sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_list_on_hold_extension.php", param);
        if (sr != null && sr != "") {
            if (sr.split("#").length > 1) {
                //多个驻留号码

            } else if (sr.split("#").length == 1) {
                System.out.println(sr.split("#")[0]);
                System.out.println(sr.split("#")[0].split("|")[0]);
                String parkext = sr.split("#")[0].split("|")[0];
                //1个驻留号码
//                param = "parkext=" + parkext + "&extension=" + extension;
//                sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_resume_from_hold.php", param);
//                switch (sr) {
//                    case "0":
//                        result.markSuccess("拾起成功", null);
//                        break;
//                    case "1":
//                        result.markError("拾起失败");
//                        break;
//                }
            } else {
                result.markError("拾起失败");
            }
        }
        return result;
    }

    /**
     * 拾取特定电话
     *
     * @param extension
     * @return
     */
    @RequestMapping(value = "resumeOne", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult resumeOne(String parkext, String extension) {
        JsonResult result = new JsonResult();
        String param = "parkext=" + parkext + "&extension=" + extension;
        String re = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_resume_from_hold.php", param);
        switch (re) {
            case "0":
                result.markSuccess("拾起成功", null);
                break;
            case "1":
                result.markError("拾起失败");
                break;
            default:
                result.markError("拾起失败");
                break;
        }
        return result;
    }


    /**
     * 监听电话 采用coach模式（插入）
     *
     * @param monitor
     * @param extension
     * @return
     */
    @RequestMapping(value = "insertCall", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult insertCall(String monitor, String extension) {
        JsonResult result = new JsonResult();
        String param = "monitor=" + monitor + "&extension=" + extension;
        String re = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_coach_monitorcall.php", param);
        switch (re) {
            case "0":
                result.markSuccess("插入成功", null);
                break;
            case "1":
                result.markError("插入失败");
                break;
            default:
                result.markError("插入失败");
                break;
        }
        return result;
    }

    /**
     * 监听电话 采用slient模式
     *
     * @param monitor
     * @param extension
     * @return
     */
    @RequestMapping(value = "monitorCall", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult monitorCall(String monitor, String extension) {
        JsonResult result = new JsonResult();
        String param = "monitor=" + monitor + "&extension=" + extension;
        String re = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_silent_monitorcall.php", param);
        switch (re) {
            case "0":
                result.markSuccess("监听成功", null);
                break;
            case "1":
                result.markError("监听失败");
                break;
            default:
                result.markError("监听失败");
                break;
        }
        return result;
    }


    /**
     * 转接电话(询转)
     *
     * @param external
     * @param extension
     * @param dest
     * @return
     */
    @RequestMapping(value = "transferCall", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult transferCall(String external, String extension, String dest) {
        JsonResult result = new JsonResult();
        String param = "external=" + external + "&extension=" + extension + "&dest=" + dest;
        String re = HttpRequest.sendGet(Keys.IP + "/cti/lt_phone_consultation_transfercall.php", param);
        switch (re) {
            case "0":
                result.markSuccess("转接成功", null);
                break;
            case "1":
                result.markError("转接失败");
                break;
            default:
                result.markError("转接失败");
                break;
        }
        return result;
    }


    @RequestMapping(value = "getDataByDate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> getDataByDate() {

        return callInfoService.getDataByDate();
    }


    /**
     * 统计
     *
     * @return
     */
    @RequestMapping(value = "getCardInfoStatistics")
    @ResponseBody
    public Map<String, Integer> getCardInfoStatistics() {
        int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Integer> map = new LinkedHashMap<>();
        for (int i = days[new Date().getMonth()]; i >= 0; i--) {
            String date=df.format(DateUtil.getAddDate(-i));
            map.put(df.format(DateUtil.getAddDate(-i)),moneyflowService.countMoneyFlowBydate(date) );
//            ServiceOrgCardData serviceOrgCardData = new ServiceOrgCardData();
//            serviceOrgCardData.setWriteDate(DateUtil.getAddDate(-i));
//            map.put(df.format(DateUtil.getAddDate(-i)),serviceOrgCardDataService.count(serviceOrgCardData));
        }
        return map;
    }

}
