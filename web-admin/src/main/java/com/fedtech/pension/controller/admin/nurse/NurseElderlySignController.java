package com.fedtech.pension.controller.admin.nurse;

import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gengqiang
 * @date 2017/8/24
 */
@Controller
@RequestMapping("/admin/nurse/elderly/sign/")
public class NurseElderlySignController extends BaseController {

    /**
     * 体征信息管理
     *
     * @return
     */
    @RequestMapping("list")
    public String showList() {
        return ADMIN_NURSE_PREFIX + "nurse_elderly_sign_list";
    }
}
