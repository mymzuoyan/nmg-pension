package com.fedtech.pension.controller.admin.org;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2019/6/27
 */
@Controller
@RequestMapping("/admin/serviceOrg/socialWork/")
public class ServiceOrgSocialWorkController extends BaseController {

    public final String ADMIN_PREFIX = "/admin/serviceSource/";


    /**
     * 列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showList() {
        return ADMIN_PREFIX + "service_org_socialwork_list";
    }

}
