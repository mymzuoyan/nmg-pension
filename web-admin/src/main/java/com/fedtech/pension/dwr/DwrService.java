package com.fedtech.pension.dwr;

import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.ipccp.entity.Abandoned;
import com.fedtech.pension.ipccp.entity.Ipccpcdr;
import com.fedtech.pension.ipccp.service.AbandonedService;
import com.fedtech.pension.ipccp.service.IpccpcdrService;
import com.fedtech.pension.call.entity.CallBack;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.service.CallBackService;
import com.fedtech.pension.call.service.CustomerService;
import com.fedtech.pension.call.vo.MonitorInfo;
import com.fedtech.pension.redis.RedisCallInfoUtil;
import com.fedtech.pension.redis.RedisDispatchCountUtil;
import com.fedtech.pension.redis.RedisMonitorUtil;
import com.google.common.base.Strings;
import org.directwebremoting.*;
import org.directwebremoting.proxy.dwr.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/13
 */
public class DwrService {
    protected Logger logger = LoggerFactory.getLogger(DwrService.class);

    @Autowired
    private AbandonedService abandonedService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CallBackService callBackService;

    @Autowired
    private IpccpcdrService ipccpcdrService;

    @Autowired
    private RedisMonitorUtil redisMonitorUtil;

    @Autowired
    private RedisCallInfoUtil redisCallInfoUtil;

    @Autowired
    private RedisDispatchCountUtil redisDispatchCountUtil;

    private static ScriptSession session;

    private static WebContext webContext;


    public static String TYPE_12349 = "12349";

    public static String TYPE_CALL_BACK = "回拨";

    public void onPageLoad(String name) {
        webContext = WebContextFactory.get();
        session = WebContextFactory.get().getScriptSession();
        session.setAttribute("name", name);
    }


    /**
     * 实时获取坐席人员的状态
     * 判断是否在通话
     *
     * @param extension
     * @param agentid
     */
    public void getCallerInfo(String extension, String agentid) {
        //初始化
        if (!ObjectUtils.isNotNull(redisMonitorUtil.getMonitorInfo(agentid))) {
            MonitorInfo monitorInfo = new MonitorInfo();
            monitorInfo.setAgentId(agentid);
            redisMonitorUtil.putMonitorInfo(agentid, monitorInfo);
        }
        MonitorInfo monitorInfo = (MonitorInfo) redisMonitorUtil.getMonitorInfo(agentid);
        String param = "agentid=" + agentid;
        String sr = HttpRequest.sendGet(Keys.IP + "/cti/lt_agent_get_agent_state.php", param);
        if (!sr.equals(monitorInfo.getState())) {
            monitorInfo.setState(sr);
            //状态改变
            if ("2".equals(sr)) {
                //振铃
            } else if ("1".equals(sr)) {
                //通话
                CallBack callBack = monitorInfo.getCallBack();
                if (ObjectUtils.isNull(callBack)) {
                    //todo 正常通话
                    monitorInfo.setIsCall("true");
                    Ipccpcdr ipccpcdr = ipccpcdrService.selectOneByAgentId(agentid);
                    monitorInfo.setIpccpcdr(ipccpcdr);

                    //记录通话的类型
                    redisCallInfoUtil.putCallingInfo(ipccpcdr.getCallerid(), TYPE_12349);
                    //记录来电数目
                    redisDispatchCountUtil.add("tel", 1L);

                    //todo 通知
                    ScriptBuffer scriptBuffer = new ScriptBuffer(); //构造js脚本
                    WebContext webContext = WebContextFactory.get();
                    scriptBuffer.appendScript("showInfo(")
                            .appendScript(");");
                    //获取当前页面的脚本session
                    ScriptSession scriptSession = webContext.getScriptSession();
                    Util util = new Util(scriptSession);
                    util.addScript(scriptBuffer);


                } else {
                    //todo 回拨电话
                    if (callBack.getId() != null) {
                        callBackService.deleteByPrimaryKey(callBack.getId());
                    }
                    param = "dest=" + extension;
                    String uniqueId = HttpRequest.sendGet(Keys.IP + "/cti/lt_info_getdestuniqueid.php", param);
                    if (!Strings.isNullOrEmpty(uniqueId)) {
                        monitorInfo.setUniqueId(uniqueId);
                        ScriptBuffer scriptBuffer = new ScriptBuffer(); //构造js脚本
                        WebContext webContext = WebContextFactory.get();
                        String linkedId = uniqueId;
                        if (!Strings.isNullOrEmpty(monitorInfo.getLinkedId())) {
                            linkedId = monitorInfo.getLinkedId();
                        }
                        callBack.setUniqueId(uniqueId);
                        callBack.setLinkedId(linkedId);
                        monitorInfo.setCallBack(callBack);
                        logger.info("回拨跳单");
                        scriptBuffer.appendScript("showCallBack(")
                                .appendScript(");");
                        //获取当前页面的脚本session
                        ScriptSession scriptSession = webContext.getScriptSession();
                        Util util = new Util(scriptSession);
                        util.addScript(scriptBuffer);
                    }
                    //记录通话的类型
                    redisCallInfoUtil.putCallingInfo(callBack.getCallerId(), TYPE_CALL_BACK);
                }
            } else if ("0".equals(sr)) {
                if ("true".equals(monitorInfo.getIsCall())) {
                    monitorInfo.setIsCall("false");
                    //删除正在通话序列里的
                    Ipccpcdr ipccpcdr = monitorInfo.getIpccpcdr();
                    redisCallInfoUtil.removeCallingInfo(ipccpcdr.getCallerid());

                    ScriptBuffer scriptBuffer = new ScriptBuffer(); //构造js脚本
                    WebContext webContext = WebContextFactory.get();
                    scriptBuffer.appendScript("updateInfo(")
                            .appendData(ipccpcdr.getUniqueid())
                            .appendScript(");");
                    //获取当前页面的脚本session
                    ScriptSession scriptSession = webContext.getScriptSession();
                    Util util = new Util(scriptSession);
                    util.addScript(scriptBuffer);
                } else {
                    if (!Strings.isNullOrEmpty(monitorInfo.getUniqueId())) {
                        //删除正在通话序列里的
                        CallBack callBack = monitorInfo.getCallBack();
                        redisCallInfoUtil.removeCallingInfo(callBack.getCallerId());

                        ScriptBuffer scriptBuffer = new ScriptBuffer(); //构造js脚本
                        WebContext webContext = WebContextFactory.get();
                        scriptBuffer.appendScript("updateInfo(")
                                .appendData(monitorInfo.getUniqueId())
                                .appendScript(");");
                        //获取当前页面的脚本session
                        ScriptSession scriptSession = webContext.getScriptSession();
                        Util util = new Util(scriptSession);
                        util.addScript(scriptBuffer);
                    }
                }
                monitorInfo.setCallBack(null);
                monitorInfo.setLinkedId("");
                monitorInfo.setUniqueId("");
            }
            redisMonitorUtil.putMonitorInfo(agentid, monitorInfo);
        }
    }


    /**
     * 得到放弃电话
     *
     * @param queue
     * @param callbacked
     */
    public void getAbandonedCall(String queue, boolean callbacked, String extension, String areaName) {
        Abandoned abandoned = new Abandoned();
        abandoned.setCallbacked(callbacked);
        abandoned.setCallerid(extension);
        //获取自己区内的未接电话
        int count = 0;
        List<Abandoned> abandoneds = abandonedService.getAllRecode(abandoned);
        for (Abandoned abandoned1 : abandoneds) {
            Customer customer = customerService.selectByCallNum(abandoned1.getCallerid());
            if (ObjectUtils.isNotNull(customer)) {
                if (ObjectUtils.isNotNull(customer.getBeeperAddress()) && customer.getBeeperAddress().contains(areaName)) {
                    count++;
                }
            } else {
                count++;
            }
        }
        ScriptBuffer scriptBuffer = new ScriptBuffer(); //构造js脚本
        WebContext webContext = WebContextFactory.get();
        scriptBuffer.appendScript("showAbandoned(")
                .appendData(count)
                .appendScript(");");
        //获取当前页面的脚本session
        ScriptSession scriptSession = webContext.getScriptSession();
        Util util = new Util(scriptSession);
        util.addScript(scriptBuffer);
    }

    /**
     * 推送工单给用户
     *
     * @param userid
     * @param task
     */
    public void sendTask2User(String userid, String task) {
        final String userId = userid;
        final String taskStr = task;
        WebContext webContext = WebContextFactory.get();
        ScriptSession session = webContext.getScriptSession();
        final String from = session.getAttribute("name").toString();
        // 通过ScriptSessionFilter筛选符合条件的ScriptSession
        Browser.withAllSessionsFiltered(new ScriptSessionFilter() {
            // 实现match方法，条件为真为筛选出来的session
            @Override
            public boolean match(ScriptSession session) {
                String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
                String[] rids = userId.split(",");
                boolean b = false;
                for (String s : rids) {
                    String receiver = s.replace("user", "");
                    if (name != "" && name.equals(receiver)) {
                        b = true;
                        break;
                    }
                }
                return b;
            }
        }, new Runnable() {
            private ScriptBuffer script = new ScriptBuffer();

            @Override
            public void run() {
                // 设定前台接受消息的方法和参数
                script.appendCall("hasATask", taskStr);
                Collection<ScriptSession> sessions = Browser
                        .getTargetSessions();
                // 向所有符合条件的页面推送消息
                for (ScriptSession scriptSession : sessions) {
                    if (userId.contains(scriptSession.getAttribute("name").toString())) {
                        scriptSession.addScript(script);
                    }
                }
            }
        });
    }


    /**
     * 发送消息给用户
     *
     * @param userId
     * @param type    类型
     * @param content
     */
    public void sendMessgaeToUser(List<Integer> userId, String type, String content) {
        final List<Integer> receiverId = userId;
        final String sendMsg = content;
        final String sendType = type;
        // 通过ScriptSessionFilter筛选符合条件的ScriptSession
        Browser.withAllSessionsFiltered(new ScriptSessionFilter() {
            // 实现match方法，条件为真为筛选出来的session
            @Override
            public boolean match(ScriptSession session) {
                String name = session.getAttribute("name") == null ? "" : session.getAttribute("name").toString();
                boolean b = false;
                for (Integer s : receiverId) {
                    if (name != "" && name.equals(s)) {
                        b = true;
                        break;
                    }
                }
                return b;
            }
        }, new Runnable() {
            private ScriptBuffer script = new ScriptBuffer();

            @Override
            public void run() {
                // 设定前台接受消息的方法和参数
                script.appendCall("hasAMsg", sendMsg, sendType);
                Collection<ScriptSession> sessions = Browser
                        .getTargetSessions();
                // 向所有符合条件的页面推送消息
                for (ScriptSession scriptSession : sessions) {
                    logger.info(scriptSession.getAttribute("name").toString());
                    if (receiverId.contains(scriptSession.getAttribute("name").toString())) {
                        scriptSession.addScript(script);
                    }
                }
            }
        });
    }


    /**
     * 发送消息给用户
     *
     * @param userId
     * @param type    类型
     * @param content
     */
    public void sendMessgaeToUser2(List<Integer> userId, String type, String content) {
        ScriptBuffer scriptBuffer = new ScriptBuffer(); //构造js脚本
        scriptBuffer.appendCall("hasAMsg", content, type);
        //获取当前页面的脚本session
        if (ObjectUtils.isNotNull(webContext)) {
            try {
                Collection scriptSession = webContext.getAllScriptSessions();
                Util util = new Util(scriptSession);
                util.addScript(scriptBuffer);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


}
