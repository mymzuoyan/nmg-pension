package com.fedtech.pension.controller.admin.volunteer;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.volunteer.entity.VolStoreOrDraw;
import com.fedtech.pension.volunteer.entity.Volunteer;
import com.fedtech.pension.volunteer.service.VolStoreOrDrawService;
import com.fedtech.pension.volunteer.service.VolunteerService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author Administrator
 * @date 2016/9/30
 */
@Controller
@RequestMapping("/admin/api/")
public class VolStoreOrDrawApiController extends BaseController {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


    @Reference(version = "1.0.0")
    private VolStoreOrDrawService volStoreOrDrawService;

    @Reference(version = "1.0.0")
    private VolunteerService volunteerService;


    /**
     * 志愿者存入支取信息列表
     *
     * @param volStoreOrDraw
     * @param pageRequest
     * @return
     */
    @RequestMapping("volStoreOrDrawList")
    @ResponseBody
    public PageResponse<VolStoreOrDraw> getVolStoreOrDrawList(VolStoreOrDraw volStoreOrDraw, PageRequest pageRequest, String startTimeString, String endTimeString,Integer type) throws ParseException {
        if (!StringUtils.isEmpty(startTimeString)) {
            volStoreOrDraw.setStartTime(df.parse(startTimeString));
        }
        if (!StringUtils.isEmpty(endTimeString)) {
            volStoreOrDraw.setEndTime(df.parse(endTimeString));
        }
        volStoreOrDraw.setType(type);
        PageResponse<VolStoreOrDraw> dataTable = volStoreOrDrawService.selectPageList(volStoreOrDraw, pageRequest);
        return dataTable;
    }

    /**
     * 新增存入支取信息
     *
     * @param volStoreOrDraw
     * @param serviceTimeString
     * @return
     * @throws ParseException
     */
    @RequestMapping("volStoreOrDrawAdd")
    @ResponseBody
    public JsonResult volStoreOrDrawAdd(VolStoreOrDraw volStoreOrDraw,String serviceTimeString,String receiverChoose) throws ParseException {
        JsonResult result = new JsonResult();
        if (!StringUtils.isEmpty(serviceTimeString)) {
            volStoreOrDraw.setServiceTime(df.parse(serviceTimeString));
        }
        volStoreOrDraw.setOrganizationName(receiverChoose);
        if (volStoreOrDrawService.insert(volStoreOrDraw)) {
            //0-存入 1-支取
            Integer flag = volStoreOrDraw.getType();
            Volunteer volunteer = volunteerService.selectByPrimaryKey(volStoreOrDraw.getVolunteerId());
            if (flag == 0) {
                volunteer.setScore(volunteer.getScore() + volStoreOrDraw.getScore());
                if (volunteerService.updateByPrimaryKeySelective(volunteer)) {
                    result.markSuccess("添加成功", null);
                }
            } else if (flag == 1) {
                volunteer.setScore(volunteer.getScore() - volStoreOrDraw.getScore());
                if (volunteerService.updateByPrimaryKeySelective(volunteer)) {
                    result.markSuccess("添加成功", null);
                }
            }
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**
     * 更新存入支取信息
     *
     * @param volStoreOrDraw
     * @param serviceTimeString
     * @return
     * @throws ParseException
     */
    @RequestMapping("volStoreOrDrawEdit")
    @ResponseBody
    public JsonResult volunteerEdit(VolStoreOrDraw volStoreOrDraw, String serviceTimeString) throws ParseException {
        JsonResult result = new JsonResult();
        if (!StringUtils.isEmpty(serviceTimeString)) {
            volStoreOrDraw.setServiceTime(df.parse(serviceTimeString));
        }
        if (volStoreOrDrawService.updateByPrimaryKeySelective(volStoreOrDraw)) {
            //0-存入 1-支取
            Integer flag = volStoreOrDraw.getType();
            Volunteer volunteer = volunteerService.selectByPrimaryKey(volStoreOrDraw.getVolunteerId());
            if (flag == 0) {
                volunteer.setScore(volunteer.getScore() + volStoreOrDraw.getScore());
                if (volunteerService.updateByPrimaryKeySelective(volunteer)) {
                    result.markSuccess("更新成功", null);
                }
            } else if (flag == 1) {
                volunteer.setScore(volunteer.getScore() - volStoreOrDraw.getScore());
                if (volunteerService.updateByPrimaryKeySelective(volunteer)) {
                    result.markSuccess("更新成功", null);
                }
            }
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 删除存入支取信息
     *
     * @param eventId
     * @return
     */
    @RequestMapping("volStoreOrDrawDelete")
    @ResponseBody
    public JsonResult deleteVolunteer(Integer eventId) {
        JsonResult result = new JsonResult();
        if (volStoreOrDrawService.deleteByPrimaryKey(eventId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

}
