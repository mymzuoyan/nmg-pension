package com.fedtech.pension.mobile.api.ServiceOrgAdmin;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.quantity.MessageQuantity;
import com.fedtech.pension.sys.service.MessageService;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.JPushQuantity;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.quantity.TaskReceiveQuantity;
import com.fedtech.pension.task.service.JpushService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.*;

/**
 * @author zhnn
 * @date 2017/3/22
 */
@Controller
@RequestMapping("/api/serviceAdmin/task/")
public class SOATaskApiController {
    protected Logger logger = LoggerFactory.getLogger(SOATaskApiController.class);

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private MessageService messageService;

    @Reference(version = "1.0.0")
    private JpushService jpushService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Reference(version = "1.0.0")
    private UserService userService;
    /**
     * 组织管理员/服务人员获取接单列表
     * 分页
     *
     * @param userId
     * @param pageNum
     * @param status  0：未处理 1:正在处理 2：已完成
     * @return
     */
    @RequestMapping(value = "getTaskByUserId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskByUserID(@RequestParam("userId") Integer userId,
                                     @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                     @RequestParam(value = "status", required = false) String status,
                                     @RequestParam(value = "serviceType", required = false) String serviceType) {
        AppResult result = new AppResult();
        if (pageNum != null && pageNum < 1) {
            result.markError("页数不能小于1");
            return result;
        }
        List<TaskReceive> milTasks = taskService.selectListByReceiver(userId, status, pageNum, 5, serviceType);
        result.markSuccess("获取任务成功", milTasks);
        return result;
    }

    /**
     * 获取抢单列表（3公里之内）
     *
     * @param userId
     * @param pageNum
     * @param status
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "getRobTaskList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getRobTaskList(@RequestParam("userId") Integer userId,
                                    @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                    @RequestParam(value = "length", required = false) Integer length,
                                    @RequestParam(value = "status", required = false) Integer status,
                                    @RequestParam(value = "serviceType", required = false) String serviceType,
                                    @RequestParam(value = "sort", required = false) String sort) {
        AppResult result = new AppResult();
        List<TaskReceive> milTasks = new ArrayList<>();
        if (!StringUtils.isEmpty(pageNum) && !StringUtils.isEmpty(length)){
            milTasks = taskService.getRobTaskList(userId, status, pageNum, length, serviceType, sort, RoleType.ReAdmin.getId());
        } else {
            milTasks = taskService.getRobTaskList(userId, status, -1, -1, serviceType, sort, RoleType.ReAdmin.getId());
        }
        result.markSuccess("获取任务成功", milTasks);
        return result;
    }

    /**
     * 根据分布人来获取工单
     *
     * @param userId
     * @param pageNum
     * @param status
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "getTaskByCreatorId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskByCreatorId(@RequestParam("userId") Integer userId,
                                        @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                        @RequestParam(value = "status", required = false) String status,
                                        @RequestParam(value = "serviceType", required = false) String serviceType) {
        AppResult result = new AppResult();
        List<TaskReceive> milTasks = taskReceiveService.selectByCreatorId(userId, pageNum, status, serviceType);
        result.markSuccess("获取任务成功", milTasks);
        return result;
    }

    /**
     * 获取服务组织下的所有服务人员的工单（获取监管的工单）
     *
     * @param serviceOrgId
     * @param pageNum
     * @param status
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "getSuperviseTasks", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getSuperviseTasks(@RequestParam("serviceOrgId") Integer serviceOrgId,
                                       @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                       @RequestParam(value = "status", required = false) String status,
                                       @RequestParam(value = "serviceType", required = false) String serviceType) {
        AppResult result = new AppResult();
        User filter = new User();
        filter.setServiceOrgId(serviceOrgId + "");
        List<Integer> ids = userService.selectAllUserIdByRole(filter, RoleType.ServiceUser.getId());
        List<TaskReceive> milTasks = taskReceiveService.selectByReceiveIds(ids, pageNum, status, serviceType);
        result.markSuccess("获取任务成功", milTasks);
        return result;
    }

    /**
     * 获取服务组织已完成，未完成，评价订单(好评，差评，未评)
     *
     * @return
     */
    @RequestMapping(value = "getTaskCountByUserId", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskCountByUserId(@RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();

        int notComplete = 0;// 未完成
        // 服务组织已派遣，服务人员接单，已执行，已拒单，
        List<Integer> notCompletes = new ArrayList<>();
        notCompletes.add(TaskQuantity.SERVICEORG_DISPATCH);
        notCompletes.add(TaskQuantity.SERVICEUSER_RESPONSE);
        notCompletes.add(TaskQuantity.SERVICEUSER_REGISTER);
        notCompletes.add(TaskQuantity.SERVICEUSER_REFUSE);
        List<TaskReceive> taskReceives = taskReceiveService.selectByCreatorId(userId, null, notCompletes.toString(), null);
        if (ObjectUtils.isNotNull(taskReceives)) {
            notComplete += taskReceives.size();
        }
        // 服务组织已响应
        List<TaskReceive> milTasks = taskService.selectListByReceiver(userId, TaskQuantity.SERVICEORG_RESPONSE + "", null, null, null);
        if (ObjectUtils.isNotNull(milTasks)) {
            notComplete += milTasks.size();
        }

        int complete = 0;//已完成
        List<Integer> completes = new ArrayList<>();
        completes.add(TaskQuantity.COMPLETE);
        completes.add(TaskQuantity.EVALUATED);
        taskReceives = taskReceiveService.selectByCreatorId(userId, null, completes.toString(), null);
        if (ObjectUtils.isNotNull(taskReceives)) {
            complete += taskReceives.size();
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("notComplete", notComplete);
        jsonObject.put("complete", complete);
        jsonObject.put("evaluated", complete);
        result.markSuccess("获取服务统计成功", jsonObject);
        return result;
    }

    /**
     * 评价中心
     *
     * @param userId
     * @return
     */
    @RequestMapping(value = "getEvaluated", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getEvaluated(@RequestParam("userId") Integer userId) {
        AppResult result = new AppResult();
        int goodEvaluated = 0;
        int badEvaluated = 0;
        int notEvaluated = 0;
        List<TaskReceive> milTasks = taskReceiveService.selectByCreatorId(userId, null, "" + TaskQuantity.COMPLETE + "," + TaskQuantity.EVALUATED + "", null);
        if (ObjectUtils.isNotNull(milTasks)) {
            for (int i = 0; i < milTasks.size(); i++) {
                if (!StringUtils.isEmpty(milTasks.get(i).getLevel())) {
                    if (milTasks.get(i).getLevel() >= 3) {
                        goodEvaluated += 1;
                    } else {
                        badEvaluated += 1;
                    }
                } else {
                    notEvaluated += 1;
                }
            }
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("goodEvaluated", goodEvaluated);
        jsonObject.put("badEvaluated", badEvaluated);
        jsonObject.put("notEvaluated", notEvaluated);
        result.markSuccess("获取评价成功", jsonObject);
        return result;
    }


    /**
     * 服务统计
     *
     * @param flag year-年 month-月
     * @return
     */
    @RequestMapping(value = "getCountByTime", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getCountByTime(@RequestParam("flag") String flag,
                                    @RequestParam("year") Integer year,
                                    @RequestParam("month") Integer month,
                                    @RequestParam("userId") Integer userId,
                                    @RequestParam("status") String status) {
        AppResult result = new AppResult();
        Map map = new HashMap();
        map.put("flag", flag);
        map.put("year", year);
        map.put("month", month);
        map.put("userId", userId);
        map.put("status", status);
        List<Map> maps = taskReceiveService.selectByCreatorIdOrReceiverId(map);
        result.markSuccess("获取服务统计成功", maps);
        return result;
    }

    /**
     * 数据统计
     *
     * @return
     */
    @RequestMapping(value = "getStatistic", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getStatistic(@RequestParam("receiverServiceOrg") String receiverServiceOrg,
                                  @RequestParam(value = "receiverId", required = false) Integer receiverId,
                                  @RequestParam("serviceType") String serviceType,
                                  @RequestParam("dataType") String dataType,
                                  @RequestParam("timeType") String timeType,
                                  @RequestParam("startTime") String startTime,
                                  @RequestParam("endTime") String endTime) {
        AppResult result = new AppResult();
        Map<String, Map<String, Object>> data = null;
        try {
            data = taskService.getTaskInfoStatisticsByServiceType(receiverServiceOrg, receiverId, serviceType, dataType, timeType, startTime, endTime);
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
     * 订单详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getInfoById", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getInfoById(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        TaskReceive tr = taskReceiveService.selectById(id);
        if (ObjectUtils.isNotNull(tr)) {
            result.markSuccess("获取订单详情成功", tr);
        } else {
            result.markError("无此订单");
        }
        return result;
    }

    /**
     * 更新订单状态
     *
     * @param taskId
     * @param name
     * @param status
     * @return
     */
    @RequestMapping(value = "updateTaskStatus", method = RequestMethod.POST)
    @Transactional
    @ResponseBody
    public AppResult updateTaskStatus(@RequestParam("id") Integer id,
                                      @RequestParam("taskId") Integer taskId,
                                      @RequestParam("status") Integer status,
                                      @RequestParam("userId") Integer userId,
                                      @RequestParam("name") String name) {
        AppResult result = new AppResult();
        Map<String, Integer> map = taskReceiveService.getTaskStatus(status);
        // 更新订单状态
        Task task = new Task();
        task.setId(taskId);
        task.setStatus(map.get("taskStatus"));
        task.setReceiverServiceOrg(name);
        task.setUpdateTime(new Date());
        if (taskService.updateByPrimaryKeySelective(task)) {
            TaskReceive taskReceive = new TaskReceive();
            taskReceive.setId(id);
            taskReceive.setStatus(map.get("taskReceiveStatus"));
            taskReceive.setUpdateTime(new Date());
            if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
                taskService.sendTasktoUser(task, userId, name, 0, JPushQuantity.SERVICEOBJECT);
                //更新缓存
                Task cache = taskService.getCache(taskId);
                if (ObjectUtils.isNotNull(cache)) {
                    cache.setStatus(map.get("taskStatus"));
                    cache.setReceiverServiceOrg(name);
                    cache.setUpdateTime(new Date());
                    taskService.updateCache(cache);
                }
                result.markSuccess("接单成功", null);
            } else {
                result.markError("接单失败");
            }
        }

        return result;
    }

    /**
     * 更新抢单状态
     *
     * @param id
     * @param taskId
     * @param userId
     * @param name
     * @return
     */
    @RequestMapping(value = "updateRobTaskStatus", method = RequestMethod.POST)
    @Transactional
    @ResponseBody
    public synchronized AppResult updateRobTaskStatus(@RequestParam("id") Integer id,
                                                      @RequestParam("taskId") Integer taskId,
                                                      @RequestParam("userId") Integer userId,
                                                      @RequestParam("name") String name) {
        AppResult result = new AppResult();
        TaskReceive taskReceive = taskReceiveService.selectByPrimaryKey(id);
        if (taskReceive.getReceiverId() != 0) {
            result.markError("該单已经被抢");
        } else {
            // 更新订单状态
            Task task = new Task();
            task.setId(taskId);
            task.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
            task.setReceiverServiceOrg(name);
            task.setUpdateTime(new Date());
            try {
                User user = userService.selectByPrimaryKey(userId);
                boolean flag = false;
                List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectByNameAndServiceOrgId(taskReceive.getServiceName(), Integer.parseInt(user.getServiceOrgId()));
                if (ObjectUtils.isNotNull(serviceOrgPrices)) {
                    for (ServiceOrgPrice serviceOrgPrice : serviceOrgPrices) {
                        if (!ObjectUtils.isNull(serviceOrgPrice.getPrice()) && serviceOrgPrice.getPrice() != -1) {
                            Double price = serviceOrgPrice.getPrice();
                            if (!serviceOrgPrice.getServiceUnit().contains("小时")) {
                                task.setMoney(price);
                                task.setPriceInfo(price + "元");
                            } else {
                                task.setPriceInfo(price + "元（按小时计）");
                                task.setMoney(price);
                            }
                            flag = true;
                        }
                    }
                    if (!flag) {
                        result.markError("抢单失败，请完善价格体系");
                        return result;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                result.markError("抢单失败");
                return result;
            }
            if (taskService.updateByPrimaryKeySelective(task)) {
                taskReceive.setId(id);
                taskReceive.setReceiverId(userId);
                taskReceive.setStatus(TaskReceiveQuantity.RESPONSE);
                taskReceive.setUpdateTime(new Date());
                if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
                    taskService.sendTasktoUser(task, userId, name, 0, JPushQuantity.SERVICEOBJECT);
                    //更新缓存
                    Task cache = taskService.getCache(taskId);
                    System.out.println(JacksonUtil.bean2Json(cache));
                    if (ObjectUtils.isNotNull(cache)) {
                        cache.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
                        cache.setReceiverServiceOrg(name);
                        cache.setUpdateTime(new Date());
                        if (ObjectUtils.isNotNull(task.getPriceInfo())) {
                            cache.setPriceInfo(task.getPriceInfo());
                        }
                        if (ObjectUtils.isNotNull(task.getMoney())) {
                            cache.setMoney(task.getMoney());
                        }
                        taskService.updateCache(cache);
                    }
                    result.markSuccess("抢单成功", null);
                } else {
                    result.markError("抢单失败");
                }
            }
        }

        return result;
    }

    /**
     * 派单
     *
     * @param receiveId 接受者Id
     * @param taskId    订单Id
     * @param creatorId 创建者Id
     * @return
     */
    @RequestMapping(value = "insertTaskReceive", method = RequestMethod.POST)
    @ResponseBody
    public AppResult insertTaskReceive(@RequestParam("id") Integer id,
                                       @RequestParam("name") String name,
                                       @RequestParam("userId") Integer creatorId,
                                       @RequestParam("taskId") Integer taskId,
                                       @RequestParam("receiveId") Integer receiveId) {
        AppResult result = new AppResult();
        TaskReceive taskReceive = new TaskReceive();// 派单给服务人员 新增一条数据
        taskReceive.setTaskId(taskId);
        taskReceive.setReceiverId(receiveId);
        taskReceive.setCreatorId(creatorId);
        taskReceive.setUpdateTime(new Date());
        taskReceive.setStatus(TaskReceiveQuantity.NOT_RESPONSE);
        if (taskReceiveService.insert(taskReceive)) {
            TaskReceive taskReceive1 = new TaskReceive();// 组织数据状态改为派单
            taskReceive1.setId(id);
            taskReceive1.setStatus(TaskReceiveQuantity.DISPATCH);
            taskReceive1.setUpdateTime(new Date());
            if (taskReceiveService.updateByPrimaryKeySelective(taskReceive1)) {
                Task task = new Task();
                task.setId(taskId);
                task.setReceiverServiceOrg(name);
                task.setStatus(TaskQuantity.SERVICEORG_DISPATCH);
                task.setUpdateTime(new Date());
                if (taskService.updateByPrimaryKeySelective(task)) {
                    taskService.sendTasktoUser(task, creatorId, name, receiveId, JPushQuantity.SERVICEUSER);
                    //更新缓存
                    Task cache = taskService.getCache(taskId);
                    if (ObjectUtils.isNotNull(cache)) {
                        cache.setReceiverServiceOrg(name);
                        cache.setStatus(TaskQuantity.SERVICEORG_DISPATCH);
                        cache.setUpdateTime(new Date());
                        taskService.updateCache(cache);
                    }
                    result.markSuccess("派单成功", null);
                }
            } else {
                result.markError("派单失败");
            }
        } else {
            result.markError("派单失败");
        }
        return result;
    }

    /**
     * 组织撤销订单
     *
     * @return
     */
    @RequestMapping(value = "deleteTaskReceive", method = RequestMethod.POST)
    @ResponseBody
    public AppResult deleteTaskReceive(@RequestParam("id") Integer id,
                                       @RequestParam("taskId") Integer taskId,
                                       @RequestParam("userId") Integer userId,
                                       @RequestParam("receiveId") Integer receiveId,
                                       @RequestParam("name") String name) {
        AppResult result = new AppResult();
        if (taskReceiveService.deleteByPrimaryKey(id)) {
            Task task = new Task();
            task.setId(taskId);
            task.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
            task.setUpdateTime(new Date());
            if (taskService.updateByPrimaryKeySelective(task)) {
                Task cache = (Task) taskService.getCache(taskId);
                if (ObjectUtils.isNotNull(cache)) {
                    cache.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
                    cache.setReceiverServiceOrg(name);
                    cache.setUpdateTime(new Date());
                    taskService.updateCache(cache);
                }
                List<String> receivers = new ArrayList<>();
                receivers.add(receiveId.toString());
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("task", cache);
                jsonObject.put("content", name + "撤销了您的订单号为" + cache.getNumber() + "的订单！");
                Message message = new Message();
                message.setTitle("推送消息");
                message.setCreateTime(new Date());
                message.setCreatorId(userId);
                message.setType(MessageQuantity.APPNOTICE);
                message.setAttach(TaskQuantity.DETELED + "");
                List<Integer> uids = new ArrayList<>();
                message.setContent(jsonObject.toString());
                uids.add(receiveId);
                messageService.sendMessage(message, uids);
                jpushService.sendUserMessage(receivers, name + "撤销了你的工单号为" + cache.getNumber() + "的工单！", JSON.toJSONString(jsonObject), 0);
                result.markSuccess("撤销订单成功", null);
            } else {
                result.markError("撤销订单失败");
            }
        } else {
            result.markError("撤销订单失败");
        }
        return result;
    }


}
