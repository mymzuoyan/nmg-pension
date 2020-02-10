package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgCardData;
import com.fedtech.pension.org.entity.ServiceOrgWareHouse;
import com.fedtech.pension.org.service.ServiceOrgWareHouseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author gengqiang
 * @date 2019/6/27
 */
@Controller
@RequestMapping("/admin/api/serviceOrg/wareHouse/")
public class ServiceOrgWareHouseApiController extends BaseController {

    @Reference(version = "1.0.0", timeout = 60000, retries = 0)
    private ServiceOrgWareHouseService serviceOrgWareHouseService;


    @RequestMapping("list")
    @ResponseBody
    public PageResponse<ServiceOrgWareHouse> list(ServiceOrgWareHouse filter, PageRequest pageRequest) {

        return serviceOrgWareHouseService.selectPageList(filter, pageRequest);
    }


    @RequestMapping("save")
    @ResponseBody
    @SystemControllerLog(description = "出入库")
    public JsonResult updatePrice(ServiceOrgWareHouse serviceOrgWareHouse) {
        JsonResult result = new JsonResult();
        //更新
        serviceOrgWareHouse.setCreateTime(new Date());
        serviceOrgWareHouse.setCreator(currentUser());
        if (serviceOrgWareHouseService.insert(serviceOrgWareHouse)) {
            result.markSuccess("出入库成功", null);
        } else {
            result.markSuccess("出入库失败", null);
        }
        return result;
    }


}
