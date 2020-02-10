package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.QualificationSubsidy;
import com.fedtech.pension.org.service.QualificationSubsidyService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.org.vo.QualificationStatistics;
import com.fedtech.pension.sys.entity.Area;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @author DMJ
 * @date 2019/4/3
 */
@Controller
@RequestMapping("/admin/api/qualification/")
public class QualificationSubsidyApiController extends BaseController {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private QualificationSubsidyService  qualificationSubsidyService;
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    /**
     * 资格补贴申请
     * @param qualificationSubsidy
     * @return
     */
    @RequestMapping("apply")
    @ResponseBody
    public JsonResult applySubsidy(QualificationSubsidy qualificationSubsidy) {
        JsonResult result = new JsonResult();
        qualificationSubsidy.setApplyTime(new Date());
        if(qualificationSubsidy.getServiceOrgId() != null){
            String areaName = serviceOrgService.selectByPrimaryKey(qualificationSubsidy.getServiceOrgId()).getAreaName();
            qualificationSubsidy.setAreaName(areaName);
            String[] areaList = areaName.split(",");
            if(areaList.length >= 2){
                int areaId = qualificationSubsidyService.getAreaId(areaList[1]);
                qualificationSubsidy.setAreaId(areaId);
            }
        }
        if(qualificationSubsidyService.insert(qualificationSubsidy)){
            result.markSuccess("申请成功", null);
        }else {
            result.markError("申请失败");
        }
        return result;
    }
    /**
     *
     *资格补贴申请查询
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<QualificationSubsidy> getList(QualificationSubsidy filter, PageRequest pageRequest)throws Exception {
        return qualificationSubsidyService.selectPageList(filter, pageRequest);
    }

    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeMsg")
    @ResponseBody
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> list = new ArrayList<>();
        if(ObjectUtils.isNotNull(deleteIds)){
            String[] arrs = deleteIds.split(",");
            for(String item : arrs){
                list.add(Integer.parseInt(item));
            }
        }
        if(qualificationSubsidyService.deleteSomeMsg(list)){
            result.markSuccess("删除成功", null);
        }else {
            result.markError("删除失败");
        }
        return result;
    }
    /**
     * 资格补贴申请审核
     * @param qualificationSubsidy
     * @return
     */
    @RequestMapping("verity")
    @ResponseBody
    public JsonResult veritySubsidy(QualificationSubsidy qualificationSubsidy) {
        JsonResult result = new JsonResult();
        if(qualificationSubsidyService.updateByPrimaryKeySelective(qualificationSubsidy)){
            result.markSuccess("审核成功", null);
        }else {
            result.markError("审核失败");
        }
        return result;
    }

    /**
     * 动态获取下拉列表
     * @return
     */
    @RequestMapping("area")
    @ResponseBody
    public JsonResult getArea() {
        JsonResult result = new JsonResult();
        List<Area> listArea = qualificationSubsidyService.getListArea();
        result.markSuccess("查询成功",listArea);
        return result;
    }

    /**
     * 获取统计数据
     * @return
     */
    @RequestMapping("statistics")
    @ResponseBody
    public PageResponse<QualificationStatistics> getStatistics(Integer areaId){
        if(areaId == null){
            areaId = 1;
        }
        PageResponse<QualificationStatistics> pageResponse = new PageResponse<>();
        pageResponse.setData(qualificationSubsidyService.getStatistics(areaId));
        pageResponse.setRecordsFiltered(qualificationSubsidyService.getStatistics(areaId).size());
        pageResponse.setRecordsTotal(qualificationSubsidyService.getStatistics(areaId).size());
        return pageResponse;
    }
}
