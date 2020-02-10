package com.fedtech.pension.controller.admin.nurse;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2017/8/22
 */
@Controller
@RequestMapping("/admin/nurse/elderly/")
public class ServiceOrgNurseElderlyController extends BaseController {

    /**
     * 显示智能看护的组织里的老人
     *
     * @return
     */
    @RequestMapping("list")
    public String showList() {
        return ADMIN_NURSE_PREFIX + "serviceOrg_nurse_elderly_list";
    }

}
