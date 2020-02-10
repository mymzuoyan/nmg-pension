package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgRecord;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.service.ServiceOrgRecordService;
import com.fedtech.pension.org.service.ServiceOrgRecreationalActivitiesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Miaoyueming
 * @date 2019/8/9
 */

@Controller
@RequestMapping("/admin/api/serviceOrgRecord/")
public class ServiceOrgRecordController extends BaseController {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private ServiceOrgRecordService serviceOrgRecordService;

    @Reference(version = "1.0.0")
    private ServiceOrgRecreationalActivitiesService serviceOrgRecreationalActivitiesService;


    @RequestMapping("getHappyList")
    @ResponseBody
    public PageResponse<ServiceOrgRecreationalActivities> getHappyList(ServiceOrgRecreationalActivities filter, PageRequest pageRequest) throws Exception{
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            filter.setOrganizationName(currentUser().getServiceOrgName());
        }
        return serviceOrgRecreationalActivitiesService.selectPageList(filter,pageRequest);
    }

    /**
     * 删除文娱活动信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteHappy", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除文娱活动信息")
    public JsonResult deleteHappy(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgRecreationalActivitiesService.deleteByPrimaryKey(id)) {
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
     * 文娱活动详情
     *
     * @return
     */
    @RequestMapping("happyDetail")
    public String happyDetail(Model model, ServiceOrgRecreationalActivities filter) {
        filter=serviceOrgRecreationalActivitiesService.selectByPrimaryKey(filter.getId());
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "lrnlpg/happyDetail";
    }

    /**
     * 建档档案添加
     * @param serviceOrgRecord
     * @return
     */
    @RequestMapping("apply")
    @ResponseBody
    public JsonResult applyRecord(ServiceOrgRecord serviceOrgRecord) {
        JsonResult result = new JsonResult();
        serviceOrgRecord.setApplyTime(new Date());
        if(serviceOrgRecordService.selectByPrimaryKey(serviceOrgRecord.getServiceOrgId())!=null){
            serviceOrgRecord.setId(serviceOrgRecordService.selectIdByServiceOrgId(serviceOrgRecord.getServiceOrgId()));
            if(serviceOrgRecordService.updateByPrimaryKeySelective(serviceOrgRecord)){
                result.markSuccess("建档成功", null);
            }else {
                result.markError("建档失败");
            }
        }else {
            if (serviceOrgRecordService.insert(serviceOrgRecord)) {
                result.markSuccess("建档成功", null);
            } else {
                result.markError("建档失败");
            }
        }
        return result;
    }
}
