package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.exception.CustomerException;
import com.fedtech.commons.utils.HttpRequest;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.entity.MonitorGroup;
import com.fedtech.pension.call.service.MonitorGroupService;
import com.fedtech.pension.call.service.MonitorService;
import com.fedtech.pension.call.vo.MonitorStatusVo;
import com.fedtech.pension.cdr.service.CdrService;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author Administrator
 * @date 2016/9/12
 */
@Controller
@RequestMapping("/admin/call/api/monitor/")
public class MonitorApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(MonitorApiController.class);

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private MonitorService monitorService;

    @Reference(version = "1.0.0")
    private MonitorGroupService monitorGroupService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private CdrService cdrService;

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加坐席")
    public JsonResult addMonitor(User user, Integer groupId, String groupName, String queueName, String telNum) throws ParseException {
        JsonResult result = new JsonResult();

        //判断是否存在账号
        if (!StringUtils.isEmpty(user.getLogin_name()) && ObjectUtils.isNotNull(userService.selectByLoginName(user.getLogin_name()))) {
            result.markError("账号已存在");
            return result;
        } else {
            try {
                if (monitorService.addMonitor(user, groupId, groupName, queueName, telNum)) {
                    result.markSuccess("添加成功", null);
                } else {
                    result.markError("添加失败");
                }
            } catch (CustomerException e) {
                result.markError(e.getMessage());
            }

        }
        return result;
    }

    @RequestMapping(value = "syncAgent", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult syncAgent(){
        JsonResult result = new JsonResult();
        List<Map<String,Object>> agents = cdrService.selectAll();
        for (Map<String,Object> map : agents) {
             String agentNum = map.get("agentnum").toString();
             Monitor monitor = monitorService.selectByAgentNum(agentNum);
             if(monitor==null){
                 monitor = new Monitor();
                 monitor.setExtension(map.get("agentnum")==null?"":map.get("agentnum").toString());
                 monitor.setPassword(map.get("password")==null?"":map.get("password").toString());
                 monitor.setGroupName(map.get("groupname")==null?"":map.get("groupname").toString());
                 monitor.setGroupId(Integer.parseInt(map.get("groupid")==null?"0":map.get("groupid").toString()));
                 monitor.setName(map.get("agentname")==null?"":map.get("agentname").toString());
                 monitor.setIsLeader("1".equals(map.get("agent_type")==null?"0":map.get("agent_type").toString())?true:false);
                 monitorService.addAgent(monitor);
             }else{
                 if(!(map.get("agentnum")==null?"":map.get("agentnum").toString()).equals(monitor.getExtension())||
                         !(map.get("password")==null?"":map.get("password").toString()).equals(monitor.getPassword())||
                         Integer.parseInt(map.get("groupid")==null?"0":map.get("groupid").toString())!=monitor.getGroupId()||
                         !(map.get("agentname")==null?"":map.get("agentname").toString()).equals(monitor.getName())||
                         monitor.getIsLeader()?("1".equals(map.get("agent_type")==null?"0":map.get("agent_type").toString())?true:false):("1".equals(map.get("agent_type")==null?"0":map.get("agent_type").toString())?false:true)){
                     monitor.setExtension(map.get("agentnum")==null?"":map.get("agentnum").toString());
                     monitor.setPassword(map.get("password")==null?"":map.get("password").toString());
                     monitor.setGroupName(map.get("groupname")==null?"":map.get("groupname").toString());
                     monitor.setGroupId(Integer.parseInt(map.get("groupid")==null?"0":map.get("groupid").toString()));
                     monitor.setName(map.get("agentname")==null?"":map.get("agentname").toString());
                     monitor.setIsLeader("1".equals(map.get("agent_type")==null?"0":map.get("agent_type").toString())?true:false);
                     monitorService.updateAgent(monitor);
                 }

             }
        }
        result.markSuccess("同步成功", null);
        return result;
    }

    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Monitor> getMonitorList(Monitor monitor, PageRequest pageRequest) {
        PageResponse<Monitor> monitors = monitorService.selectPageList(monitor, pageRequest);
        return monitors;
    }


    @RequestMapping(value = "status", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<MonitorStatusVo> getMonitorsStatus(Monitor monitor, PageRequest pageRequest, Integer isShow, @RequestParam(value = "type", required = false, defaultValue = "-1") Integer type) {
        PageResponse<Monitor> monitors = getMonitorList(monitor, pageRequest);
        PageResponse<MonitorStatusVo> status = new PageResponse<>();
        status.setDraw(monitors.getDraw());
        status.setError(monitors.getError());
        status.setRecordsFiltered(monitors.getRecordsFiltered());
        status.setRecordsTotal(monitors.getRecordsTotal());
        List<MonitorStatusVo> vos = new ArrayList<>();
        for (Monitor m : monitors.getData()) {
            //获取状态
            MonitorStatusVo monitorStatusVo = new MonitorStatusVo();
            monitorStatusVo.setAreaName(m.getAreaName());
            monitorStatusVo.setAccount(m.getAccount());
            monitorStatusVo.setGroupId(m.getGroupId());
            monitorStatusVo.setGroupName(m.getGroupName());
            monitorStatusVo.setId(m.getId());
            monitorStatusVo.setLeader(m.getIsLeader());
            monitorStatusVo.setName(m.getName());
            monitorStatusVo.setQueueName(m.getQueueName());
            monitorStatusVo.setExtension(m.getExtension());
            //获取坐席状态
            Integer status1 = cdrService.selectStatusByAgent(m.getExtension());
            if(status1==null){
                status1 = -1;
            }
            monitorStatusVo.setStatus(status1);
            if(status1==2){
                String phone = cdrService.selectCurPhone(m.getExtension());
                monitorStatusVo.setCallNumber(phone);
            }
//            String param = "agentid=" + m.getAccount();
//            String sr = HttpRequest.sendGet(Keys.IP + "//cti/lt_agent_get_agent_state.php", param);
//            if (sr != null && sr != "") {
//                Integer status1 = Integer.parseInt(sr);
//                monitorStatusVo.setStatus(status1);
//                if (status1 == 1) {
//                    //获取来电号码
//                    param = "extension=" + m.getExtension();
//                    sr = HttpRequest.sendGet(Keys.IP + "//cti/lt_phone_getcallerid.php", param);
//                    monitorStatusVo.setCallNumber(sr);
//                }
//            }
            if (isShow == 0) {
                if (monitorStatusVo.getStatus() != -1) {
                    if (type != -1) {
                        if (Objects.equals(monitorStatusVo.getStatus(), type)) {
                            vos.add(monitorStatusVo);
                        }
                    } else {
                        vos.add(monitorStatusVo);
                    }
                } else {
                    status.setRecordsFiltered(status.getRecordsFiltered() - 1);
                }
            } else {
                vos.add(monitorStatusVo);
            }
        }
        status.setData(vos);
        return status;
    }

    @RequestMapping(value = "selectMonitorStatus", method = RequestMethod.POST)
    @ResponseBody
    public List<Monitor> selectMonitorStatus(){
        List<Monitor> monitors = monitorService.selectAll();
        for (Monitor m : monitors) {
            Integer status1 = cdrService.selectStatusByAgent(m.getExtension());
            if (status1 == null) {
                status1 = -1;
            }
            m.setQueueId(status1);
            if (status1 == 2) {
                String phone = cdrService.selectCurPhone(m.getExtension());
                m.setPhone(phone);
            }
        }
     return monitors;
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除坐席")
    public JsonResult deleteMonitor(Integer uid) {
        JsonResult result = new JsonResult();
        try {
            if (monitorService.deleteMonitor(uid)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        } catch (CustomerException e) {
            result.markError(e.getMessage());
        }
        return result;
    }

    /**
     * 更新
     *
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新坐席")
    public JsonResult updateMonitor(Integer uid, Integer id, String queueName, String pstnnumber) {
        JsonResult result = new JsonResult();
        try {
            if (monitorService.updateMonitor(id,uid,queueName,pstnnumber)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        } catch (CustomerException e) {
            result.markError(e.getMessage());
        }

        return result;
    }

    /**
     * 坐席组列表
     *
     * @param monitorGroup
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "groupList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<MonitorGroup> getMonitorGroupList(MonitorGroup monitorGroup, PageRequest pageRequest) {
        PageResponse<MonitorGroup> monitorGroupPageResponse = monitorGroupService.selectPageList(monitorGroup, pageRequest);
        return monitorGroupPageResponse;
    }

    /**
     * 坐席组列表
     *
     * @param
     * @return
     */
    @RequestMapping(value = "groupAllList", method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> getMonitorGroupList() {
        List<Map<String,Object>> monitorGroups = cdrService.selectGroups();
        return monitorGroups;
    }


    /**
     * 坐席组添加
     *
     * @param monitorGroup
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "group/add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加坐席组")
    public JsonResult addMonitorGroup(MonitorGroup monitorGroup) throws ParseException {
        JsonResult result = new JsonResult();
        if (monitorGroup.getId() != null) {
            //更新
            if (monitorGroupService.updateByPrimaryKeySelective(monitorGroup)) {
                result.markSuccess("修改坐席组成功", null);
            } else {
                result.markError("修改坐席组失败");
            }
        } else {
            //添加
            if (StringUtils.isEmpty(monitorGroup.getName())) {
                result.markError("请输入坐席组名称");
                return result;
            }
            if (!StringUtils.isEmpty(monitorGroup.getName()) && ObjectUtils.isNotNull(monitorGroupService.selectMonitorGroupByName(monitorGroup.getName()))) {
                result.markError("坐席组名称已存在");
                return result;
            }
            try {
                if (monitorGroupService.insert(monitorGroup)) {
                    result.markSuccess("添加坐席组成功", null);
                } else {
                    result.markError("添加坐席组失败");
                }
            } catch (CustomerException e) {
                result.markError(e.getMessage());
            }

        }
        return result;
    }

    /**
     * 坐席组删除
     *
     * @param groupId
     * @return
     */
    @RequestMapping(value = "group/delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除坐席组")
    public JsonResult deleteMonitorGroup(Integer groupId) {
        JsonResult result = new JsonResult();
        if (monitorGroupService.deleteByPrimaryKey(groupId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 得到坐席状态
     *
     * @return
     */
    @RequestMapping(value = "getMonitorStatus", method = RequestMethod.POST)
    @ResponseBody
    public Integer getMonitorStatus() {
        String param = "agentid=" + currentUser().getLogin_name();
        String sr = HttpRequest.sendGet(Keys.IP + "//cti/lt_agent_get_agent_state.php", param);
        return Integer.parseInt(sr);
    }

    /**
     * 改变状态
     *
     * @param status
     * @return
     */
    @RequestMapping(value = "changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public Integer changeStatus(Integer status) {
        String param = "agentid=" + currentUser().getLogin_name() + "&newstate=" + status;
        String re = HttpRequest.sendGet(Keys.IP + "//cti/lt_agent_set_agent_state.php", param);
        return Integer.parseInt(re);
    }


}
