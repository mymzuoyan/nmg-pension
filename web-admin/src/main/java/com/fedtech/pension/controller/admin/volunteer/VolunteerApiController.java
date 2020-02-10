package com.fedtech.pension.controller.admin.volunteer;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.controller.admin.org.ServiceOrgApiController;
import com.fedtech.pension.volunteer.entity.Volunteer;
import com.fedtech.pension.volunteer.service.VolunteerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/28
 */
@Controller
@RequestMapping("/admin/api/volunteer/")
public class VolunteerApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(ServiceOrgApiController.class);

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private VolunteerService volunteerService;

    /**
     * 公益志愿者组织信息列表
     *
     * @param volunteer
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<Volunteer> getVolunteerList(Volunteer volunteer, PageRequest pageRequest) {
        PageResponse<Volunteer> dataTable = volunteerService.selectPageList(volunteer, pageRequest);
        return dataTable;
    }

    /**
     * 新增公益志愿者组织信息
     *
     * @param volunteer
     * @return
     * @throws ParseException
     */
    @RequestMapping("add")
    @ResponseBody
    public JsonResult volunteerAdd(Volunteer volunteer) throws ParseException {
        JsonResult result = new JsonResult();
        volunteer.setCreateUserId(currentUser().getUid());
        volunteer.setCreateTime(new Date());
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            volunteer.setCreateOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        if (volunteerService.insert(volunteer)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 更新公益志愿者组织信息
     *
     * @param volunteer
     * @return
     * @throws ParseException
     */
    @RequestMapping("update")
    @ResponseBody
    public JsonResult volunteerEdit(Volunteer volunteer) throws ParseException {
        JsonResult result = new JsonResult();
        if (volunteerService.updateByPrimaryKeySelective(volunteer)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 删除公益志愿者组织信息
     *
     * @param eventId
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public JsonResult deleteVolunteer(Integer eventId) {
        JsonResult result = new JsonResult();
        if (volunteerService.deleteByPrimaryKey(eventId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除志愿者组织信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("/deleteSomeMsg")
    @ResponseBody
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (volunteerService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

}