package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgSocialWork;
import com.fedtech.pension.org.service.ServiceOrgSocialWorkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author gengqiang
 * @date 2019/6/27
 */
@Controller
@RequestMapping("/admin/api/serviceOrg/socialWork/")
public class ServiceOrgSocialWorkApiController extends BaseController {

    @Reference(version = "1.0.0", timeout = 60000, retries = 0)
    private ServiceOrgSocialWorkService serviceOrgSocialWorkService;


    @RequestMapping("list")
    @ResponseBody
    public PageResponse<ServiceOrgSocialWork> list(ServiceOrgSocialWork filter, PageRequest pageRequest) {

        return serviceOrgSocialWorkService.selectPageList(filter, pageRequest);
    }


/*
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
*/


}
