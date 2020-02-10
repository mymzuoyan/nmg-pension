package com.fedtech.pension.controller.admin.nurse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.nurse.entity.ServiceOrgNurse;
import com.fedtech.pension.nurse.service.ServiceOrgNurseService;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gengqiang
 * @date 2017/8/21
 */
@Controller
@RequestMapping("/admin/api/nurse/serviceOrg/")
public class ServiceOrgNurseApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceOrgNurseService serviceOrgNurseService;

    /**
     * 智能看护的组织list
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<ServiceOrgNurse> showList(ServiceOrgNurse filter, PageRequest pageRequest) {
        return serviceOrgNurseService.selectPageList(filter, pageRequest);
    }

    /**
     * 智能看护的组织地理位置list
     *
     * @param filter
     * @return
     */
    @RequestMapping("location/list")
    @ResponseBody
    public List<ServiceOrgLocation> showLocationList(ServiceOrgNurse filter) {
        List<ServiceOrgNurse> serviceOrgNurses = serviceOrgNurseService.getAllRecode(filter);
        List<ServiceOrgLocation> results = new ArrayList<>();
//        for (ServiceOrgNurse s : serviceOrgNurses) {
//            ServiceOrgLocation l = (ServiceOrgLocation) redisServiceOrgLocationUtil.getServiceOrgLocation(s.getServiceOrgId());
//            results.add(l);
//        }
        return results;
    }


}
