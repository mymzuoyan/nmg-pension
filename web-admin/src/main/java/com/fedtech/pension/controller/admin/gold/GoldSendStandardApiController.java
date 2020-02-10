package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.gold.entity.GoldSendStandard;
import com.fedtech.pension.gold.service.GoldSendStandardService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author csn
 * @date 2018/1/12
 */
@Controller
@RequestMapping("admin/api/gold/sendStandard/")
public class GoldSendStandardApiController extends BaseController{

    @Reference(version = "1.0.0")
    private GoldSendStandardService goldSendStandardService;

    @RequestMapping("list")
    @ResponseBody
    public PageResponse<GoldSendStandard> list(GoldSendStandard filter, PageRequest pageRequest) {
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) ||
                currentUser.hasRole(RoleType.StAdmin.getValue())|| currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue())){
            String areaName = filter.getAreaName();
            if (StringUtils.isEmpty(areaName)){
                areaName = currentUser().getAreaName();
            }
            filter.setAreaName(areaName);
        }
        return goldSendStandardService.selectPageList(filter, pageRequest);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(GoldSendStandard goldSendStandard) {
        JsonResult result = new JsonResult();
        if (goldSendStandardService.updateByPrimaryKeySelective(goldSendStandard)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    @RequestMapping(value = "add" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add(GoldSendStandard goldSendStandard) {
        JsonResult result = new JsonResult();
        if (goldSendStandardService.insert(goldSendStandard)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    @RequestMapping("delete")
    @ResponseBody
    public JsonResult delete(Integer id) {
        JsonResult result = new JsonResult();
        if (goldSendStandardService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSome")
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
        if (goldSendStandardService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }
}
