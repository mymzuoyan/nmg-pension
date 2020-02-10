package com.fedtech.pension.controller.admin.task;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.task.entity.Task;
import com.fedtech.pension.task.entity.UserLinkElder;
import com.fedtech.pension.task.service.UserLinkElderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 居家服务老人控制层
 * @author lil
 * @date 2019/9/19 16:38
 */
@Controller
@RequestMapping("/userLinkElder")
public class UserLinkElderController extends BaseController {

    @Reference(version = "1.0.0")
    private UserLinkElderService elderService;

    protected Logger logger = LoggerFactory.getLogger(TaskController.class);

    public final String ADMIN_PREFIX = "/admin/task/";

    /**
     * 列表页面
     * @return
     */
    @RequestMapping("view")
    public String userLinkElder(){
        return ADMIN_PREFIX + "user_link_elder_list";
    }

    /**
     * 列表数据
     * @param elder
     * @param pageRequest
     * @return
     */
    @PostMapping("listData")
    @ResponseBody
    public PageResponse<UserLinkElder> listData(UserLinkElder elder, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            Task task = new Task();
            task.setReceiverServiceOrg(currentUser().getServiceOrgName());
            elder.setTask(task);
        }
        PageResponse<UserLinkElder> tasks = elderService.selectLinkElderList(elder, pageRequest);
        return tasks;
    }
}
