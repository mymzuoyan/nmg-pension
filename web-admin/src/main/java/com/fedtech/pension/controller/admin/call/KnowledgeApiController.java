package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.Knowledge;
import com.fedtech.pension.call.entity.KnowledgeType;
import com.fedtech.pension.call.service.KnowledgeService;
import com.fedtech.pension.call.service.KnowledgeTypeService;
import com.fedtech.pension.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author CoderQiang
 * @date 2017/2/24
 */
@Controller
@RequestMapping("/admin/call/api/knowledge/")
public class KnowledgeApiController extends BaseController {

    @Reference(version = "1.0.0")
    private KnowledgeTypeService knowledgeTypeService;

    @Reference(version = "1.0.0")
    private KnowledgeService knowledgeService;

    /**
     * 模块信息展示
     *
     * @param knowledgeType
     * @param pageRequest
     * @return
     */
    @RequestMapping("/type/list")
    @ResponseBody
    public PageResponse<KnowledgeType> knowledgeTypeList(KnowledgeType knowledgeType, PageRequest pageRequest) {
        PageResponse<KnowledgeType> dataTable = knowledgeTypeService.selectPageList(knowledgeType, pageRequest);
        return dataTable;
    }


    /**
     * 添加知识库类型
     *
     * @param knowledgeType
     * @return
     */
    @RequestMapping("/type/add")
    @ResponseBody
    @SystemControllerLog(description = "添加知识库类型")
    public JsonResult addKnowledgeType(KnowledgeType knowledgeType) {
        JsonResult result = new JsonResult();
        knowledgeType.setCreatorId(currentUser().getUid());
        knowledgeType.setCreateTime(new Date());
        if (knowledgeTypeService.insert(knowledgeType)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }


    /**
     * 更新知识库类型
     *
     * @param knowledgeType
     * @return
     */
    @RequestMapping("/type/update")
    @ResponseBody
    @SystemControllerLog(description = "更新知识库类型")
    public JsonResult updateKnowledgeType(KnowledgeType knowledgeType) {
        JsonResult result = new JsonResult();
        if (knowledgeTypeService.updateByPrimaryKeySelective(knowledgeType)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 删除知识库类型
     *
     * @param knowledgeTypeId
     * @return
     */
    @RequestMapping("/type/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除知识库类型")
    public JsonResult deleteKnowledgeType(Integer knowledgeTypeId) {
        JsonResult result = new JsonResult();
        if (knowledgeTypeService.deleteByPrimaryKey(knowledgeTypeId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 知识库列表
     *
     * @param knowledge
     * @param pageRequest
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public PageResponse<Knowledge> knowledgeList(Knowledge knowledge, PageRequest pageRequest) {
        PageResponse<Knowledge> dataTable = knowledgeService.selectPageList(knowledge, pageRequest);
        return dataTable;
    }

    /**
     * 添加知识库信息
     *
     * @param knowledge
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    @SystemControllerLog(description = "添加知识库信息")
    public JsonResult addKnowledge(Knowledge knowledge) {
        JsonResult result = new JsonResult();
        knowledge.setCreateTime(new Date());
        knowledge.setCreatorId(currentUser().getUid());
        if (knowledgeService.insert(knowledge)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }


    /**
     * 更新知识库
     *
     * @param knowledge
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    @SystemControllerLog(description = "更新知识库")
    public JsonResult updateModuleMes(Knowledge knowledge) {
        JsonResult result = new JsonResult();
        if (knowledgeService.updateByPrimaryKeySelective(knowledge)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 删除知识库
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除知识库")
    public JsonResult deleteKnowledge(Integer id) {
        JsonResult result = new JsonResult();
        if (knowledgeService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


}
