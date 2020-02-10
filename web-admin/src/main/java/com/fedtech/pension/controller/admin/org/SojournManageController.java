package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DateUtil;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgElderlyNeeds;
import com.fedtech.pension.org.entity.ServiceOrgElderlyNeedsDistribution;
import com.fedtech.pension.org.entity.ServiceOrgSocialWork;
import com.fedtech.pension.org.entity.SojournManage;
import com.fedtech.pension.org.service.ServiceOrgElderlyNeedsDistributionService;
import com.fedtech.pension.org.service.ServiceOrgElderlyNeedsService;
import com.fedtech.pension.org.service.ServiceOrgSocialWorkService;
import com.fedtech.pension.org.service.SojournManageService;
import com.fedtech.pension.power.entity.*;
import com.fedtech.pension.power.service.BillService;
import com.fedtech.pension.power.service.MoneyflowService;
import com.fedtech.pension.power.service.OldManCardService;
import com.fedtech.pension.power.service.OrderService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/admin/api/org/sojournManage/")
@EnableScheduling
public class SojournManageController extends BaseController {


    @Reference(version = "1.0.0")
    private SojournManageService sojournManageService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyNeedsService serviceOrgElderlyNeedsService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyNeedsDistributionService serviceOrgElderlyNeedsDistributionService;


    public final String ADMIN_PREFIX = "/admin/lrnlpg/";



    /**
     * 旅居养老机构管理列表
     * @return
     */
    @RequestMapping("sojournManageList")
    public  String  sojournManageList(){
        return ADMIN_PREFIX + "sojournManageList";
    }


    /**
     * 旅居老人需求管理列表
     * @return
     */
    @RequestMapping("elderlyNeedsList")
    public  String  elderlyNeedsList(){
        return ADMIN_PREFIX + "elderlyNeedsList";
    }

    /**
     * 旅居老人需求发放列表
     * @return
     */
    @RequestMapping("elderlyNeedsDistribution")
    public  String  elderlyNeedsDistribution(Model model){
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "elderlyNeedsDistribution";
    }


    /**
     * 旅居养老机构管理信息新增
     *
     * @return
     */
    @RequestMapping("sojournManageListAdd")
    public String sojournManageListAdd() {
        return ADMIN_PREFIX + "sojournManageListAdd";
    }

    /**
     * 旅居老人需求发放新增
     *
     * @return
     */
    @RequestMapping("elderlyNeedsDistributionAdd")
    public String elderlyNeedsDistributionAdd(Model model) {
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "elderlyNeedsDistributionAdd";
    }


    /**
     * 添加旅居养老机构管理信息
     * @return
     */
    @RequestMapping(value = "addSojournManage", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加旅居养老机构管理信息")
   public JsonResult addSojournManage(SojournManage sojournManage) {
        JsonResult result = new JsonResult();
        if (sojournManageService.insert(sojournManage)) {
            result.markSuccess("添加旅居养老机构管理信息成功", null);
        } else {
            result.markError("添加旅居养老机构管理信息失败");
        }
        return result;
    }

    /**
     * 添加旅居老人需求发放
     * @return
     */
    @RequestMapping(value = "addElderlyNeedsDistribution", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加旅居老人需求发放")
    public JsonResult addElderlyNeedsDistribution(ServiceOrgElderlyNeedsDistribution serviceOrgElderlyNeedsDistribution) {
        JsonResult result = new JsonResult();
        serviceOrgElderlyNeedsDistribution.setStatus("0");
        if (serviceOrgElderlyNeedsDistributionService.insert(serviceOrgElderlyNeedsDistribution)) {
            result.markSuccess("添加旅居老人需求发放成功", null);
        } else {
            result.markError("添加旅居老人需求发放失败");
        }
        return result;
    }

    /**
     * 修改旅居老人需求发放
     * @return
     */
    @RequestMapping(value = "ElderlyNeedsDistributionUpdate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加旅居老人需求发放")
    public JsonResult ElderlyNeedsDistributionUpdate(ServiceOrgElderlyNeedsDistribution serviceOrgElderlyNeedsDistribution) {
        JsonResult result = new JsonResult();
        if (serviceOrgElderlyNeedsDistributionService.updateByPrimaryKeySelective(serviceOrgElderlyNeedsDistribution)) {
            result.markSuccess("修改旅居老人需求发放成功", null);
        } else {
            result.markError("修改旅居老人需求发放失败");
        }
        return result;
    }

    /**
     * 审核旅居老人需求发放
     * @return
     */
    @RequestMapping(value = "examine", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "审核旅居老人需求发放")
    public JsonResult examine(ServiceOrgElderlyNeedsDistribution serviceOrgElderlyNeedsDistribution) {
        JsonResult result = new JsonResult();
        if (serviceOrgElderlyNeedsDistributionService.updateByPrimaryKeySelective(serviceOrgElderlyNeedsDistribution)) {
            result.markSuccess("修改旅居老人需求发放成功", null);
        } else {
            result.markError("修改旅居老人需求发放失败");
        }
        return result;
    }

    /**
     * 旅居养老机构管理信息列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getSojournManageList")
    @ResponseBody
    public PageResponse<SojournManage> getSojournManageList(SojournManage filter, PageRequest pageRequest) throws Exception{
        return sojournManageService.selectPageList(filter,pageRequest);
    }

    /**
     * 旅居老人需求管理列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getElderlyNeedsList")
    @ResponseBody
    public PageResponse<ServiceOrgElderlyNeeds> getElderlyNeedsList(ServiceOrgElderlyNeeds filter, PageRequest pageRequest) throws Exception{
        return serviceOrgElderlyNeedsService.selectPageList(filter,pageRequest);
    }

    /**
     * 旅居老人需求发放
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getElderlyNeedsDistributionList")
    @ResponseBody
    public PageResponse<ServiceOrgElderlyNeedsDistribution> getElderlyNeedsDistributionList(ServiceOrgElderlyNeedsDistribution filter, PageRequest pageRequest) throws Exception{
        return serviceOrgElderlyNeedsDistributionService.selectPageList(filter,pageRequest);
    }


    /**
     * 旅居养老机构详情
     *
     * @return
     */
    @RequestMapping("sojournManageDetail")
    public String happyDetail(Model model,SojournManage filter) {
        filter=sojournManageService.selectByPrimaryKey(filter.getId());
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "sojournManageDetail";
    }

    /**
     * 旅居老人需求详情
     *
     * @return
     */
    @RequestMapping("elderlyNeedsDetail")
    public String elderlyNeedsDetail(Model model,ServiceOrgElderlyNeeds filter) {
        filter=serviceOrgElderlyNeedsService.selectByPrimaryKey(filter.getId());
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "elderlyNeedsDetail";
    }

    /**
     * 旅居老人需求发放详情
     *
     * @return
     */
    @RequestMapping("elderlyNeedsDistributionDetail")
    public String elderlyNeedsDistributionDetail(Model model,ServiceOrgElderlyNeedsDistribution filter) {
        filter=serviceOrgElderlyNeedsDistributionService.selectByPrimaryKey(filter.getId());
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "elderlyNeedsDistributionDetail";
    }


    /**
     * 删除旅居养老机构管理信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteSojournManage", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除旅居养老机构管理信息")
    public JsonResult deleteCommunityService(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (sojournManageService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 删除旅居老人需求管理信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteElderlyNeeds", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除旅居老人需求管理信息")
    public JsonResult deleteElderlyNeeds(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgElderlyNeedsService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 删除旅居老人需求发放信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteElderlyNeedsDistribution", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除旅居老人需求发放信息")
    public JsonResult deleteElderlyNeedsDistribution(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgElderlyNeedsDistributionService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除旅居老人需求管理信息
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeNeeds")
    @ResponseBody
    public JsonResult deleteSomeNeeds(String deleteIds) {
        JsonResult result = new JsonResult();
        String[] ids = deleteIds.split(",");
        List<Integer> idList = new ArrayList<Integer>();
        for (String s : ids) {
            if (!org.apache.commons.lang.StringUtils.isEmpty(s)) {
                idList.add(Integer.parseInt(s));
            }
        }
        if (serviceOrgElderlyNeedsService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除旅居老人需求发放信息
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeNeedsDistribution")
    @ResponseBody
    public JsonResult deleteSomeNeedsDistribution(String deleteIds) {
        JsonResult result = new JsonResult();
        String[] ids = deleteIds.split(",");
        List<Integer> idList = new ArrayList<Integer>();
        for (String s : ids) {
            if (!org.apache.commons.lang.StringUtils.isEmpty(s)) {
                idList.add(Integer.parseInt(s));
            }
        }
        if (serviceOrgElderlyNeedsDistributionService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSome")
    @ResponseBody
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        String[] ids = deleteIds.split(",");
        List<Integer> idList = new ArrayList<Integer>();
        for (String s : ids) {
            if (!org.apache.commons.lang.StringUtils.isEmpty(s)) {
                idList.add(Integer.parseInt(s));
            }
        }
        if (sojournManageService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

}
