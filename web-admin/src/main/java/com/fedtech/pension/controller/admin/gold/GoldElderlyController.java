package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.gold.entity.GoldElderly;
import com.fedtech.pension.gold.service.GoldElderlyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author csn
 * @date 2018/1/4
 */
@Controller
@RequestMapping("admin/gold/forGold/")
public class GoldElderlyController extends BaseController {

    @Reference(version = "1.0.0")
    private GoldElderlyService goldElderlyService;

    public final String ADMIN_GOLD_PREFIX ="/admin/gold/";

    @RequestMapping("list")
    public String showGoldElderlylist(){

        return ADMIN_GOLD_PREFIX+"gold_elderly_list1";
    }

    @RequestMapping("goldElderCancel")
    public String goldElderlyCancel(){

        return ADMIN_GOLD_PREFIX+"gold_elderly_cancel";
    }

    /**增加*/
    @RequestMapping("add")
    public String goldElderlyAdd(Model model, GoldElderly goldElderly){
        model.addAttribute("goldElderly",goldElderly);
        return ADMIN_GOLD_PREFIX + "gold_elderly_add";
    }

    /**修改*/
    @RequestMapping("edit/{id}")
    public String goldElderlyUpdate(@PathVariable("id") Integer id, Model model){
        GoldElderly goldElderly =goldElderlyService.selectByPrimaryKey(id);
        model.addAttribute("goldElderly",goldElderly);
        return ADMIN_GOLD_PREFIX + "gold_elderly_edit1";
    }
}
