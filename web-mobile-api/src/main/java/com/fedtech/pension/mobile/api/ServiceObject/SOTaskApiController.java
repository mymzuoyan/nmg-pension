package com.fedtech.pension.mobile.api.ServiceObject;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.Point;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.GeoUtils;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.mobile.redis.RedisServiceOrgLocationUtil;
import com.fedtech.pension.mobile.redis.RedisUserStateUtil;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.service.ServiceOrgLocationService;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.org.vo.RangeVo;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserState;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskReceive;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.service.TaskHandleService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author CoderQiang
 * @date 2017/3/3
 */
@Controller
@RequestMapping("/api/serviceObject/task/")
public class SOTaskApiController {

    protected Logger logger = LoggerFactory.getLogger(SOTaskApiController.class);

    SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0",timeout = 6000)
    private TaskService taskService;

    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    @Reference(version = "1.0.0")
    private TaskHandleService taskHandleService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;


    @Autowired
    private RedisServiceOrgLocationUtil redisServiceOrgLocationUtil;

    @Autowired
    private RedisUserStateUtil redisUserStateUtil;


    /**
     * 发布需求
     *
     * @param task
     * @return
     */
    @RequestMapping(value = "sendADemand", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendADemand(Task task, String timeStr, HttpServletRequest request,
                                 @RequestParam(value = "serviceOrgId", required = false) Integer serviceOrgId) throws Exception {
        Integer userId = Integer.parseInt(request.getHeader("userId"));
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(task.getElderId())) {
            result.markError("请选择服务老人");
            return result;
        }
        if (task.getLat() == null || task.getLat() == 0 || task.getLng() == null && task.getLng() == 0) {
            result.markError("经纬度格式出错");
            return result;
        }
        if (StringUtils.isEmpty(task.getServiceType())) {
            result.markError("服务项目不能为空");
            return result;
        }
        if (StringUtils.isEmpty(task.getServiceAddress())) {
            result.markError("服务地址不能为空");
            return result;
        }
        if (!Strings.isNullOrEmpty(timeStr)) {
            try {
                task.setServiceTime(dateTime.parse(timeStr));
            } catch (ParseException e) {
                e.printStackTrace();
                result.markError("发布时间格式不对");
                return result;
            }
        }
        task.setSource("app");
        task.setType(TaskQuantity.TYPE_DEMAND);//需求
        task.setStatus(TaskQuantity.NOT_RESPONSE);//待响应
        task.setCreateTime(new Date());
        task.setCreatorId(userId);
        if (ObjectUtils.isNotNull(serviceOrgId)) {
            User filter = new User();
            filter.setServiceOrgId(serviceOrgId + "");
            //确定了组织
            List<User> users = userService.selectAllUserByRole(filter, RoleType.ZuAdmin.getId());
            if (ObjectUtils.isNotNull(users)) {
                User u = users.get(0);
                task.setReceiverServiceOrg(u.getServiceOrgName());
                task.setReceiverName("");
                if (taskService.sendTask(task, u.getUid() + "", null, userId, 1)) {
                    result.markSuccess("发布需求成功", task);
                } else {
                    result.markError("发布需求失败");
                }
            } else {
                result.markError("改组织没有管理员");
            }
            return result;
        }
        //不确定组织和服务人员
        if (taskService.sendTask(task, userId)) {
            result.markSuccess("发布需求成功", task);
        } else {
            result.markError("发布需求失败");
        }
        return result;
    }


    /**
     * 获取已发出工单
     *
     * @param userId
     * @param pageNum
     * @param status  0:未完成 1：待评价  2：全部订单  3:待付款
     * @return
     */
    @RequestMapping(value = "getTaskList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskList(@RequestParam("userId") Integer userId,
                                 @RequestParam(value = "pageNum", required = false) Integer pageNum,
                                 @RequestParam(value = "status") Integer status,
                                 @RequestParam(value = "payType", required = false) Integer payType) {
        AppResult result = new AppResult();
        List<Task> milTasks = new ArrayList<>();
        if (!ObjectUtils.isNotNull(pageNum)) {
            pageNum = 0;
        }
        if (status == 0) {
            //未完成
            if (pageNum == 0) {
                milTasks = taskService.selectUnDoTask(userId, -1, 0);

            } else {
                milTasks = taskService.selectUnDoTask(userId, (pageNum - 1) * 5, 5);
            }
        } else if (status == 1) {
            //待评价
            milTasks = taskService.selectListByCreator(userId, TaskQuantity.COMPLETE, pageNum, 5);

        } else if (status == 2) {
            // 根据支付类型查询订单
            if (payType != null) {
                milTasks = taskService.selectListByCreator(userId, TaskQuantity.COMPLETE, payType, pageNum, 5);
            } else {
                //所有的
                milTasks = taskService.selectListByCreator(userId, null, pageNum, 5);
            }
        } else if (status == 3) {
            //代付款
            milTasks = taskService.selectListByCreator(userId, TaskQuantity.PAY, pageNum, 5);
        }
        result.markSuccess("获取工单列表", milTasks);
        return result;
    }

    /**
     * 订单详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getTaskInfo", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskInfo(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        Task task = taskService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(task)) {
            result.markSuccess("获取订单详情成功", task);
        } else {
            result.markError("获取订单详情失败");
        }
        return result;
    }

    /**
     * 生成订单信息
     *
     * @param taskId
     * @param type
     * @return
     */
    @RequestMapping(value = "getTaskOrderInfo", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskInfo(Integer taskId, Integer type, HttpServletRequest request) {
        AppResult result = new AppResult();
        Task task = taskService.selectByPrimaryKey(taskId);
        task.setPayType(type);
        String orderInfo = taskService.createPaymentInfo(task, request.getRemoteAddr());
        if (ObjectUtils.isNotNull(task)) {
            result.markSuccess("生成订单信息成功", orderInfo);
        } else {
            result.markError("生成订单信息失败");
        }
        return result;
    }


    /**
     * 确认完成订单
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "completeTask", method = RequestMethod.POST)
    @ResponseBody
    public AppResult completeTask(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        Task task = new Task();
        task.setId(id);
        task.setStatus(TaskQuantity.COMPLETE);
        task.setUpdateTime(new Date());
        if (taskService.updateByPrimaryKeySelective(task)) {
            result.markSuccess("确认完成订单成功", null);
        } else {
            result.markError("确认完成订单失败");
        }
        return result;
    }


    /**
     * 评价订单
     *
     * @param id
     * @param comment
     * @param level
     * @return
     */
    @RequestMapping(value = "evaluateTask", method = RequestMethod.POST)
    @ResponseBody
    public AppResult evaluateTask(@RequestParam("id") Integer id, @RequestParam("creatorName") String creatorName, @RequestParam("creatorId") Integer creatorId,
                                  @RequestParam(value = "comment", required = false) String comment, @RequestParam("level") Integer level) {
        AppResult result = new AppResult();
        Task task = new Task();
        task.setId(id);
        task.setCreatorId(creatorId);
        task.setCreatorName(creatorName);
        task.setComment(comment);
        task.setLevel(level);
        task.setStatus(TaskQuantity.EVALUATED);
        task.setUpdateTime(new Date());
        if (taskService.updateByPrimaryKeySelective(task)) {
            taskService.evaluateTask(task);
            result.markSuccess("评价订单成功", task);
        } else {
            result.markError("评价订单失败");
        }
        return result;
    }

    /**
     * 获取一个工单处理流程
     *
     * @param taskId
     * @return
     */
    @RequestMapping(value = "getTaskHandleList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskHandleList(@RequestParam("taskId") Integer taskId) {
        AppResult result = new AppResult();
        JSONObject jsonObject = taskHandleService.getTaskHandleList(taskId);
        if (ObjectUtils.isNotNull(jsonObject)) {
            result.markSuccess("获取一个工单处理流程成功", jsonObject);
        } else {
            result.markError("获取一个工单处理流程失败");
        }
        return result;
    }

    /**
     * 获取一个工单与服务人员的距离和工单处理流程
     *
     * @param taskId
     * @return
     */
    @RequestMapping(value = "getRangeBetweenServiceUserAndTask", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getRangeBetweenServiceUserAndTask(@RequestParam("taskId") Integer taskId) {
        AppResult result = new AppResult();
        JSONObject jsonObject = new JSONObject();
        TaskReceive taskReceive = taskReceiveService.getTaskByTaskIdAndRole(taskId, RoleType.ServiceUser.getId());
        if (ObjectUtils.isNotNull(taskReceive)) {
            UserState userState = (UserState) redisUserStateUtil.getUserState(taskReceive.getReceiverId());
            Task task = (Task) taskService.getCache(taskId);
            if (ObjectUtils.isNotNull(task) && ObjectUtils.isNotNull(userState)) {
                Point a = new Point(userState.getLat(), userState.getLng());
                Point b = new Point(task.getLat(), task.getLng());
                double range = GeoUtils.getDistance(a, b);
                jsonObject.put("Range", range);
                jsonObject.put("Task", task);
                jsonObject.put("ServiceUser", userState);
                jsonObject.put("Handle", taskHandleService.getTaskHandles(taskId));
                result.markSuccess("获取成功", jsonObject);
            } else {
                result.markError("获取失败");
            }
        } else {
            result.markError("获取失败");
        }
        return result;

    }

    /**
     * 取得价格区间
     *
     * @param lat
     * @param lng
     * @param serviceProjectId
     * @return
     */
    @RequestMapping(value = "getPriceRange", method = RequestMethod.POST)
    @ResponseBody
    public RangeVo getPriceRange(@RequestParam("lat") Double lat, @RequestParam("lng") Double lng, @RequestParam(value = "serviceProjectId") Integer serviceProjectId) {
        Set<Integer> sids = redisServiceOrgLocationUtil.getKeys();
        List<Integer> resultIds = new ArrayList<>();
        List<ServiceOrgLocation> serviceOrgLocations = serviceOrgLocationService.selectPageListByRange(new ServiceOrgLocation(), 0, 0, lat, lng, Keys.PUSHRANGE);
        if (ObjectUtils.isNotNull(sids)) {
            Point center = new Point();
            center.setLat(lat);
            center.setLng(lng);
            for (ServiceOrgLocation s : serviceOrgLocations) {
                if (ObjectUtils.isNotNull(s) && ObjectUtils.isNotNull(s.getLat())) {
                    Point point = new Point();
                    point.setLat(s.getLat());
                    point.setLng(s.getLng());
                    if (GeoUtils.isPointInCircle(point, center, Keys.PUSHRANGE)) {
                        resultIds.add(s.getServiceOrgId());
                    }
                }
            }
        }
        RangeVo rangeVo = null;
        if (ObjectUtils.isNotNull(resultIds)) {
            rangeVo = serviceOrgPriceService.getPriceRange(serviceProjectId, resultIds);
        } else {
            for(int sis:sids){
                resultIds.add(sis);
            }
            rangeVo = serviceOrgPriceService.getPriceRange(serviceProjectId, resultIds);
        }
        return rangeVo;
    }


}
