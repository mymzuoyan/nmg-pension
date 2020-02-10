package com.fedtech.pension.controller.admin.volunteer;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.volunteer.entity.VolStoreOrDraw;
import com.fedtech.pension.volunteer.entity.Volunteer;
import com.fedtech.pension.volunteer.service.VolStoreOrDrawService;
import com.fedtech.pension.volunteer.service.VolunteerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2016/9/30.
 */
@Controller
@RequestMapping("/admin/")
public class VolStoreOrDrawController extends BaseController {

    @Reference(version = "1.0.0")
    private VolStoreOrDrawService volStoreOrDrawService;

    @Reference(version = "1.0.0")
    private VolunteerService volunteerService;

    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


    public final String ADMIN_PREFIX = "/admin/volunteer/";


    /**
     * 志愿者存入或支取信息显示
     *
     * @return
     */
    @RequestMapping("volStoreOrDrawShow/{id}")
    public String showVolStoreOrDraw(String storeOrDraw, @PathVariable("id") Integer id, Model model) {
        model.addAttribute("storeOrDraw", storeOrDraw);
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "volStoreOrDraw_list";
    }

    @RequestMapping("volStoreOrDrawAdd/{id}")
    public String AddVolStoreOrDraw(String storeOrDraw, @PathVariable("id") Integer id, Model model) {
        Volunteer volunteer = volunteerService.selectByPrimaryKey(id);
        model.addAttribute("volunteer", volunteer);
        model.addAttribute("storeOrDraw", storeOrDraw);
        return ADMIN_PREFIX + "volStoreOrDraw_add";
    }

    @RequestMapping("volStoreOrDrawDetail/{id}")
    public String volStoreOrDrawDetail(@PathVariable("id") Integer id, Model model, String storeOrDraw) {
        VolStoreOrDraw volStoreOrDraw = volStoreOrDrawService.selectByPrimaryKey(id);
        Date serviceTime = volStoreOrDraw.getServiceTime();
        model.addAttribute("serviceTimeString", df.format(serviceTime));
        model.addAttribute("volStoreOrDraw", volStoreOrDraw);
        model.addAttribute("storeOrDraw", storeOrDraw);
        return ADMIN_PREFIX + "volStoreOrDraw_detail";
    }


}
