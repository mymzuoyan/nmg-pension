package com.fedtech.pension.controller.admin.sys;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Gong
 * @date 2016/5/11
 */
@Controller
@RequestMapping("/admin/sys/")
public class SystemController extends BaseController {

    @RequestMapping("perm")
    public String showPermissionPage() {
        return ADMIN_PREFIX + "/sys/sys_permission";
    }

    @RequestMapping("role")
    public String showRolesPage() {
        return ADMIN_PREFIX + "/sys/sys_role";
    }

    @RequestMapping("log")
    public String showLogsPage() {
        return ADMIN_PREFIX + "/sys/sys_log";
    }




}
