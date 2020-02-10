package com.fedtech.pension.controller.admin.integrity;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.org.entity.Integrity;
import com.fedtech.pension.org.service.IntegrityService;
import com.fedtech.pension.org.service.ServiceOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "/admin/api/")
public class IntegrityController extends BaseController {
    public final String ADMIN_PREFIX = "/admin/integrity/";
    @Reference(version = "1.0.0")
    IntegrityService integrityService;

    @Reference(version = "1.0.0")
    ServiceOrgService serviceOrgService;


    @RequestMapping("/Integrity/insert")
    @ResponseBody
    @Transactional
    public JsonResult insert(Integrity integrity) {
        User user = currentUser();
        integrity.setCreateName(user.getLogin_name());
        boolean boo = integrityService.insert(integrity);
        serviceOrgService.updateScore(integrity);
        JsonResult jsonResult = new JsonResult();
        if (boo) {
            jsonResult.markSuccess("发布成功", null);
        } else {
            jsonResult.markError("发布失败");
        }
        return jsonResult;
    }

    @RequestMapping("/Integrity/selectAll")
    @ResponseBody
    public PageResponse<Integrity> selectAll(Integrity integrity, PageRequest pageRequest) {
        PageResponse<Integrity> pageResponse = integrityService.selectPageList(integrity, pageRequest);
        return pageResponse;
    }

    @RequestMapping("/Integrity/delete")
    @ResponseBody
    public JsonResult delete(Integer id) {
        JsonResult jsonResult = new JsonResult();
        boolean result = integrityService.deleteByPrimaryKey(id);
        if (result) {
            jsonResult.markSuccess("删除成功", null);
        } else {
            jsonResult.markError("删除失败");
        }
        return jsonResult;
    }

    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("/Integrity/deleteSome")
    @ResponseBody
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        String[] ids = deleteIds.split(",");
        List<Integer> idList = new ArrayList<Integer>();
        for (String s : ids) {
            if (!org.apache.commons.lang.StringUtils.isEmpty(s)) {
                idList.add(Integer.parseInt(s));
            }
        }
        if (integrityService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    @RequestMapping("/Integrity/integrityInfo/{id}")
    public String integrityInfo(@PathVariable("id") Integer id, Model model) {
        Integrity integrity = integrityService.selectByPrimaryKey(id);
        model.addAttribute("integrity", integrity);
        return ADMIN_PREFIX + "integrityInfo";
    }

    @RequestMapping("/Integrity/update")
    @ResponseBody
    public JsonResult integrityUpdate(Integrity integrity) {
        integrity.setUpdateName(currentUser().getLogin_name());
        JsonResult jsonResult = new JsonResult();
        boolean result = integrityService.updateByPrimaryKeySelective(integrity);
        if (result) {
            jsonResult.markSuccess("更新成功", null);
        } else {
            jsonResult.markError("更新失败");
        }
        return jsonResult;
    }

    @RequestMapping("/showInfoExpourse")
    public String showInfoExpourse() {
        return ADMIN_PREFIX + "integrity_exposure";
    }

    @RequestMapping("/showInfoGlory")
    public String showInfoglory() {
        return ADMIN_PREFIX + "integrity_glory";
    }

    @RequestMapping("/showInfoExpourseThings")
    public String showInfoExpourseThings() {
        return ADMIN_PREFIX + "integrity_exposure_things";
    }

    @RequestMapping("/showInfoGloryThings")
    public String showInfoGloryThings() {
        return ADMIN_PREFIX + "integrity_glory_things";
    }

    @RequestMapping("/publishIntegrity")
    public String publishIntegrity() {
        return ADMIN_PREFIX + "integrity_exposure_add";
    }
}
