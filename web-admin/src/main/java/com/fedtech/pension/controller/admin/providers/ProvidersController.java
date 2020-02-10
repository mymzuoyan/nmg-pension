package com.fedtech.pension.controller.admin.providers;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.CertificateService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.service.UserApproveService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Administrator
 * @date 2016/9/29
 */
@Controller
@RequestMapping("/admin/")
public class ProvidersController extends BaseController {


    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    public final String ADMIN_PREFIX = "/admin/providers/";


    /**
     * 市场企业显示
     * @return
     */
    @RequestMapping("providersShow")
    public String showProvider(){
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            return "redirect:/admin/providersDetail/" + currentUser().getServiceOrgId();
        } else {
            return ADMIN_PREFIX + "providers_list";
        }
    }


    /**
     * 组织定位
     *
     * @return
     */
    @RequestMapping("providersDetailMap/{id}")
    public String showServiceOrgDetailMap(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "providers_detail_map";
    }

    /**
     * 市场企业信息查看或修改
     * @param id
     * @return
     */
    @RequestMapping("providersDetail/{id}")
    public String providersDetail(@PathVariable("id") Integer id, Model model) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(id);
        model.addAttribute("m", serviceOrg);
        return ADMIN_PREFIX + "providers_detail";
    }


    /**
     * 市场企业信息新增
     * @return
     */
    @RequestMapping("providers/Add")
    public String addProvider() {
        return ADMIN_PREFIX + "providers_add";
    }
}
