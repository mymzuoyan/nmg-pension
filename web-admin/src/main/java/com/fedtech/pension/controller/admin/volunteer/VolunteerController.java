package com.fedtech.pension.controller.admin.volunteer;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.volunteer.entity.Volunteer;
import com.fedtech.pension.volunteer.service.VolunteerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;

/**
 * @author Administrator
 * @date 2016/9/28
 */
@Controller
@RequestMapping("/admin/volunteer/")
public class VolunteerController extends BaseController {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private VolunteerService volunteerService;

    public final String ADMIN_PREFIX = "/admin/volunteer/";


    /**
     * 公益志愿者组织信息显示
     *
     * @return
     */
    @RequestMapping("list")
    public String showVolunteer() {
        return ADMIN_PREFIX + "volunteer_list";
    }

    @RequestMapping("add")
    public String addVolunteer(String method, Model model) {
        model.addAttribute("method", method);
        return ADMIN_PREFIX + "volunteer_add";
    }

    @RequestMapping("detail/{id}")
    public String volunteerDetail(@PathVariable("id") Integer id, String method, Model model) {
        Volunteer volunteer = volunteerService.selectByPrimaryKey(id);
        model.addAttribute("volunteer", volunteer);
        return ADMIN_PREFIX + "volunteer_detail";
    }

}
