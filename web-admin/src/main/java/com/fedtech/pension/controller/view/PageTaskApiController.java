package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.ServiceProject;
import com.fedtech.pension.sys.entity.ServiceType;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.ServiceProjectService;
import com.fedtech.pension.sys.service.ServiceTypeService;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.service.TaskHandleService;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import com.fedtech.pension.task.service.UserLinkElderService;
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
import java.util.Date;
import java.util.List;

/**
 * Created by CoderQiang on 2017/5/16.
 */
@Controller
@RequestMapping("/view/api/task/")
public class PageTaskApiController extends BaseController {
    protected Logger logger = LoggerFactory.getLogger(PageTaskApiController.class);

    SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    @Reference(version = "1.0.0")
    private UserService userService;
    @Reference(version = "1.0.0")
    private TaskService taskService;
    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;
    @Reference(version = "1.0.0")
    private TaskHandleService taskHandleService;
    @Reference(version = "1.0.0")
    private ServiceTypeService serviceTypeService;
    @Reference(version = "1.0.0")
    private ServiceProjectService serviceProjectService;
    @Reference(version = "1.0.0")
    private UserLinkElderService userLinkElderService;

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
        Integer userId = currentUser().getUid();
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(userId)) {
            result.markError("请先登录");
            return result;
        }
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
        task.setSource("web");
        task.setType(TaskQuantity.TYPE_DEMAND);//需求
        task.setStatus(TaskQuantity.NOT_RESPONSE);//待响应
        task.setCreateTime(new Date());
        task.setCreatorId(userId);
        task.setCreatorPhone(currentUser().getPhone());

        //查询关联老人
        UserLinkElder query = new UserLinkElder();
        query.setUserId(currentUser().getUid());
        query.setId(task.getElderId());
        Boolean flag = false;
        List<UserLinkElder> userLinkElders = userLinkElderService.getAllRecode(query);
        if (ObjectUtils.isNull(serviceOrgId)) {
            result.markError("该老人不存在");
        } else {
            for (UserLinkElder elder : userLinkElders) {
                if (elder.getId().equals(task.getElderId())) {
                    flag = true;
                }
            }
        }
        if (!flag) {
            result.markError("该老人不存在");
        }
        if (ObjectUtils.isNotNull(serviceOrgId)) {
            User filter = new User();
            filter.setServiceOrgId(serviceOrgId + "");
            //确定了组织
            List<User> users = userService.selectAllUserByRole(filter, RoleType.ZuAdmin.getId());
            if (ObjectUtils.isNotNull(users)) {
                User u = users.get(0);
                task.setReceiverServiceOrg(u.getServiceOrgName());
                int senderType = 1;
                if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
                    senderType = 2;
                }
                if (taskService.sendTask(task, u.getUid() + "", null, userId, senderType)) {
                    result.markSuccess("发布需求成功", task);
                } else {
                    result.markError("发布需求失败");
                }
            } else {
                result.markError("该组织没有管理员");
            }
            return result;
        }
        //不确定组织和服务人员
        if (taskService.sendTask(task, userId)) {
            result.markSuccess("发布需求成功", task);
        } else {
            result.markError("发布需求");
        }
        return result;
    }


    /**
     * 分页获取已发出工单
     *
     * @param pageNum
     * @param status  0:未完成 1：待评价  2：全部订单
     * @return
     */
    @RequestMapping(value = "getTaskList", method = RequestMethod.POST)
    @ResponseBody
    public AppResult getTaskList(@RequestParam(value = "pageNum") Integer pageNum,
                                 @RequestParam(value = "status") Integer status) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("请先登录");
            return result;
        }
        if (!ObjectUtils.isNotNull(pageNum)) {
            pageNum = 1;
        }
        int length = 5;
        JSONObject jo = new JSONObject();
        if (status == 0) {
            //未完成
            List<Task> milTasks = taskService.selectUnDoTask(currentUser().getUid(), (pageNum - 1) * length, length);
            int count = taskService.countUnDoTask(currentUser().getUid());
            jo.put("totalPage", count % length > 0 ? count / length + 1 : count / length);
            jo.put("tasks", milTasks);
        } else {
            PageRequest pageRequest = new PageRequest();
            pageRequest.setLength(length);
            pageRequest.setOrderField("id");
            pageRequest.setOrderDir("DESC");
            pageRequest.setStart(length * (pageNum - 1));
            Task filter = new Task();
            filter.setCreatorId(currentUser().getUid());
            if (status == 1) {
                //待评价
                filter.setStatus(TaskQuantity.COMPLETE);
            } else if (status == 2) {
                //所有的
            }
            PageResponse<Task> taskPageResponse = taskService.selectPageList(filter, pageRequest);
            int count = taskPageResponse.getRecordsFiltered();
            jo.put("totalPage", count % length > 0 ? count / length + 1 : count / length);
            jo.put("tasks", taskPageResponse.getData());
        }
        result.markSuccess("获取工单列表", jo);
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
     * 确认完成订单
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "completeTask", method = RequestMethod.POST)
    @ResponseBody
    public AppResult completeTask(@RequestParam("id") Integer id) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("请先登录");
            return result;
        }
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
    public AppResult evaluateTask(@RequestParam("id") Integer id, @RequestParam("creatorName") String creatorName, @RequestParam("creatorId") Integer creatorId, @RequestParam(value = "comment", required = false) String comment, @RequestParam("level") Integer level) {
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("请先登录");
            return result;
        }
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
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("请先登录");
            return result;
        }
        JSONObject jsonObject = taskHandleService.getTaskHandleList(taskId);
        if (ObjectUtils.isNotNull(jsonObject)) {
            result.markSuccess("获取一个工单处理流程成功", jsonObject);
        } else {
            result.markError("获取一个工单处理流程失败");
        }
        return result;
    }

    /**
     * 获取服务类型列表
     *
     * @return
     */
    @RequestMapping(value = "serviceType/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceTypeList(ServiceType filter) {
        AppResult result = new AppResult();
        List<ServiceType> serviceTypes = serviceTypeService.getAllRecode(filter);
        result.markSuccess("获取服务类型列表成功", serviceTypes);
        return result;
    }

    /**
     * 获取服务项目列表成功
     *
     * @param serviceTypeId
     * @return
     */
    @RequestMapping(value = "serviceProject/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceProjectList(@RequestParam(value = "serviceTypeId", required = false) Integer serviceTypeId) {
        AppResult result = new AppResult();
        ServiceProject serviceProject = new ServiceProject();
        serviceProject.setServiceType(serviceTypeId);
        List<ServiceProject> serviceProjects = serviceProjectService.getAllRecode(serviceProject);
        result.markSuccess("获取服务项目列表成功", serviceProjects);
        return result;
    }


}
