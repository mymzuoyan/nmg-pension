package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.gold.entity.GoldSendStandard;
import com.fedtech.pension.gold.service.GoldSendStandardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author csn
 * @date 2018/1/12
 */
@Controller
@RequestMapping("admin/gold/sendStandard/")
public class GoldSendStandardController extends BaseController{

    @Reference(version = "1.0.0")
    private GoldSendStandardService goldSendStandardService;

    private final String ADMIN_GOLD_PREFIX="/admin/gold/";

    @RequestMapping("list")
    public String showGoldSendStandardlist(){

        return ADMIN_GOLD_PREFIX+"gold_send_standard_list";
    }

    //增加
    @RequestMapping("add")
    public String goldSendStandardAdd(Model model, GoldSendStandard goldSendStandard){
        model.addAttribute("gss",goldSendStandard);
        return ADMIN_GOLD_PREFIX + "gold_send_standard_add";
    }

    //修改
    @RequestMapping("edit/{id}")
    public String goldSendStandardUpdate(@PathVariable("id") Integer id, Model model){
        GoldSendStandard goldSendStandard =goldSendStandardService.selectByPrimaryKey(id);
        model.addAttribute("gss",goldSendStandard);
        return ADMIN_GOLD_PREFIX + "gold_send_standard_edit";
    }

    @RequestMapping("info/{id}")
    public String goldSendStandardInfo(@PathVariable("id") Integer id, Model model) {
        GoldSendStandard goldSendStandard = goldSendStandardService.selectByPrimaryKey(id);
        model.addAttribute("gss",goldSendStandard);
        return ADMIN_GOLD_PREFIX + "gold_send_standard_info";
    }
}
