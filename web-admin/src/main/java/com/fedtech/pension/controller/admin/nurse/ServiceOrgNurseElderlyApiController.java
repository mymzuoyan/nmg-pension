package com.fedtech.pension.controller.admin.nurse;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import com.fedtech.pension.nurse.service.ServiceOrgNurseElderlyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author gengqiang
 * @date 2017/8/22
 */
@Controller
@RequestMapping("/admin/api/nurse/elderly/")
public class ServiceOrgNurseElderlyApiController {

    @Reference(version = "1.0.0")
    private ServiceOrgNurseElderlyService serviceOrgNurseElderlyService;

    /**
     * 智能看护的组织里的老人list
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<ServiceOrgNurseElderly> showList(ServiceOrgNurseElderly filter, PageRequest pageRequest) {
        return serviceOrgNurseElderlyService.selectPageList(filter, pageRequest);
    }
}
