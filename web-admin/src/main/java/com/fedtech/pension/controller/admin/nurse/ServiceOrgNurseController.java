package com.fedtech.pension.controller.admin.nurse;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2017/8/21
 */
@Controller
@RequestMapping("/admin/nurse/serviceOrg/")
public class ServiceOrgNurseController extends BaseController {

    /**
     * 显示接入智能看护的组织
     *
     * @param type
     * @return
     */
    @RequestMapping("list/{type}")
    public String showList(@PathVariable Integer type, Model model) {
        model.addAttribute("type", type);
        return ADMIN_NURSE_PREFIX + "serviceOrg_nurse_list";
    }

}
