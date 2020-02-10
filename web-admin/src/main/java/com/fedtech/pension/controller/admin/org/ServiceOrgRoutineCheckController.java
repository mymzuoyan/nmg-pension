package com.fedtech.pension.controller.admin.org;


import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.controller.admin.sys.SystemController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.entity.ServiceOrgRoutineCheck;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.service.ServiceOrgRoutineCheckService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.entity.UserApprove;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
/**
 * 日常检查控制层
 */
@Controller
@RequestMapping("/admin/serviceOrgRoutineCheck/")
public class ServiceOrgRoutineCheckController extends BaseController{

    @Reference(version = "1.0.0")
    private ServiceOrgRoutineCheckService routineCheckService;
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    /**
     * 日常检查详情
     *
     * @return
     */
    @RequestMapping("view")
    public String routineCheckView(Model model) {
        return ADMIN_PREFIX + "serviceSource/serviceOrg_routine_check";
    }

    /**
     * 日常检查列表页数据
     * @param routineCheck
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("listData")
    @ResponseBody
    public PageResponse<ServiceOrgRoutineCheck> routineCheckListData(ServiceOrgRoutineCheck routineCheck, PageRequest pageRequest){

        ServiceOrg serviceOrg = new ServiceOrg();
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrg.setId(Integer.valueOf(currentUser().getServiceOrgId()));
        }
        routineCheck.setServiceOrg(serviceOrg);

        return routineCheckService.selectPageList(routineCheck,pageRequest);
    }

    /**
     * 添加日常检查信息
     * @return
     */
    @RequestMapping(value = "addRoutineCheck", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加日常检查信息")
    public JsonResult addRoutineCheck(ServiceOrgRoutineCheck serviceOrgRoutineCheck){
        JsonResult result = new JsonResult();
        ServiceOrg serviceOrg = new ServiceOrg();
        serviceOrg.setId(serviceOrgRoutineCheck.getServiceOrg().getId());
        serviceOrgRoutineCheck.setServiceOrg(serviceOrg);
        if (routineCheckService.insert(serviceOrgRoutineCheck)) {
            result.markSuccess("添加日常检查信息成功", null);
        } else {
            result.markError("添加日常检查信息失败");
        }
        return result;
    }

    /**
     * 日常检查信息详情查看
     *serviceOrg
     * @param id
     * @return
     */
    @RequestMapping("detail/{id}")
    public String routineCheckDetail(@PathVariable("id") Integer id, Model model) {
        ServiceOrgRoutineCheck routineCheck = routineCheckService.selectByPrimaryKey(id);
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(routineCheck.getServiceOrg().getId());
        model.addAttribute("s",serviceOrg);
        model.addAttribute("m",routineCheck);
        return ADMIN_PREFIX + "serviceSource/serviceOrg_routine_check_detail";
    }

    /**
     * 日常检查信息修改
     *
     * @param
     * @return
     * @throws
     */
    @RequestMapping("update")
    @ResponseBody
    public JsonResult routineCheckUpdate(ServiceOrgRoutineCheck serviceOrgRoutineCheck){
        JsonResult result = new JsonResult();
        ServiceOrg serviceOrg = new ServiceOrg();
        serviceOrg.setId(serviceOrgRoutineCheck.getServiceOrg().getId());
        serviceOrgRoutineCheck.setServiceOrg(serviceOrg);
        if (routineCheckService.updateByPrimaryKeySelective(serviceOrgRoutineCheck)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 删除日常检查信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除日常检查信息")
    public JsonResult deleteRoutineCheck(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (routineCheckService.deleteByPrimaryKey(id)) {
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
     * 批量删除
     *
     * @return
     */
    @RequestMapping(value="deleteSomeMsg",method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "批量删除")
    public JsonResult deleteSomeMsg(String deleteIds) {

        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (routineCheckService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }
}
