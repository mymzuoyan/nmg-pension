package com.fedtech.pension.controller.admin.monitor;


import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/monitor/institution/")
public class InstitutionMonitorController extends BaseController {



    public final String ADMIN_PREFIX = "/admin/monitor/";


    /**
     * 养老机构列表显示
     *
     * @return
     */
    @RequestMapping("serviceInstitutionList")
    public String showInstitutions(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }
       if (currentUser.hasRole(RoleType.JgAdmin.getValue())) {
           return "redirect:/admin/institution/detail/" + currentUser().getServiceOrgId();
       } else {
          return ADMIN_PREFIX + "institution_list";
       }
    }


}
