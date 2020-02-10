package com.fedtech.pension.controller.admin.elderly;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/health/")
@Controller
public class ElderHealthController {

    public final String ADMIN_PREFIX = "/admin/elderly/";

    @RequestMapping("healthList")
    public String showGovBuyInfo() {
        return ADMIN_PREFIX + "elderly_health_list";
    }

    @RequestMapping("healthSelect")
    public String showSelectInfo() {
        return ADMIN_PREFIX + "elderly_health_Select";
    }
}
