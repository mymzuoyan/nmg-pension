package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.AreaHomePensionStars;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.AreaHomePensionStarsService;
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
public class AreaHomePensionStarsController extends BaseController {



    @Reference(version = "1.0.0")
    private AreaHomePensionStarsService areaHomePensionStarsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;



    public final String ADMIN_PREFIX = "/admin/serviceSource/";


    /**
     * 内蒙古市社区养老服务站星级评定标准
     *
     * @return
     */
    @RequestMapping("org/areaHomePensionStarsList")
    public String showCommunityPensionStarsList() {

        return ADMIN_PREFIX + "area_home_pension_stars_list";
    }


    /**
     * 内蒙古市区域性居家养老服务中心星级评定标准详细
     *
     * @return
     */
    @RequestMapping("infoAreaHomePensionStars/{id}")
    public String showInfoStarRate(@PathVariable Integer id, Model model) {
        AreaHomePensionStars areaHomePensionStars = areaHomePensionStarsService.selectByPrimaryKey(id);
        model.addAttribute("star", areaHomePensionStars);
        return ADMIN_PREFIX + "serviceOrg_area_home_pension_stars_info";

    }



    /**
     * 内蒙古市社区养老服务站星级评定标准（评级）
     */
    @RequestMapping("org/areaHomePensionStars/add")
    public String add1(Model model) {
        ServiceOrg serviceOrg = null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            if (!org.springframework.util.StringUtils.isEmpty(Integer.parseInt(currentUser().getServiceOrgId()))) {
                serviceOrg=serviceOrgService.selectByPrimaryKey(Integer.parseInt(currentUser().getServiceOrgId()));
                model.addAttribute("organizationNames",serviceOrg.getInstitutionName());
            }
        }

        return ADMIN_PREFIX + "area_home_pension_stars_add";
    }


    /**
     * 社区养老服务站星级评定标准评估
     *
     * @return
     */
    @RequestMapping("assessAreaHomePensionStars/{id}")
    public String showAssessStarRate(@PathVariable Integer id, Model model) {
        AreaHomePensionStars areaHomePensionStars = areaHomePensionStarsService.selectByPrimaryKey(id);
        model.addAttribute("star", areaHomePensionStars);
        return ADMIN_PREFIX + "serviceOrg_area_home_pension_stars_assess";

    }







}
