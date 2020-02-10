package com.fedtech.pension.controller.admin.monitor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgVideo;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.sys.service.AreaService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/admin/monitor/api/")
public class ServiceOrgMonitorApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(ServiceOrgMonitorApiController.class);

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;


    @Reference(version = "1.0.0")
    private ServiceOrgVideoService serviceOrgVideoService;

    @Reference(version = "1.0.0")
    private AreaService areaService;


    /**
     * 养老服务组织信息列表
     *
     *
     * @param serviceOrg
     * @param pageRequest
     * @return
     */
    @RequestMapping("serviceOrgList")
    @ResponseBody
    @SystemControllerLog(description = "查看养老服务组织信息列表")
    public PageResponse<ServiceOrg> getServiceOrgList(ServiceOrg serviceOrg, PageRequest pageRequest) {
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区域管理员
            String areaName = serviceOrg.getAreaName();
            if (StringUtils.isEmpty(areaName)) {
                areaName = currentUser().getAreaName();
            }
            serviceOrg.setAreaName(areaName);
        }
        PageResponse<ServiceOrg> dataTable = serviceOrgService.selectPageList(serviceOrg, pageRequest);
        return dataTable;
    }

    /**
     * 组织视频信息列表
     *

     */
    @RequestMapping("video/getChannelId")
    @ResponseBody
    @SystemControllerLog(description = "查看养老服务组织视频列表")
    public PageResponse<ServiceOrgVideo> getServiceOrgMonitorList(ServiceOrgVideo serviceOrgVideo, PageRequest pageRequest) {
        PageResponse<ServiceOrgVideo> dataTable = serviceOrgVideoService.selectPageList(serviceOrgVideo, pageRequest);
        return dataTable;
    }

    /**
     * 删除服务组织视频
     *
     * @param id
     * @return
     */
    @RequestMapping("video/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除服务组织视频")
    public JsonResult deleteServiceOrgVideo(Integer id) {
        JsonResult result = new JsonResult();
        ServiceOrgVideo serviceOrgVideo= serviceOrgVideoService.selectByPrimaryKey(id);
        if (serviceOrgVideoService.deleteByPrimaryKey(id)) {
            serviceOrgVideoService.deleteServiceOrgVideo(serviceOrgVideo);
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 更新服务组织视频
     *
     * @param serviceOrgVideo
     * @return
     */
    @RequestMapping("video/update")
    @ResponseBody
    @SystemControllerLog(description = "更新服务组织视频")
    public JsonResult doUpdateServiceOrg(ServiceOrgVideo serviceOrgVideo){
        JsonResult result = new JsonResult();
        if (serviceOrgVideoService.updateByPrimaryKeySelective(serviceOrgVideo)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 添加服务组织视频
     *
     * @param serviceOrgVideo
     * @return
     */
    @RequestMapping("video/extSave")
    @ResponseBody
    public JsonResult addServiceOrg(ServiceOrgVideo serviceOrgVideo){
        JsonResult result = new JsonResult();
        if (serviceOrgVideoService.insert(serviceOrgVideo)) {
            serviceOrgVideoService.addServiceOrgVideo(serviceOrgVideo);
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    @RequestMapping("video/getChannelList")
    @ResponseBody
    public Map<String,Object> getServiceOrgVideo(Integer orgId) {
        List<ServiceOrgVideo> list=serviceOrgVideoService.getAllVideoById(orgId);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("recordsFiltered",list.size());
        map.put("recordsTotal",list.size());
        map.put("draw",null);
        map.put("data",list);
        return map;
    }
}
