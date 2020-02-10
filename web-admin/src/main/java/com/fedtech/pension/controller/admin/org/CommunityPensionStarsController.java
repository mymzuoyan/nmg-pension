package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.CommunityPensionStarsService;
import com.fedtech.pension.org.service.ServiceOrgService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author guxiangyang
 * @date 2019/8/16
 */
@Controller
@RequestMapping("/admin/institution/")
public class CommunityPensionStarsController extends BaseController {


    @Reference(version = "1.0.0")
    private CommunityPensionStarsService communityPensionStarsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    public final String ADMIN_PREFIX = "/admin/serviceSource/";



    /**
     * 内蒙古市社区养老服务站星级评定标准
     *
     * @return
     */
    @RequestMapping("org/communityPensionStarsList")
    public String showCommunityPensionStarsList() {

        return ADMIN_PREFIX + "community_pension_stars_list";
    }


    /**
     * 内蒙古市社区养老服务站星级评定标准（评级）组织账号
     */
    @RequestMapping("org/communityPensionStars/add")
    public String add1(Model model) {
        ServiceOrg serviceOrg = null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            if (!org.springframework.util.StringUtils.isEmpty(Integer.parseInt(currentUser().getServiceOrgId()))) {
                serviceOrg=serviceOrgService.selectByPrimaryKey(Integer.parseInt(currentUser().getServiceOrgId()));
                model.addAttribute("organizationNames",serviceOrg.getInstitutionName());
            }
        }
        return ADMIN_PREFIX + "community_pension_stars_add";
    }

    /**
     * 社区养老服务站星级评定标准详细
     *
     * @return
     */
    @RequestMapping("infoCommunityPensionStars/{id}")
    public String showInfoStarRate(@PathVariable Integer id, Model model) {
        CommunityPensionStars communityPensionStars = communityPensionStarsService.selectByPrimaryKey(id);
        model.addAttribute("star", communityPensionStars);
        return ADMIN_PREFIX + "serviceOrg_community_pension_stars_info";

    }


    /**
     * 社区养老服务站星级评定标准评估
     *
     * @return
     */
    @RequestMapping("assessCommunityPensionStars/{id}")
    public String showAssessStarRate(@PathVariable Integer id, Model model) {
        CommunityPensionStars communityPensionStars = communityPensionStarsService.selectByPrimaryKey(id);
        model.addAttribute("star", communityPensionStars);
        return ADMIN_PREFIX + "serviceOrg_community_pension_stars_assess";

    }




}
