package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgConstructionSubsidyApply;
import com.fedtech.pension.org.entity.ServiceOrgSubsidyApply;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.service.ServiceOrgConstructionSubApplyService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.org.service.ServiceOrgSubsidyApplyService;
import com.fedtech.pension.org.service.StarRatingOfInstitutionsService;
import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author gengqiang
 * @date 2018/1/19
 */
@Controller
@RequestMapping("/admin/serviceOrg/subsidy/")
public class ServiceOrgSubsidyApplyController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    public final String ADMIN_PREFIX1 = "/admin/elderly/";


    @Reference(version = "1.0.0")
    private ServiceOrgSubsidyApplyService serviceOrgSubsidyApplyService;

    @Reference(version = "1.0.0")
    private StarRatingOfInstitutionsService starRatingOfInstitutionsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService ServiceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgConstructionSubApplyService serviceOrgConstructionSubApplyService;



    /**
     * 补贴申请
     *
     * @param type
     * @param object
     * @param model
     * @return
     */
    @RequestMapping("/apply")
    public String showApply(@RequestParam("type") Integer type, @RequestParam("object") Integer object, Model model) {

        model.addAttribute("type", type);
        model.addAttribute("object", object);
      /*  if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {*/
            ServiceOrg serviceOrg=new ServiceOrg();
            serviceOrg.setInstitutionName(currentUser().getServiceOrgName());
            List<ServiceOrg> serviceOrgList = ServiceOrgService.selectByInstitutionName(serviceOrg);
            for (ServiceOrg org : serviceOrgList) {
                String institutionTypeDictId = org.getInstitutionTypeDictId();
                model.addAttribute("institutionTypeDictId", institutionTypeDictId);
            }
      /*  }*/


        return ADMIN_PREFIX + "serviceOrg_subsidy_apply";
    }

    /**
     * 机构建设补助申请
     *
     * @param type
     * @param object
     * @param model
     * @return
     */
    @RequestMapping("/applyList")
    public String showApplyList(@RequestParam("type") Integer type, @RequestParam("object") Integer object, Model model) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())||getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        if (ObjectUtils.isNotNull(type)) {
            model.addAttribute("type", type);
        }
        if (ObjectUtils.isNotNull(object)) {
            model.addAttribute("object", object);
        }
        String areaNum=null;
        String cityNum=null;
        if(getCurrentUser().hasRole(RoleType.ReAdmin.getValue())){
            areaNum="1";
            model.addAttribute("areaNum", areaNum);
        }
        if(getCurrentUser().hasRole(RoleType.MuAdmin.getValue())){
            cityNum="2";
            model.addAttribute("cityNum", cityNum);
        }

        return ADMIN_PREFIX + "serviceOrg_subsidy_applyList";
    }


    /**
     * 补贴列表
     *
     * @return
     */
    @RequestMapping("/list")
    public String showList(Model model, @RequestParam(value = "type", required = false) Integer type, @RequestParam(value = "object", required = false) Integer object) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())||getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        if (ObjectUtils.isNotNull(type)) {
            model.addAttribute("type", type);
        }
        if (ObjectUtils.isNotNull(object)) {
            model.addAttribute("object", object);
        }
        return ADMIN_PREFIX + "serviceOrg_subsidy_apply_list";

    }

    /**
     * 服务质量星级评定列表
     *
     * @return
     */
    @RequestMapping("/starList")
    public String showStarList(Model model, @RequestParam(value = "type", required = false) Integer type, @RequestParam(value = "object", required = false) Integer object) {

        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
            model.addAttribute("type", 1);
        } else if (getCurrentUser().hasRole(RoleType.AssessUser.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
            model.addAttribute("type", 2);
        }
         return ADMIN_PREFIX + "serviceOrg_subsidy_star_list";

    }

    /**
     * 补贴申请详细
     *
     * @return
     */
    @RequestMapping("/info/{id}")
    public String showList(@PathVariable Integer id, Model model) {
        ServiceOrgSubsidyApply apply = serviceOrgSubsidyApplyService.selectByPrimaryKey(id);
        model.addAttribute("apply", apply);
        return ADMIN_PREFIX + "serviceOrg_subsidy_apply_info";

    }

    /**
     * 建设补贴申请详细
     *
     * @return
     */
    @RequestMapping("/mechanismInfo/{id}")
    public String showmechanismInfo(@PathVariable Integer id, Model model) {
        ServiceOrgConstructionSubsidyApply apply = serviceOrgConstructionSubApplyService.selectByPrimaryKey(id);
        model.addAttribute("apply", apply);
        return ADMIN_PREFIX + "serviceOrg_subsidy_apply_mechanismInfo";

    }


    /**
     * 老人补贴详情
     *
     * @return
     */
    @RequestMapping("/operatingSubsidiesInfo/{id}")
    public String operatingSubsidiesInfo(@PathVariable Integer id, Model model) {
       /* ServiceOrgConstructionSubsidyApply apply = serviceOrgConstructionSubApplyService.selectByPrimaryKey(id);
        model.addAttribute("apply", apply);*/
       model.addAttribute("operatingSubsidiesElderlyId",id);
        return ADMIN_PREFIX1 + "elderly_operating_subsidies_list";

    }

    /**
     * 机构星级评定详情
     *
     * @return
     */
    @RequestMapping("/infoStarRate1/{id}")
    public String showInfoStarRate1(@PathVariable Integer id, Model model) {
        StarRatingOfInstitutions starRatingOfInstitutions = starRatingOfInstitutionsService.selectById(id);
        starRatingOfInstitutions = starRatingOfInstitutionsService.selectByTypeAndSod(starRatingOfInstitutions.getServiceOrgId());
        model.addAttribute("star", starRatingOfInstitutions);
        return ADMIN_PREFIX + "serviceOrg_subsidy_star_info";

    }

    /**
     * 机构星级评定详情(管理员查看)
     *
     * @return
     */
    @RequestMapping("/infoStarRate/{id}")
    public String showInfoStarRate(@PathVariable Integer id, Model model) {
        StarRatingOfInstitutions starRatingOfInstitutions = starRatingOfInstitutionsService.selectById(id);
        starRatingOfInstitutions.setType(null);
        model.addAttribute("star", starRatingOfInstitutions);
        return ADMIN_PREFIX + "serviceOrg_subsidy_star_info";

    }

    /**
     * 机构星级评定详情(评估的不含修改)
     *
     * @return
     */
    @RequestMapping("/infoStarRate2/{id}")
    public String showInfoStarRate2(@PathVariable Integer id, Model model) {
        StarRatingOfInstitutions starRatingOfInstitutions = starRatingOfInstitutionsService.selectById(id);
        if(starRatingOfInstitutions.getType() == 2) {
            starRatingOfInstitutions = starRatingOfInstitutionsService.selectByTypeAndSod(starRatingOfInstitutions.getServiceOrgId());
        }
        model.addAttribute("star", starRatingOfInstitutions);
        return ADMIN_PREFIX + "serviceOrg_subsidy_star_assess_info";

    }

    /**
     * 机构星级评估详情
     *
     * @return
     */
    @RequestMapping("/infoStarRateAssess/{id}/{userId}")
    public String showInfoStarRateAssess(@PathVariable Integer id,@PathVariable Integer userId, Model model) {
        StarRatingOfInstitutions starRatingOfInstitutions = starRatingOfInstitutionsService.selectById(id);
        starRatingOfInstitutions.setUserId(userId);
        model.addAttribute("star", starRatingOfInstitutions);
        return ADMIN_PREFIX + "serviceOrg_subsidy_star_assess_update_info";

    }


    /**
     * 统计分析
     *
     * @param type
     * @param object
     * @param model
     * @return
     */
    @RequestMapping("/statistic")
    public String showStatistic(@RequestParam("type") Integer type,@RequestParam(value = "areaId",required = false) Integer areaId, @RequestParam("object") Integer object, Model model) {

        model.addAttribute("type", type);
        model.addAttribute("object", object);
        if(StringUtils.isEmpty(areaId)){
            areaId = currentUser().getAreaId();
        }
        model.addAttribute("areaId", areaId);

        return ADMIN_PREFIX + "serviceOrg_subsidy_statistic";
    }


}
