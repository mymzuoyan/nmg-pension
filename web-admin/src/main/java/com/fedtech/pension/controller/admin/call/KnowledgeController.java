package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.Knowledge;
import com.fedtech.pension.call.entity.KnowledgeType;
import com.fedtech.pension.call.service.KnowledgeService;
import com.fedtech.pension.call.service.KnowledgeTypeService;
import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author CoderQiang
 * @date 2017/2/24
 */
@Controller
@RequestMapping("/admin/call/knowledge/")
public class KnowledgeController extends BaseController {

    @Reference(version = "1.0.0")
    private KnowledgeTypeService knowledgeTypeService;

    @Reference(version = "1.0.0")
    private KnowledgeService knowledgeService;

    /**
     * 模块列表
     *
     * @return
     */
    @RequestMapping("/type/list")
    @SystemControllerLog(description = "查看知识库类型")
    public String showModule() {
        return ADMIN_CALL_PREFIX + "knowledge_type_list";
    }


    /**
     * 模块信息列表
     *
     * @return
     */
    @RequestMapping("/list")
    @SystemControllerLog(description = "查看知识库列表")
    public String showModuleMes(Model model) {
        List<KnowledgeType> knowledgeTypes = knowledgeTypeService.getAllRecode(null);
        model.addAttribute("knowledgeTypes", knowledgeTypes);
        return ADMIN_CALL_PREFIX + "knowledge_list";
    }


    /**
     * 发布
     *
     * @return
     */
    @RequestMapping("/add")
    public String showAddModule(Model model) {
        List<KnowledgeType> knowledgeTypes = knowledgeTypeService.getAllRecode(null);
        model.addAttribute("knowledgeTypes", knowledgeTypes);
        return ADMIN_CALL_PREFIX + "knowledge_add";
    }


    /**
     * 更新
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String showModuleMes(@PathVariable("id") int id, Model model) {
        List<KnowledgeType> knowledgeTypes = knowledgeTypeService.getAllRecode(null);
        Knowledge knowledge = knowledgeService.selectByPrimaryKey(id);
        model.addAttribute("knowledgeTypes", knowledgeTypes);
        model.addAttribute("knowledge", knowledge);
        return ADMIN_CALL_PREFIX + "knowledge_update";
    }


}
