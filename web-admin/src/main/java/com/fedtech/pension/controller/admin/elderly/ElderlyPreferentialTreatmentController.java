package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyPreferentialTreatment;
import com.fedtech.pension.elderly.service.ElderlyPreferentialTreatmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author gengqiang
 * @date 2017/10/20
 */
@Controller
@RequestMapping("/admin/elderly/preferentialTreatment/")
public class ElderlyPreferentialTreatmentController extends BaseController {
    @Reference(version = "1.0.0")
    private ElderlyPreferentialTreatmentService elderlyPreferentialTreatmentService;

    public final String ADMIN_PREFIX = "/admin/elderly/";


    /**
     * 增加
     *
     * @return
     */
    @RequestMapping("add")
    public String showAdd() {
        return ADMIN_PREFIX + "elderly_preferential_treatment_add";
    }


    /**
     * 列表
     *
     * @return
     */
    @RequestMapping("list")
    public String showList(Model model, @RequestParam(value = "areaId", required = false, defaultValue = "0") Integer areaId) {
        if (0 != areaId) {
            model.addAttribute("areaId", areaId);
        }
        return ADMIN_PREFIX + "elderly_preferential_treatment_list";
    }


    /**
     * 详情
     *
     * @return
     */
    @RequestMapping("info/{id}")
    public String showList(@PathVariable("id") Integer id, Model model) {
        ElderlyPreferentialTreatment treatment = elderlyPreferentialTreatmentService.selectByPrimaryKey(id);
        if (ObjectUtils.isNotNull(treatment)) {
            model.addAttribute("treatment", treatment);
        }
        return ADMIN_PREFIX + "elderly_preferential_treatment_info";
    }
}
