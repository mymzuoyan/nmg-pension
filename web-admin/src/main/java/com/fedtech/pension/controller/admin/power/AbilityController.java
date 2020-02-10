package com.fedtech.pension.controller.admin.power;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.power.entity.Ability;
import com.fedtech.pension.power.service.AbilityService;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/power/ability/")
@EnableScheduling
public class AbilityController extends BaseController {
    @Reference(version = "1.0.0")
    private AbilityService abilityService;

    public final String ADMIN_PREFIX = "/admin/lrnlpg/";

    @RequestMapping(value = "create", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "老人能力评估完成度分值设置")
    public JsonResult insertOrUpdate(Ability ability) throws Exception{
        JsonResult result = new JsonResult();
        boolean flag = false;
        if(ability.getId()!=null){
            flag = abilityService.update(ability);
            if(flag){
                result.markSuccess("老人能力评估完成度分值设置更新成功", null);
            }else{
                result.markError("老人能力评估完成度分值设置更新失败");
            }
        }else {
            flag = abilityService.update(ability);
            if(flag){
                result.markSuccess("老人能力评估完成度分值设置成功", null);
            }else{
                result.markError("老人能力评估完成度分值设置失败");
            }
        }
        return result;
    }


    /**
     * 老人能力评估完成度分值设置信息查看或修改
     *
     * @return
     */
    @RequestMapping("insertOrUpdate")
    public String abilityDetail( Model model) {
        Ability ability= abilityService.selectAbility();
        model.addAttribute("m",ability);
        return ADMIN_PREFIX + "nlpgfzpz";
    }

}

