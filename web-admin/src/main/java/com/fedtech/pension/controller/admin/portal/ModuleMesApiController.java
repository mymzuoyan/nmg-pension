package com.fedtech.pension.controller.admin.portal;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.portal.entity.Module;
import com.fedtech.pension.portal.entity.ModuleMes;
import com.fedtech.pension.portal.quantity.ModuleMesQuantity;
import com.fedtech.pension.portal.service.ModuleMesService;
import com.fedtech.pension.portal.service.ModuleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Administrator
 * @date 2016/10/12
 */
@Controller
@RequestMapping("/admin/api/")
public class ModuleMesApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ModuleMesService moduleMesService;

    @Reference(version = "1.0.0")
    private ModuleService moduleService;

    /**
     * 模块信息展示
     *
     * @param moduleMes
     * @param pageRequest
     * @return
     */
    @RequestMapping("/moduleMes/list")
    @ResponseBody
    @SystemControllerLog(description = "查看新闻列表")
    public PageResponse<ModuleMes> moduleMesList(ModuleMes moduleMes, PageRequest pageRequest) {
        if (!getCurrentUser().hasRole(RoleType.SuAdmin.getValue())) {
            moduleMes.setCreatorId(currentUser().getUid());
        }
        PageResponse<ModuleMes> dataTable = moduleMesService.selectPageList(moduleMes, pageRequest);
        return dataTable;
    }

    /**
     * 模块信息展示
     *
     * @param module
     * @param pageRequest
     * @return
     */
    @RequestMapping("/module/list")
    @ResponseBody
    @SystemControllerLog(description = "查看新闻类型")
    public PageResponse<Module> moduleList(Module module, PageRequest pageRequest) {
        PageResponse<Module> dataTable = moduleService.selectPageList(module, pageRequest);
        return dataTable;
    }

    /**
     * 添加模块信息
     *
     * @param moduleMes
     * @return
     */
    @RequestMapping("/moduleMes/publish")
    @ResponseBody
    @SystemControllerLog(description = "发布新闻")
    public JsonResult addModuleMes(ModuleMes moduleMes) {
        JsonResult result = new JsonResult();
        moduleMes.setCreateTime(new Date());
        moduleMes.setCreatorId(currentUser().getUid());
        moduleMes.setCreatorName(currentUser().getLogin_name());
        if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue())) {
            moduleMes.setStatus(ModuleMesQuantity.CHECKED);
        }
        if (moduleMesService.insert(moduleMes)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }

    /**
     * 添加模块信息
     *
     * @param module
     * @return
     */
    @RequestMapping("/module/add")
    @ResponseBody
    @SystemControllerLog(description = "添加服务类型")
    public JsonResult addModule(Module module) {
        JsonResult result = new JsonResult();
        if (moduleService.insert(module)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }

    /**
     * 更新模块信息
     *
     * @param moduleMes
     * @return
     */
    @RequestMapping("/moduleMes/update")
    @ResponseBody
    @SystemControllerLog(description = "更新新闻")
    public JsonResult updateModuleMes(ModuleMes moduleMes) {
        JsonResult result = new JsonResult();
        if (moduleMesService.updateByPrimaryKeySelective(moduleMes)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    @RequestMapping("/moduleMes/verify")
    @ResponseBody
    @SystemControllerLog(description = "审核新闻")
    public JsonResult verifyModuleMeses(String selectIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (selectIds != null) {
            for (int i = 0; i < selectIds.split(",").length; i++) {
                if (selectIds.split(",")[i] != null && selectIds.split(",")[i] != "")
                    idList.add(Integer.parseInt(selectIds.split(",")[i]));
            }
            if (moduleMesService.verifyModuleMeses(idList)) {
                result.markSuccess("审核成功", null);
            } else {
                result.markError("审核失败");
            }
        } else {
            result.markError("审核失败");
        }
        return result;
    }

    /**
     * 更新模块类型
     *
     * @param module
     * @return
     */
    @RequestMapping("/module/update")
    @ResponseBody
    @SystemControllerLog(description = "更新新闻类型")
    public JsonResult updateModule(Module module) {
        JsonResult result = new JsonResult();
        if (moduleService.updateByPrimaryKeySelective(module)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 删除模块信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/moduleMes/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除新闻")
    public JsonResult deleteModulesMes(Integer id) {
        JsonResult result = new JsonResult();
        if (moduleMesService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 删除模块信息
     *
     * @param moduleId
     * @return
     */
    @RequestMapping("/module/delete")
    @ResponseBody
    @SystemControllerLog(description = "删除新闻类型")
    public JsonResult deleteModule(Integer moduleId) {
        JsonResult result = new JsonResult();
        if (moduleService.deleteByPrimaryKey(moduleId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    @RequestMapping("/moduleMes/fileUpload")
    @ResponseBody
    public JsonResult fileUpload(HttpServletRequest request, MultipartFile avatar, String id) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult saveResult = util.saveFile(request, avatar, util.SAVEURL_MODULEMES_IMAGE, false);
        ModuleMes moduleMes = new ModuleMes();
        moduleMes.setImage(saveResult.getData().toString());
        if (id != null && id != "") {
            moduleMes.setId(Integer.parseInt(id));
            if (moduleMesService.updateByPrimaryKeySelective(moduleMes)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        } else {
            moduleMes.setId(moduleMesService.selectMaxId());
            if (moduleMesService.updateByPrimaryKeySelective(moduleMes)) {
                result.markSuccess("保存成功", null);
            } else {
                result.markError("保存失败");
            }
        }
        return result;
    }

}
