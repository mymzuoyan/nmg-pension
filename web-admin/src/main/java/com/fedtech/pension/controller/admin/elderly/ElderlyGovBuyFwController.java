package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyGovBuyFw;
import com.fedtech.pension.elderly.service.ElderlyGovBuyFwService;
import com.fedtech.pension.power.entity.Blood;
import com.fedtech.pension.power.entity.Enroll;
import com.fedtech.pension.power.service.BloodService;
import com.fedtech.pension.power.service.EnrollService;
import com.fedtech.pension.sys.service.AreaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;

/**
 * @author gengqiang
 * @date 2017/7/24
 */
@Controller
@RequestMapping("/admin/elderly/govbuyfw/")
public class ElderlyGovBuyFwController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyGovBuyFwService elderlyGovBuyFwService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private EnrollService enrollService;

    @Reference(version = "1.0.0")
    private BloodService bloodService;

    public final String ADMIN_PREFIX = "/admin/elderly/";


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


    /**
     * 显示政府购买信息
     *
     * @return
     */
    @RequestMapping("list")
    public String showGovBuyFwInfo() {
        return ADMIN_PREFIX + "elderly_govbuyfw_list";
    }
    /**
     * 显示政府购买信息
     *
     * @return
     */
    @RequestMapping("listsp")
    public String showGovBuyFwInfosp() {
        return ADMIN_PREFIX + "elderly_govbuyfwsh_list";
    }
    /**
     * 添加政府购买老人
     *
     * @return
     */
    @RequestMapping("add")
    public String showAddGovBuyInfo(Model model) {
        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        return ADMIN_PREFIX + "elderly_govbuyfw_add";
    }

    /**
     * 显示政府购买信息
     *
     * @return
     */
    @RequestMapping("detail/{id}")
    public String showGovBuyFwInfo_Detail(@PathVariable("id") Integer id, Model model) {
        ElderlyGovBuyFw elderlyGovBuyFw = elderlyGovBuyFwService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(elderlyGovBuyFw)) {
            model.addAttribute("elderlyGovBuyFw", elderlyGovBuyFw);
        }
        return ADMIN_PREFIX + "elderly_govbuyfw_detail";
    }

    /**
     * 显示健康数据详细信息
     *
     * @return
     */
    @RequestMapping("healthDetail/{id}")
    public String showhealthDetail(@PathVariable("id") Integer id, Model model) {
        Enroll enroll = enrollService.selectByPrimaryKey(id);
        Blood blood = bloodService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(enroll)) {
            model.addAttribute("enroll", enroll);
            model.addAttribute("blood", blood);
        }
        return ADMIN_PREFIX + "elderly_health_Detail";
    }

    /**
     * 显示政府购买信息
     *
     * @return
     */
    @RequestMapping("detailsh/{id}")
    public String showGovBuyFwInfosh_Detail(@PathVariable("id") Integer id, Model model) {
        ElderlyGovBuyFw elderlyGovBuyFw = elderlyGovBuyFwService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(elderlyGovBuyFw)) {
            model.addAttribute("elderlyGovBuyFw", elderlyGovBuyFw);
        }
        return ADMIN_PREFIX + "elderly_govbuyfwsh_detail";
    }

    /**
     * 展示政府购买服务待办申请列表
     *
     * @return
     */
    @RequestMapping("handle/list")
    public String showGovBuyNeedHandleList() {
        return ADMIN_PREFIX + "elderly_govbuy_handle_list";
    }








}
