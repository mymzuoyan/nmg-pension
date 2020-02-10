package com.fedtech.pension.controller.admin.task;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DateUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyOrderApp;
import com.fedtech.pension.elderly.service.ElderlyOrderAppService;
import com.fedtech.pension.org.entity.ServiceOrgCashRegister;
import com.fedtech.pension.org.service.ServiceOrgCashRegisterService;
import com.fedtech.pension.sys.entity.ServiceType;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.ServiceTypeService;
import com.fedtech.pension.sys.service.SysRoleService;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.service.TaskHandleService;
import com.fedtech.pension.task.service.TaskPlanService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import com.fedtech.pension.task.vo.ServiceOrgTaskMoneyVo;
import com.google.common.base.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Administrator
 * @date 2016/9/19
 */
@Controller
@RequestMapping("/admin/api/task/")
public class TaskApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(TaskApiController.class);

    SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    public SysRoleService sysRoleService;

    @Reference(version = "1.0.0")
    public TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private TaskPlanService taskPlanService;


    @Reference(version = "1.0.0")
    private TaskHandleService taskHandleService;

    @Reference(version = "1.0.0")
    private ElderlyOrderAppService elderlyOrderAppService;

    @Reference(version = "1.0.0")
    private ServiceTypeService serviceTypeService;

    @Reference(version = "1.0.0")
    private ServiceOrgCashRegisterService serviceOrgCashRegisterService;


    @RequestMapping(value = "getTask", method = RequestMethod.POST)
    @ResponseBody
    public Task getTask(Integer taskId) {
        return taskService.selectByPrimaryKey(taskId);
    }


    @RequestMapping(value = "getTaskHandle", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject getTaskHandle(Integer taskId) {
        return taskHandleService.getTaskHandleList(taskId);
    }


    @RequestMapping(value = "sendTask", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "发布派单")
    public JsonResult sendTask(Task task, String receiverName, String receiverId, String timeStr, @RequestParam(value = "type", required = false) Integer type) {
        JsonResult result = new JsonResult();
        task.setCreateTime(new Date());
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            task.setReceiverName(receiverName);
        } else {
            task.setReceiverServiceOrg(receiverName);
        }
        task.setCreatorId(currentUser().getUid());
        task.setCreatorName(currentUser().getLogin_name());
        if (!Strings.isNullOrEmpty(timeStr)) {
            try {
                task.setServiceTime(dateTime.parse(timeStr));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        //对老人进行处理，添加到关联库中
        Integer elderId = taskService.preHandleTaskElder(task.getElderId());
        task.setElderId(elderId);
        task.setStatus(TaskQuantity.NOT_RESPONSE);
        try {
            int senderType = 1;
            if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
                senderType = 2;
            }
            if (taskService.sendTask(task, receiverId, type, currentUser().getUid(), senderType)) {
                result.markSuccess("发送成功", task);
            } else {
                result.markError("发送失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.markError("发送失败，没有接收人");
        }
        return result;
    }

    @RequestMapping(value = "dispatch", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "资源调度-派单")
    public JsonResult dispatch(Integer taskId, Integer selectId, String receiverName) {
        JsonResult result = new JsonResult();
        User filter = new User();
        filter.setServiceOrgId(selectId + "");
        List<User> userIds = userService.selectAllUserByRole(filter, RoleType.ZuAdmin.getId());
        if (userIds.size() > 0) {
            if (taskService.dispatchTask(taskId, userIds.get(0), receiverName, currentUser().getUid())) {
                result.markSuccess("派单成功", null);
            } else {
                result.markError("派单失败");
            }
        } else {
            result.markError("该组织没有管理员");
        }
        return result;
    }


    @RequestMapping(value = "updateTaskStatus", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新工单信息")
    public JsonResult updateTaskStatus(TaskReceive taskReceive) {
        JsonResult result = new JsonResult();
        if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 删除工单信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除工单信息")
    public JsonResult deleteTask(Integer id) {
        JsonResult result = new JsonResult();
        if (taskService.deleteByPrimaryKey(id)) {
            taskService.deleteTaskCache(id);
            result.markSuccess("删除工单信息成功", null);
        } else {
            result.markError("删除工单信息失败");
        }
        return result;
    }

    /**
     * 删除工单缓存
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCache", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteTaskCache(Integer id) {
        JsonResult result = new JsonResult();
        taskService.deleteTaskCache(id);
        result.markSuccess("删除工单缓存成功", null);
        return result;
    }


    /**
     * 缓存不在地图上显示
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "removeTaskCacheFromMap", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult removeTaskCacheFromMap(Integer id) {
        JsonResult result = new JsonResult();
        taskService.removeTaskCacheFromMap(id);
        result.markSuccess("删除工单缓存成功", null);
        return result;
    }


    /**
     * 撤销工单
     *
     * @param taskId
     * @param taskReceiveId
     * @return
     */
    @RequestMapping(value = "cancel", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "撤销工单")
    public JsonResult cancelTask(Integer taskId, Integer taskReceiveId) {
        JsonResult result = new JsonResult();
        Task old = taskService.selectByPrimaryKey(taskId);
        logger.info(old.toString());
        //在派遣中的才能撤销
        if (ObjectUtils.isNotNull(old) && (old.getStatus().equals(TaskQuantity.SERVICEORG_DISPATCH) || old.getStatus().equals(TaskQuantity.NOT_RESPONSE))) {
            if (currentUser().getUid().equals(old.getCreatorId())) {
                //自己创建的工单，直接删除
                if (taskService.deleteByPrimaryKey(taskId)) {
                    result.markSuccess("撤销成功", null);
                } else {
                    result.markError("撤销失败");
                }
            } else {
                //别人派给自己，自己再派给别人的工单
                if (taskReceiveService.cancelTask(taskReceiveId)) {
                    result.markSuccess("撤销成功", null);
                } else {
                    result.markError("撤销失败");
                }
            }
        } else {
            result.markError("撤销失败");
        }
        return result;
    }

    @RequestMapping(value = "getAllList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Task> getAllList(Task task, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            task.setAreaName(currentUser().getAreaName());
        }
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            task.setReceiverServiceOrg(currentUser().getServiceOrgName());
        }
        PageResponse<Task> tasks = taskService.selectPageList(task, pageRequest);
        return tasks;
    }

    /**
     * 市场工单服务记录列表信息
     * @param task
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "scListData", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Task> scListData(Task task, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            task.setAreaName(currentUser().getAreaName());
        }
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            task.setReceiverServiceOrg(currentUser().getServiceOrgName());
        }
        PageResponse<Task> tasks = taskService.selectRecordList(task, pageRequest);
        return tasks;
    }

    /**
     * 计划工单服务记录列表信息
     * @param taskPlan
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "jhListData", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<TaskPlan> jhListData(TaskPlan taskPlan, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            taskPlan.setAreaName(currentUser().getAreaName());
        }
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            taskPlan.setReceiverServiceOrg(currentUser().getServiceOrgName());
        }
        PageResponse<TaskPlan> tasks = taskPlanService.selectPageList(taskPlan, pageRequest);
        return tasks;
    }

    /**
     * 计划工单列表
     *
     * @param task
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getAllPlanList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<TaskPlan> getAllPlanList(TaskPlan task, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            task.setAreaName(currentUser().getAreaName());
        }
        task.setServiceAreaName("");
        PageResponse<TaskPlan> tasks = taskPlanService.selectPageList(task, pageRequest);
        return tasks;
    }


    @RequestMapping(value = "getAllListForWallet", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Task> getAllListForWallet(Task task, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            task.setReceiverServiceOrg(currentUser().getServiceOrgName());
        }
        PageResponse<Task> tasks = taskService.selectPageListForWallet(task, pageRequest);
        return tasks;
    }


    /**
     * 获取当前用户接受的工单
     *
     * @param taskReceive
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "receiveList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<TaskReceive> getReceiveList(TaskReceive taskReceive, PageRequest pageRequest) {
        PageResponse<TaskReceive> tasks = taskReceiveService.selectPageList(taskReceive, pageRequest);
        return tasks;
    }

    /**
     * 获取当前用户发送的工单
     *
     * @param taskReceive
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "sendList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<TaskReceive> getSendList(TaskReceive taskReceive, PageRequest pageRequest) {
        taskReceive.setCreatorId(currentUser().getUid());
        PageResponse<TaskReceive> tasks = taskReceiveService.selectPageList(taskReceive, pageRequest);
        return tasks;
    }

    /**
     * 获取某一个工单的接收人员
     *
     * @param taskId
     * @return
     */
    @RequestMapping(value = "getReceiversByTaskId", method = RequestMethod.POST)
    @ResponseBody
    public List<User> getReceiversByTaskId(Integer taskId) {
        List<User> users = userService.selectUserByTaskId(taskId);
        return users;
    }

    /**
     * 参看用户的工单统计，每一个用户的工单数，发工单数，接工单数
     *
     * @param user
     * @param pageRequest
     * @return
     */
    @SystemControllerLog(description = "参看用户的工单统计")
    @RequestMapping(value = "getTaskList", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject getTaskList(User user, PageRequest pageRequest) {
        Subject currentUser = SecurityUtils.getSubject();
        PageResponse<User> dataTable = null;
        if (currentUser.hasRole(RoleType.SuAdmin.getValue())) {
            //超级管理员
            //所有成员的
            dataTable = userService.selectPageList(user, pageRequest);
//          dataTable = userService.selectPageListByRoleId(user,pageRequest,RoleType.MuAdmin.getId());
        } else if (currentUser.hasRole(RoleType.MuAdmin.getValue())) {
            //市级管理员
            //获取市级下的所有的区级管理员
            dataTable = userService.selectPageListByRoleId(user, pageRequest, RoleType.ReAdmin.getId());
        } else if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区级管理员
            //获取区级下的所有的组织管理员
            user.setAreaName(currentUser().getAreaName());
            dataTable = userService.selectPageListByRoleId(user, pageRequest, RoleType.ZuAdmin.getId());
        } else if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            //组织管理员
            //获取组织下的所有的服务人员
            user.setServiceOrgId(currentUser().getServiceOrgId());
            user.setAreaName(currentUser().getAreaName());
            dataTable = userService.selectPageListByRoleId(user, pageRequest, RoleType.ServiceUser.getId());
        } else if (currentUser.hasRole(RoleType.MonitorAdmin.getValue())) {
            //班长坐席
            user.setAreaName(currentUser().getAreaName());
            dataTable = userService.selectPageListByRoleId(user, pageRequest, RoleType.MonitorUser.getId());
        } else if (currentUser.hasRole(RoleType.MonitorUser.getValue())) {
            //普通坐席
            user.setUid(currentUser().getUid());
            dataTable = userService.selectPageListByRoleId(user, pageRequest, RoleType.MonitorUser.getId());
        }
        List<User> users = dataTable.getData();
        Map<Integer, String> roleNames = sysRoleService.getRoleNamesByUids(users);
        Map<Integer, Integer> sendCounts = taskService.getSendCountByUids(users);
        Map<Integer, Integer> receiveCounts = taskReceiveService.getReceiveCountByUids(users);
        JSONObject result = new JSONObject();
        result.put("draw", dataTable.getDraw());
        result.put("error", dataTable.getError());
        result.put("recordsFiltered", dataTable.getRecordsFiltered());
        result.put("recordsTotal", dataTable.getRecordsTotal());
        JSONArray ja = new JSONArray();
        JSONObject data = null;
        for (int i = 0; i < users.size(); i++) {
            data = new JSONObject();
            User item = users.get(i);
            data.put("id", item.getUid());
            data.put("name", item.getLogin_name());
            data.put("areaName", item.getAreaName());
            //发送数量
            if (sendCounts.get(item.getUid()) != null) {
                data.put("sendCount", sendCounts.get(item.getUid()));
            } else {
                data.put("sendCount", 0);
            }
            //接受数量 receiveCounts
            if (receiveCounts.get(item.getUid()) != null) {
                data.put("receiveCount", receiveCounts.get(item.getUid()));
            } else {
                data.put("receiveCount", 0);
            }
            if (roleNames.get(item.getUid()) != null) {
                data.put("roleName", roleNames.get(item.getUid()));
            } else {
                data.put("roleName", "");
            }
            ja.add(data);
        }
        result.put("data", ja);
        return result;
    }


    /**
     * 获取工单数据分析
     *
     * @return
     */
    @RequestMapping(value = "getTaskStatistics", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> getTaskStatistics() {
        SimpleDateFormat simple = new SimpleDateFormat(DateUtil.simple);
        SimpleDateFormat shortDt = new SimpleDateFormat(DateUtil.short_);
        Map<String, Integer> returnRsesult = new LinkedHashMap<>();
        Map<String, Integer> result = new LinkedHashMap<>();
        User user = new User();
        user.setServiceOrgId(currentUser().getServiceOrgId());
        List<Map> maps = taskReceiveService.getCountByAnyTime(user, 3, DateUtil.getAddDate(-30), new Date());
        for (Map<Object, Object> map : maps) {
            Integer count = null;
            String day = null;
            for (Map.Entry<Object, Object> entry : map.entrySet()) {
                if ("count".equals(entry.getKey())) {
                    count = Integer.parseInt(entry.getValue().toString());
                } else if ("day".equals(entry.getKey())) {
                    day = entry.getValue().toString();
                }
            }
            result.put(day, count);
        }
        for (int i = 30; i >= 0; i--) {
            boolean b = false;
            Date start = DateUtil.getAddDate(-i);
            for (Map.Entry<String, Integer> entry : result.entrySet()) {
                try {
                    if (entry.getKey().length() > 10) {
                        //yyyy-MM-dd HH:mm:ss
                        if (DateUtil.differentDays(start, simple.parse(entry.getKey())) == 0) {
                            returnRsesult.put(shortDt.format(start), entry.getValue());
                            b = true;
                            continue;
                        }
                    } else {
                        //yyyy-MM-dd
                        if (DateUtil.differentDays(start, shortDt.parse(entry.getKey())) == 0) {
                            returnRsesult.put(shortDt.format(start), entry.getValue());
                            b = true;
                            continue;
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (b) {
                continue;
            }
            returnRsesult.put(shortDt.format(start), 0);
        }

        return returnRsesult;
    }

    @RequestMapping(value = "getTaskLevelStatistics", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> getTaskLevelStatistics() {
        SimpleDateFormat df = new SimpleDateFormat(DateUtil.simple);
        Map<String, Integer> result = new LinkedHashMap<>();
        User user = new User();
        user.setServiceOrgId(currentUser().getServiceOrgId());
        Calendar a = Calendar.getInstance();
        String start = a.get(Calendar.YEAR) + "-" + (a.get(Calendar.MONTH) + 1) + "-" + (a.getActualMinimum(Calendar.DAY_OF_MONTH)) + " 00:00:00";
        String end = a.get(Calendar.YEAR) + "-" + (a.get(Calendar.MONTH) + 1) + "-" + (a.getActualMaximum(Calendar.DAY_OF_MONTH)) + " 24:60:60";
        Integer level = 1;
        Integer all = 0;
        Integer manyiCount = 0;
        try {
            all = taskReceiveService.getCountByUsersAndTimeAndLevel(user, level, df.parse(start), df.parse(end));
            level = 3;
            manyiCount = taskReceiveService.getCountByUsersAndTimeAndLevel(user, level, df.parse(start), df.parse(end));
            result.put("满意", manyiCount);

            result.put("不满意", all - manyiCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 服务类型统计
     *
     * @return
     */
    @RequestMapping(value = "getTaskServiceTypeStatistics", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getTaskServiceTypeStatistics() {
        JsonResult result = new JsonResult();
        Map<String, Long> data = taskService.getTaskServiceTypeStatistics();
        ServiceType filter = new ServiceType();
        filter.setStatus(1);
        List<ServiceType> serviceTypes = serviceTypeService.getAllRecode(filter);
        for (ServiceType type : serviceTypes) {
            String name = type.getName();
            if (!data.containsKey(name)) {
                data.put(name, 0L);
            }
        }
        if (ObjectUtils.isNotNull(data)) {
            result.markSuccess("获取成功", data);
        } else {
            result.markError("失败");
        }
        return result;
    }

    /**
     * 对服务记录进行数据分析
     *
     * @param dataType
     * @param timeType
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping(value = "getTaskInfoStatistics", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getTaskInfoStatistics(String dataType, String timeType, String startTime, String endTime) {
        JsonResult result = new JsonResult();
        Map<String, Map<String, Object>> data = null;
        String receiverOrgName = null;
        try {
            if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
                receiverOrgName = currentUser().getServiceOrgName();
            }
            data = taskService.getTaskInfoStatistics(receiverOrgName, dataType, timeType, startTime, endTime);
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

    /**
     * 分页获取组织财务情况
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getServiceOrgTaskMoneyList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<ServiceOrgTaskMoneyVo> getServiceOrgTaskMoneyList(ServiceOrgTaskMoneyVo filter, PageRequest pageRequest) {
        return taskService.selectPageListByOrgMoney(filter, pageRequest);
    }

    /**
     * 分页获取组织资金动向情况
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getServiceOrgTaskMoneyInfoList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<ServiceOrgCashRegister> getServiceOrgTaskMoneyInfoList(ServiceOrgCashRegister filter, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            filter.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        return serviceOrgCashRegisterService.selectPageList(filter, pageRequest);
    }


    /**
     * home页面，工单统计
     *
     * @return
     */
    @RequestMapping(value = "recordPool")
    @ResponseBody
    public List<List<Map<String, Integer>>> recordPool() {
        //获取当前用户的区域名称
        String areaName = currentUser().getAreaName();
        String orgName = null;
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.SuAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue())){
            areaName = null;
        }
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())){
            orgName = currentUser().getServiceOrgName();
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String starDate = date(-29);
        List<String> listStr = new ArrayList<>();
        for (int i = 0; i < 30; i++) {
            listStr.add(date(-i));
        }
        String endDate = date(0);
        List<Task> tasks = taskService.countPool(starDate, endDate, areaName, orgName);
        List<TaskPlan> taskPlans = taskPlanService.countPool(starDate, endDate, areaName, orgName);
        List<List<Map<String, Integer>>> list = new ArrayList<>();
        List<Map<String, Integer>> scList = new ArrayList<>();
        List<Map<String, Integer>> jhList = new ArrayList<>();
        listStr.forEach(val-> {
            Map<String, Integer> taskMap = new LinkedHashMap<>();
            Map<String, Integer> taskPlanMap = new LinkedHashMap<>();
            int scNum = 0;
            int jhNum = 0;
            //遍历市场
            for(Task task : tasks){
                if (df.format(task.getCreateTime()).equals(val)){
                    scNum = task.getCount();
                }
            }
            //遍历计划
            for(TaskPlan taskPlan : taskPlans) {
                if (df.format(taskPlan.getCreateTime()).equals(val)){
                    jhNum = taskPlan.getCount();
                }
            }
            val = val.substring(5);
            taskMap.put(val, scNum);
            taskPlanMap.put(val, jhNum);
            scList.add(taskMap);
            jhList.add(taskPlanMap);
        });
        //此处需倒序排序。
        Collections.reverse(scList);
        Collections.reverse(jhList);
        list.add(scList);
        list.add(jhList);
        return list;
    }

    /**
     * 日期工具方法（自定义获取到**天之后或之前的日期）
     * @param num
     * @return
     */
    public String date(int num){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DATE, num);
        Date date = ca.getTime();
        return df.format(date);
    }

}
