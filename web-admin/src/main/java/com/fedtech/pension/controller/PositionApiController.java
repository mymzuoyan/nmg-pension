package com.fedtech.pension.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * @author Administrator
 * @date 2016/9/28
 */
@Controller
@RequestMapping("/api/position")
public class PositionApiController {

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @RequestMapping(value = "getChildPosition", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getChildPosition(Integer pid) {
        JsonResult result = new JsonResult();

        List<Area> areas = areaService.selectByParentId(pid);
        if (ObjectUtils.isNotNull(areas)) {
            result.markSuccess("获取成功", areas);
        } else {
            result.markError("获取失败");
        }
        return result;
    }

    @RequestMapping(value = "getServiceOrg", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getServiceOrg(Integer areaId) {
        JsonResult result = new JsonResult();

        List<ServiceOrg> serviceOrgs = serviceOrgService.selectByAreaId(areaId);
        if (ObjectUtils.isNotNull(serviceOrgs)) {
            result.markSuccess("获取成功", serviceOrgs);
        } else {
            result.markError("获取失败");
        }
        return result;
    }
}
