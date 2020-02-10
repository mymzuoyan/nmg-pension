package com.fedtech.pension.controller.admin.monitor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgAssessment;
import com.fedtech.pension.org.service.ServiceOrgAssessmentService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserApprove;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserApproveService;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;


@Controller
@RequestMapping("/admin/monitor/")
public class ServiceOrgMonitorController extends BaseController {
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgAssessmentService serviceOrgAssessmentService;

    @Reference(version = "1.0.0")
    public UserService userService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private UserApproveService userApproveService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    public final String ADMIN_PREFIX = "/admin/monitor/";


    /**
     * 养老服务组织信息显示
     *
     * @return
     */
    @RequestMapping("serviceOrgShow")
    public String showServiceOrg(@RequestParam(value = "areaName", required = false) String areaName,
                                 @RequestParam(value = "grade", required = false) Integer grade,
                                 @RequestParam(value = "socialForce", required = false) String socialForce,
                                 Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
            model.addAttribute("grade", grade);
            model.addAttribute("socialForce", socialForce);
        }
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            return "redirect:/admin/serviceOrgDetail/" + currentUser().getServiceOrgId() + "?method=edit";
        } else {
            return ADMIN_PREFIX + "serviceOrg_list";
        }
    }

    /**
     * 组织视频列表显示
     *
     * @return
     */
    @RequestMapping("video/list")
    public String showServiceOrgMonitor(@RequestParam(value = "orgId", required = false) String orgId,
                                        @RequestParam(value = "orgName", required = false) String orgName,Model model) throws UnsupportedEncodingException {
//         String name = new String(orgName.getBytes("iso-8859-1"), "utf-8");
        if (ObjectUtils.isNotNull(orgId)) {
            model.addAttribute("orgId", orgId);
            model.addAttribute("orgName", orgName);
        }
        return ADMIN_PREFIX + "serviceOrg_monitorList";
    }

    /**
     * 组织视频列表预览
     *
     * @return
     */
    @RequestMapping("video/source/{id}")
    public String showServiceOrgVideo(@PathVariable("id") Integer id, @RequestParam(value = "serviceOrgName", required = false) String serviceOrgName ,Model model) throws UnsupportedEncodingException {
//        String name = new String(serviceOrgName.getBytes("iso-8859-1"), "utf-8");
        if (ObjectUtils.isNotNull(id)) {
            model.addAttribute("orgId", id);
            model.addAttribute("orgName", serviceOrgName);
        }
        return ADMIN_PREFIX + "service_org_video";
    }


}
