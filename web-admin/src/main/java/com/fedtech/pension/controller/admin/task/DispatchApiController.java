package com.fedtech.pension.controller.admin.task;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.call.service.CustomerService;
import com.fedtech.pension.call.vo.ComingCallInfoVo;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.service.ServiceOrgLocationService;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserState;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.JPushQuantity;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.quantity.TaskReceiveQuantity;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author CoderQiang
 * @date 2017/1/19
 */
@Controller
@RequestMapping("/admin/dispatch/api/")
public class DispatchApiController extends BaseController {
    protected Logger logger = LoggerFactory.getLogger(DispatchApiController.class);

    @Reference(version = "1.0.0")
    private CustomerService customerService;

    @Reference(version = "1.0.0")
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;


    /**
     * 获取正在来电的号码
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getCallingNum", method = RequestMethod.POST)
    public List<ComingCallInfoVo> getCallingNum() {
        return null;
    }

    /**
     * 获取工单列表
     *
     * @return
     */
    @RequestMapping(value = "getDemands", method = RequestMethod.POST)
    @ResponseBody
    public Map<Integer, Task> getDemands() {
        boolean isZuZhi = false;
        Integer serviceOrgId = null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            isZuZhi = true;
            serviceOrgId = Integer.parseInt(currentUser().getServiceOrgId());
        }
        return taskService.getDemands(isZuZhi, serviceOrgId);
    }

    /**
     * 获取所有的工单数量统计
     *
     * @return
     */
    @RequestMapping(value = "getCount", method = RequestMethod.POST)
    @ResponseBody
    public Properties getCount() {
        return taskService.getCount();
    }

    /**
     * 获取某组织所有的工单数量统计
     *
     * @return
     */
    @RequestMapping(value = "getServiceTaskCount", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> getServiceTaskCount() {
        Integer serviceOrgId = 0;
        try {
            serviceOrgId = Integer.parseInt(currentUser().getServiceOrgId());
        } catch (Exception e) {
            e.printStackTrace();

        }
        Map<String, Integer> result = new HashMap<>();
        Task filter = new Task();
        ServiceOrgLocation serviceOrgLocation = (ServiceOrgLocation) serviceOrgLocationService.selectByServiceOrgId(serviceOrgId);
        if (!ObjectUtils.isNotNull(serviceOrgLocation)) {
            return result;
        }
        filter.setReceiverServiceOrg(serviceOrgLocation.getServiceOrgName());
        int allCount = taskService.count(filter);
        result.put("allCount", allCount);
        HashMap hashMap = taskService.getHashFromCache();
        Set<Integer> ids = hashMap.keySet();
        for (Integer id : ids) {
            Task task = (Task) hashMap.get(id);
            if (serviceOrgLocation.getServiceOrgName().equals(task.getReceiverServiceOrg())) {
                switch (task.getStatus()) {
                    case 1:
                        allCount--;
                        addMapValue(result, "undo", 1);
                        break;
                    case 9:
                        allCount--;
                        addMapValue(result, "done", 1);
                        break;
                    case 10:
                        break;
                    default:
                        allCount--;
                        addMapValue(result, "doing", 1);
                        break;
                }
            }
        }
        result.put("done", allCount);
        return result;
    }


    /**
     * 获取今天工单数量
     *
     * @return
     */
    @RequestMapping(value = "getTodayTaskCount", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> getTodayTaskCount() {
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        HashMap hashMap = taskService.getHashFromCache();
        Set<Integer> ids = hashMap.keySet();
        Map<String, Integer> result = new HashMap<>();
        for (Integer id : ids) {
            Task task = (Task) hashMap.get(id);
            if (ObjectUtils.isNotNull(task) && ObjectUtils.isNotNull(task.getCreateTime())) {
                if (df.format(new Date()).equals(df.format(task.getCreateTime()))) {
                    switch (task.getStatus()) {
                        case 1:
                            addMapValue(result, "undo", 1);
                            break;
                        case 9:
                            addMapValue(result, "done", 1);
                            break;
                        case 10:
                            addMapValue(result, "done", 1);
                            break;
                        default:
                            addMapValue(result, "doing", 1);
                            break;
                    }
                }
            }
        }
        return result;
    }

    /**
     * 获取服务人员列表
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getServiceUsers", method = RequestMethod.POST)
    public List<UserState> getServiceUsers() {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            return taskService.getServiceUsers(Integer.parseInt(currentUser().getServiceOrgId()));
        } else {
            return taskService.getServiceUsers();
        }
    }

    /**
     * 获取组织地理位置信息
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getServiceOrgLocation", method = RequestMethod.POST)
    public ServiceOrgLocation getServiceOrgLocation(Integer id) {
        return serviceOrgLocationService.selectByServiceOrgId(id);
    }


    /**
     * 接受工单
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "acceptTask", method = RequestMethod.POST)
    public JsonResult acceptTask(Integer id, String receiverOrgName) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            if (ObjectUtils.isNotNull(receiverOrgName)) {
                if (currentUser().getServiceOrgName().equals(receiverOrgName)) {
                    return updateTaskStatus(id);
                } else if (receiverOrgName.equals("")) {
                    return updateRobTaskStatus(id);
                }
            } else {
                return updateRobTaskStatus(id);
            }
        }
        return null;
    }


    /**
     * 组织接受工单
     *
     * @param taskId
     * @return
     */
    @RequestMapping(value = "updateTaskStatus", method = RequestMethod.POST)
    @Transactional
    public JsonResult updateTaskStatus(@RequestParam("taskId") Integer taskId) {
        Map<String, Integer> map = taskReceiveService.getTaskStatus(TaskQuantity.SERVICEORG_RESPONSE);
        JsonResult result = new JsonResult();
        Task task = new Task();
        task.setId(taskId);
        task.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
        task.setReceiverServiceOrg(currentUser().getServiceOrgName());
        task.setUpdateTime(new Date());
        if (taskService.updateByPrimaryKeySelective(task)) {
            TaskReceive taskReceive = taskReceiveService.getTaskByTaskIdAndRole(taskId, RoleType.ZuAdmin.getId());
            if (ObjectUtils.isNotNull(taskReceive)) {
                taskReceive.setStatus(map.get("taskReceiveStatus"));
                taskReceive.setUpdateTime(new Date());
                if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
                    taskService.sendTasktoUser(task, currentUser().getUid(), currentUser().getServiceOrgName(), 0, JPushQuantity.SERVICEOBJECT);
                    //更新缓存
                    Task cache = taskService.getCache(taskId);
                    if (ObjectUtils.isNotNull(cache)) {
                        cache.setStatus(map.get("taskStatus"));
                        cache.setReceiverServiceOrg(currentUser().getServiceOrgName());
                        cache.setUpdateTime(new Date());
                        taskService.updateCache(cache);
                    }
                    result.markSuccess("接单成功", null);
                } else {
                    result.markError("接单失败");
                }
            }
        }
        return result;
    }

    /**
     * 更新抢单状态
     *
     * @param taskId
     * @return
     */
    @RequestMapping(value = "updateRobTaskStatus", method = RequestMethod.POST)
    @Transactional
    @ResponseBody
    public JsonResult updateRobTaskStatus(@RequestParam("taskId") Integer taskId) {
        JsonResult result = new JsonResult();
        TaskReceive taskReceive = taskReceiveService.selectByLastTask(taskId);
        if (taskReceive.getReceiverId() != 0) {
            result.markError("该单已被抢了");
        } else {
            // 更新订单状态
            Task task = new Task();
            task.setId(taskId);
            task.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
            task.setReceiverServiceOrg(currentUser().getServiceOrgName());
            task.setUpdateTime(new Date());
            try {
                User user = userService.selectByPrimaryKey(currentUser().getUid());
                List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectByNameAndServiceOrgId(taskReceive.getServiceName(), Integer.parseInt(user.getServiceOrgId()));
                boolean flag = false;
                if (ObjectUtils.isNull(serviceOrgPrices)) {
                    for (ServiceOrgPrice serviceOrgPrice : serviceOrgPrices) {
                        if (!ObjectUtils.isNull(serviceOrgPrice.getPrice()) && serviceOrgPrice.getPrice() != -1) {
                            Double price = serviceOrgPrice.getPrice();
                            if (!serviceOrgPrice.getServiceUnit().contains("小时")) {
                                task.setMoney(price);
                                task.setPriceInfo(price + "元");
                            } else {
                                task.setPriceInfo(price + "元（按一小时记）");
                            }
                            flag = true;
                        }
                    }
                    if (!flag) {
                        result.markError("抢单失败,请完善价格体系");
                        return result;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                result.markError("抢单失败");
                return result;
            }
            if (taskService.updateByPrimaryKeySelective(task)) {
                taskReceive.setId(taskReceive.getId());
                taskReceive.setReceiverId(currentUser().getUid());
                taskReceive.setStatus(TaskReceiveQuantity.RESPONSE);
                taskReceive.setUpdateTime(new Date());
                if (taskReceiveService.updateByPrimaryKeySelective(taskReceive)) {
                    taskService.sendTasktoUser(task, currentUser().getUid(), currentUser().getServiceOrgName(), 0, JPushQuantity.SERVICEOBJECT);
                    //更新缓存
                    Task cache = taskService.getCache(taskId);
                    if (ObjectUtils.isNotNull(cache)) {
                        cache.setStatus(TaskQuantity.SERVICEORG_RESPONSE);
                        cache.setReceiverServiceOrg(currentUser().getServiceOrgName());
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
     * @param taskId
     * @param receiveId
     * @return
     */
    @RequestMapping(value = "insertTaskReceive", method = RequestMethod.POST)
    @ResponseBody
    public AppResult insertTaskReceive(@RequestParam("taskId") Integer taskId,
                                       @RequestParam("receiveId") Integer receiveId) {
        if (!getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            return null;
        }
        AppResult result = new AppResult();
        TaskReceive taskReceive = new TaskReceive();// 派单给服务人员 新增一条数据
        taskReceive.setTaskId(taskId);
        taskReceive.setReceiverId(receiveId);
        taskReceive.setCreatorId(currentUser().getUid());
        taskReceive.setUpdateTime(new Date());
        taskReceive.setStatus(TaskReceiveQuantity.NOT_RESPONSE);
        if (taskReceiveService.insert(taskReceive)) {
            TaskReceive taskReceive1 = taskReceiveService.getTaskByTaskIdAndRole(taskId, RoleType.ZuAdmin.getId());
            if (ObjectUtils.isNull(taskReceive1)) {
                result.markError("派单失败");
            }
            taskReceive1.setStatus(TaskReceiveQuantity.DISPATCH);
            taskReceive1.setUpdateTime(new Date());
            if (taskReceiveService.updateByPrimaryKeySelective(taskReceive1)) {
                Task task = new Task();
                task.setId(taskId);
                task.setStatus(TaskQuantity.SERVICEORG_DISPATCH);
                task.setUpdateTime(new Date());
                if (taskService.updateByPrimaryKeySelective(task)) {
                    taskService.sendTasktoUser(task, currentUser().getUid(), currentUser().getServiceOrgName(), receiveId, JPushQuantity.SERVICEUSER);
                    //更新缓存
                    Task cache = taskService.getCache(taskId);
                    if (ObjectUtils.isNotNull(cache)) {
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


    private void addMapValue(Map<String, Integer> map, String key, Integer value) {
        if (ObjectUtils.isNotNull(map.get(key))) {
            map.put(key, (map.get(key) + value));
        } else {
            map.put(key, value);
        }
    }

}
