package com.fedtech.pension.controller.admin.task;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.TaskPlan;
import com.fedtech.pension.task.quantity.TaskQuantity;
import com.fedtech.pension.task.quantity.TaskReceiveQuantity;
import com.fedtech.pension.task.service.TaskReceiveService;
import com.fedtech.pension.task.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author Administrator
 * @date 2016/9/18
 */
@Controller
@RequestMapping("/admin/task/")
public class TaskController extends BaseController {

    @Reference(version = "1.0.0")
    private TaskService taskService;
    @Reference(version = "1.0.0")
    private UserService userService;
    @Reference(version = "1.0.0")
    private TaskReceiveService taskReceiveService;

    protected Logger logger = LoggerFactory.getLogger(TaskController.class);

    public final String ADMIN_PREFIX = "/admin/task/";

    /**
     * 发送工单
     *
     * @return
     */
    @RequestMapping("send")
    public String showSend(@RequestParam(value = "id", required = false) Integer id, Model model) {
        if (ObjectUtils.isNotNull(id)) {
            Task task = taskService.selectByPrimaryKey(id);
            model.addAttribute("task", task);
        }
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            //获取服务人员
            List<User> serviceUsers = userService.selectFuwuUserByOrgId(Integer.parseInt(currentUser().getServiceOrgId()), null, 0, 0);
            model.addAttribute("serviceUsers", serviceUsers);
            return ADMIN_PREFIX + "task_send_zu";
        } else {
            return ADMIN_PREFIX + "task_send";

        }

    }


    /**
     * 工单列表
     *
     * @return
     */
    @RequestMapping("app_list")
    public String showAllList() {
        return ADMIN_PREFIX + "task_all_list";
    }

    /**
     * 计划工单
     * @return
     */
    @RequestMapping("plan/list")
    public String getTaskPlanList(Model model, ElderlyMsg elderlyMsg, TaskPlan taskPlan) {
        model.addAttribute("elderlyMsg", elderlyMsg);
        model.addAttribute("taskPlan", taskPlan);
        return ADMIN_PREFIX + "task_plan_all_list";
    }
    /**
     * 工单监管
     *
     * @return
     */
    @RequestMapping("task_supervise")
    public String showSupervise() {
        return ADMIN_PREFIX + "task_supervise";
    }


    /**
     * 发送工单列表
     *
     * @return
     */
    @RequestMapping("send_list")
    public String showSendList() {
        return ADMIN_PREFIX + "task_send_list";
    }

    /**
     * 接收工单列表‘
     *
     * @return
     */
    @RequestMapping("receive_list")
    public String showReceive() {
        return ADMIN_PREFIX + "task_receive";
    }


    /**
     * 市场工单服务记录列表
     *
     * @return
     */
    @RequestMapping("sc_record_list")
    public String scTaskRecordList(String receiverId, Model model) {
        model.addAttribute("receiverId", receiverId);
        return ADMIN_PREFIX + "task_sc_record_list";
    }

    /**
     * 计划工单服务记录列表
     *
     * @return
     */
    @RequestMapping("jh_record_list")
    public String jhTaskRecordList(String receiverId, Model model) {
        model.addAttribute("receiverId", receiverId);
        return ADMIN_PREFIX + "task_jh_record_list";
    }

    /**
     * 详情
     *
     * @param taskId
     * @param model
     * @return
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateTask(@PathVariable("id") Integer taskId, Model model) {
        Task task = taskService.selectByPrimaryKey(taskId);
        boolean b = false;
        if (!StringUtils.isEmpty(task.getReceiverName())) {
            //正在处理（接收人已查看）
            if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
                b = (task.getReceiverName()).indexOf(currentUser().getServiceOrgName()) >= 0;
            } else {
                b = (task.getReceiverName()).indexOf(currentUser().getLogin_name()) >= 0;
            }
            if (b) {
                if (Objects.equals(task.getStatus(), TaskQuantity.NOT_RESPONSE) || Objects.equals(task.getStatus(), TaskQuantity.ADMIN_DISPATCH)) {
                    task.setUpdateTime(new Date());
                    task.setStatus(TaskQuantity.SERVICEORG_RESPONSE);//已响应
                    taskService.updateByPrimaryKeySelective(task);
                    //更新缓存
                }
                taskReceiveService.updateTaskStatus(taskId, currentUser().getUid(), TaskReceiveQuantity.RESPONSE);
            }
        }
        model.addAttribute("task", task);
        return ADMIN_PREFIX + "task_info";
    }

    /**
     * 工单统计
     *
     * @return
     */
    @RequestMapping("task_list")
    public String showTaskList() {
        return ADMIN_PREFIX + "task_list";
    }


    /**
     * 工单统计
     *
     * @return
     */
    @RequestMapping("task_statistics")
    public String showTaskStatistics() {
        return ADMIN_PREFIX + "task_statistics";
    }

    /**
     * 组织金额列表
     *
     * @return
     */
    @RequestMapping("task_serviceOrg_money")
    public String showServiceOrgTaskMoney() {
        return ADMIN_PREFIX + "task_serviceOrg_money";
    }

    /**
     * 组织资金动向列表
     *
     * @return
     */
    @RequestMapping("task_serviceOrg_money_info")
    public String showServiceOrgTaskMoneyInfo() {
        return ADMIN_PREFIX + "task_serviceOrg_money_info";
    }


}
