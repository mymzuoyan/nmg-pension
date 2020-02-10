package com.fedtech.pension.controller.admin.elderly;


import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import com.fedtech.pension.elderly.service.ElderLinkManService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zhangcz
 * @date 2018/2/28
 */
@RequestMapping("/admin/api/elderLinkMan/")
@Controller
public class ElderLinkManApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderLinkManService elderLinkManService;

    @RequestMapping("selectLinkManList")
    @ResponseBody
    public PageResponse<ElderLinkMan> selectLinkManList(ElderLinkMan elderLinkMan, PageRequest pageRequest) {
        PageResponse<ElderLinkMan> datatable = elderLinkManService.selectPageList(elderLinkMan, pageRequest);
        return datatable;
    }

    @RequestMapping("getLinkManById")
    @ResponseBody
    public ElderLinkMan getLinkManById(Integer id) {
        JsonResult result = new JsonResult();
        ElderLinkMan elderLinkMan= elderLinkManService.selectByPrimaryKey(id);
        return elderLinkMan;
    }

    @RequestMapping("addElderLinkMan")
    @ResponseBody
    @SystemControllerLog(description =  "添加老人相关联系人")
    public JsonResult addElderLinkMan(ElderLinkMan elderLinkMan) {
        JsonResult result = new JsonResult();
        if (elderLinkManService.insert(elderLinkMan)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }


    @RequestMapping("updateElderLinkMan")
    @ResponseBody
    @SystemControllerLog(description = "更新老人相关联系人")
    public JsonResult updateElderLinkMan(ElderLinkMan elderLinkMan) {
        JsonResult result = new JsonResult();
        if (elderLinkManService.updateByPrimaryKeySelective(elderLinkMan)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    @RequestMapping("deleteElderLinkMan")
    @ResponseBody
    @SystemControllerLog(description = "删除老人相关联系人")
    public JsonResult deleteElderLinkMan(Integer id) {
        JsonResult result = new JsonResult();
        if (elderLinkManService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

}
