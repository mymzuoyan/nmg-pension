package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.call.entity.Monitor;
import com.fedtech.pension.call.entity.MonitorGroup;
import com.fedtech.pension.call.service.MonitorGroupService;
import com.fedtech.pension.call.service.MonitorService;
import com.fedtech.pension.cdr.service.CdrService;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/12
 */
@Controller
@RequestMapping("/admin/call/monitor")
public class MonitorController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(MonitorController.class);

    @Reference(version = "1.0.0")
    private MonitorService monitorService;

    @Reference(version = "1.0.0")
    private MonitorGroupService monitorGroupService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private CdrService cdrService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    public MonitorController() {
    }

    /**
     * 创建坐席页面
     *
     * @return
     */
    @RequestMapping("add")
    public String showPage_addMonitor(Model model) {
        List<MonitorGroup> monitorGroups = monitorGroupService.getAllRecode(null);
        model.addAttribute("monitorGroups", monitorGroups);
        return ADMIN_CALL_PREFIX + "monitor_add";
    }

    /**
     * 坐席列表页面
     * id：坐席组id
     *
     * @return
     */
    @RequestMapping("groupMonitors/{id}")
    public String showPage_GroupListMonitor(@PathVariable("id") Integer groupId, Model model) {
        model.addAttribute(groupId);
        return ADMIN_CALL_PREFIX + "group_monitor_list";
    }

    /**
     * 坐席列表页面
     *
     * @return
     */
    @RequestMapping("list")
    public String showPage_listMonitor() {
        return ADMIN_CALL_PREFIX + "monitor_list";
    }

    /**
     * 坐席状态页面
     *
     * @return
     */
    @RequestMapping("status")
    public String showPage_MoitorsStatus() {
        return ADMIN_CALL_PREFIX + "monitor_status";
    }

    /**
     * 查看更新
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/update/{id}")
    public String updateMonitor(@PathVariable("id") Integer id, Model model) {
        Monitor monitor = monitorService.selectByMonitorId(id);
        model.addAttribute(monitor);
        List<User> users = userService.selectUsers();
//        List<MonitorGroup> monitorGroups = monitorGroupService.getAllRecode(null);
        model.addAttribute("users", users);
        return ADMIN_CALL_PREFIX + "monitor_info";
    }

    /**
     * 显示坐席组
     *
     * @return
     */
    @RequestMapping("group")
    public String showMonitorGroup() {
        return ADMIN_CALL_PREFIX + "monitor_group";
    }

    /**
     * 显示来电
     *
     * @return
     */
    @RequestMapping("phone")
    public String showPhoneCall(Integer id, Model model) {
        model.addAttribute("phone", id);
        model.addAttribute("elder", elderlyMsgService.selectByPhone(id.toString()));
        return ADMIN_CALL_PREFIX + "phone_call";
    }
}
