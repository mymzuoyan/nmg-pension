package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Module;
import com.fedtech.pension.portal.entity.ModuleMes;
import com.fedtech.pension.portal.service.ModuleMesService;
import com.fedtech.pension.portal.service.ModuleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/12
 */
@Controller
@RequestMapping("/admin/moduleMes")
public class ModuleMesController extends BaseController {

    @Reference(version = "1.0.0",cache = "lru")
    private ModuleService moduleService;
    @Reference(version = "1.0.0",cache = "lru")
    private ModuleMesService moduleMesService;

    public final String ADMIN_PREFIX = "/admin/portal/";


    /**
     * 模块信息列表
     *
     * @return
     */
    @RequestMapping("/list")
    public String showModuleMes(Model model) {
        List<Module> modules = moduleService.getAllRecode(null);
        model.addAttribute("modules", modules);
        return ADMIN_PREFIX + "moduleMes_list";
    }

    /**
     * 模块信息列表
     *
     * @return
     */
    @RequestMapping("/viewList/{type}")
    public String showModuleMesViewList(Model model, @PathVariable Integer type) {
        List<Module> modules = moduleService.getAllRecode(null);
        model.addAttribute("modules", modules);
        model.addAttribute("type", type);
        return ADMIN_PREFIX + "moduleMes_view_list";
    }

    /**
     * 模块列表
     *
     * @return
     */
    @RequestMapping("/type")
    public String showModule() {
        return ADMIN_PREFIX + "module_list";
    }

    /**
     * 详情
     *
     * @param moduleMesId
     * @param model
     * @return
     */
    @RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
    public String showModuleMesInfo(@PathVariable("id") int moduleMesId, Model model) {
        ModuleMes moduleMes = moduleMesService.selectByPrimaryKey(moduleMesId);
        model.addAttribute("moduleMes", moduleMes);
        List<ModuleMes> topModuleMess = moduleMesService.selectTopOrLastN(moduleMesId, moduleMes.getModuleId(), 1, "top");
        if (ObjectUtils.isNotNull(topModuleMess)) {
            model.addAttribute("topModuleMes", topModuleMess.get(0));
        }
        List<ModuleMes> lastModuleMess = moduleMesService.selectTopOrLastN(moduleMesId, moduleMes.getModuleId(), 1, "last");
        if (ObjectUtils.isNotNull(lastModuleMess)) {
            model.addAttribute("lastModuleMes", lastModuleMess.get(0));
        }

        return ADMIN_PREFIX + "moduleMes_info";
    }

    /**
     * 发布
     *
     * @return
     */
    @RequestMapping("/publish")
    public String showAddModule(Model model) {
        List<Module> modules = moduleService.getAllRecode(null);
        model.addAttribute("modules", modules);
        return ADMIN_PREFIX + "moduleMes_publish";
    }

    /**
     * 更新
     *
     * @param moduleMesId
     * @param model
     * @return
     */
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String showModuleMes(@PathVariable("id") int moduleMesId, Model model) {
        List<Module> modules = moduleService.getAllRecode(null);
        ModuleMes moduleMes = moduleMesService.selectByPrimaryKey(moduleMesId);
        model.addAttribute("modules", modules);
        model.addAttribute("moduleMes", moduleMes);
        return ADMIN_PREFIX + "moduleMes_update";
    }

}
