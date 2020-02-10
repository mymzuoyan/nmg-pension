package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.data.PaginationResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.ModuleMes;
import com.fedtech.pension.portal.entity.ModuleMesComment;
import com.fedtech.pension.portal.service.ModuleMesCommentService;
import com.fedtech.pension.portal.service.ModuleMesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * @author CodingQiang
 * @date 2016/11/7
 */
@Controller
@RequestMapping("/moduleMes/api/")
public class PageModuleMesApiController extends BaseController {

    private Integer yangLaoFuWuZuZhiFenCai = 7;

    @Reference(version = "1.0.0")
    private ModuleMesService moduleMesService;

    @Reference(version = "1.0.0")
    private ModuleMesCommentService moduleMesCommentService;

    /**
     * 获取首页的信息列表
     *
     * @return
     */
    @RequestMapping("/selectIndexInfo")
    @ResponseBody
    public Set<ModuleMes> selectIndexInfo() {
        Set<ModuleMes> result = new LinkedHashSet<>();
        List<ModuleMes> moduleMess = moduleMesService.selectTopNByModule(6);
        List<ModuleMes> others = moduleMesService.selectTopNByModuleId(yangLaoFuWuZuZhiFenCai, 10);
        result.addAll(others);
        result.addAll(moduleMess);
        return result;
    }

    @RequestMapping("/selectTopNByModuleId")
    @ResponseBody
    public List<ModuleMes> selectMoudleMes(Integer moduleId, Integer count) {
        return moduleMesService.selectTopNByModuleId(moduleId, count);
    }

    @RequestMapping("selectPutTopMes")
    @ResponseBody
    public List<ModuleMes> selectPutTopMes(Integer count) {
        return moduleMesService.selectPutTopMes(count);
    }


    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getList(ModuleMes moduleMes, Integer page, PageRequest pageRequest) {
        int length = 5;
        if (ObjectUtils.isNotNull(pageRequest.getLength())) {
            length = pageRequest.getLength();
        }
        JsonResult result = new JsonResult();
        pageRequest.setOrderField("id");
        pageRequest.setOrderDir("DESC");
        if (page < 1) {
            page = 1;
        }
        pageRequest.setStart(length * (page - 1));
        JSONObject jo = new JSONObject();
        PageResponse<ModuleMes> moduleMesPageResponse = moduleMesService.selectPageList(moduleMes, pageRequest);
        int count = moduleMesPageResponse.getRecordsFiltered();
        jo.put("totalPage", count % length > 0 ? count / length + 1 : count / length);
        jo.put("infos", moduleMesPageResponse.getData());
        result.markSuccess("获取成功", jo);
        return result;
    }


    /**
     * 文章评论列表
     *
     * @param mesId
     * @param page
     * @return
     */
    @RequestMapping("comments")
    @ResponseBody
    public PaginationResponse<ModuleMesComment> pullComments(@RequestParam("mesId") Integer mesId, int page) {
        if (page <= 0) {
            page = 1;
        }
        PaginationResponse<ModuleMesComment> jsonResult = moduleMesCommentService.selectByModuleMesId(mesId, page, 10);
        return jsonResult;
    }

    /**
     * 评论
     *
     * @param moduleMesComment
     * @return
     */
    @RequestMapping("comment/add")
    @ResponseBody
    public JsonResult addComment(ModuleMesComment moduleMesComment) {
        JsonResult jsonResult = new JsonResult();
        moduleMesComment.setCreateTime(new Date());
        moduleMesComment.setFromId(currentUser().getUid());
        moduleMesComment.setFromName(currentUser().getLogin_name());
        if (moduleMesCommentService.insert(moduleMesComment)) {
            jsonResult.markSuccess("评论成功", null);
        } else {
            jsonResult.markError("评论失败");
        }
        return jsonResult;
    }

    /**
     * 删除评论
     *
     * @param id
     * @return
     */
    @RequestMapping("comment/delete")
    @ResponseBody
    public JsonResult deleteComment(Integer id) {
        JsonResult jsonResult = new JsonResult();
        if (moduleMesCommentService.deleteByPrimaryKey(id)) {
            jsonResult.markSuccess("删除评论成功", null);
        } else {
            jsonResult.markError("删除评论失败");
        }
        return jsonResult;
    }


}
