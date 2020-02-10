package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgEmergencyManagement;
import com.fedtech.pension.org.service.ServiceOrgEmergencyManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fww
 */
@Controller
@RequestMapping("/admin/api/org/emergencyManagement/")
public class ServiceOrgEmergencyManagementController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/lrnlpg/";

    @Reference(version = "1.0.0")
    private ServiceOrgEmergencyManagementService serviceOrgEmergencyManagementService;

    /**
     * 突发事件信息管理列表
     * @return
     */
    @RequestMapping("emergencyList")
    public  String  showEmergencyList(){
        return ADMIN_PREFIX + "emergencyList";
    }

    @RequestMapping("getEmergencyList")
    @ResponseBody
    public PageResponse<ServiceOrgEmergencyManagement> getEmergencyList(ServiceOrgEmergencyManagement filter, PageRequest pageRequest) throws Exception{
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            filter.setServiceOrgName(currentUser().getServiceOrgName());
        }
        return serviceOrgEmergencyManagementService.selectPageList(filter,pageRequest);
    }

    /**
     * 突发事件信息新增
     *
     * @return
     */
    @RequestMapping("emergencyAdd")
    public String emergencyAdd() {
        return ADMIN_PREFIX + "emergencyAdd";
    }


    /**
     * 突发事件详情
     *
     * @return
     */
    @RequestMapping("emergencyDetail")
    public String emergencyDetail(Model model, ServiceOrgEmergencyManagement filter) {
        filter=serviceOrgEmergencyManagementService.selectByPrimaryKey(filter.getId());
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "emergencyDetail";
    }


    /**
     * 添加突发事件
     * @return
     */
    @RequestMapping(value = "addEmergency", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加突发事件")
    public JsonResult addEmergency(ServiceOrgEmergencyManagement serviceOrgEmergencyManagement) {
        JsonResult result = new JsonResult();
        if (serviceOrgEmergencyManagementService.insert(serviceOrgEmergencyManagement)) {
            result.markSuccess("添加突发事件成功", null);
        } else {
            result.markError("添加突发事件失败");
        }
        return result;
    }

    /**
     * 删除突发事件信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteEmergency", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除突发事件信息")
    public JsonResult deleteEmergency(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgEmergencyManagementService.deleteByPrimaryKey(id)) {
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
     * 突发事件信息批量删除
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
        if (serviceOrgEmergencyManagementService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }
}
