package com.fedtech.pension.controller.admin.task;

import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author CoderQiang
 * @date 2017/1/19
 */
@Controller
@RequestMapping("/admin/dispatch/")
public class DispatchController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/task/";


    @RequestMapping("/map")
    public String showMap() {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            return ADMIN_PREFIX + "dispatch_map_zu";
        } else {
            return ADMIN_PREFIX + "dispatch_map";
        }
    }

    @RequestMapping("/dispatchADemand/{id}")
    public String showDispatchADemand(@PathVariable("id") Integer taskId, Model model) {
        model.addAttribute("taskId", taskId);
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            return ADMIN_PREFIX + "dispatch_a_demand_zu";
        } else {
            return ADMIN_PREFIX + "dispatch_a_demand";
        }
    }

}
