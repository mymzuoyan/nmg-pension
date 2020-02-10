package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.AreaHomePensionStars;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.AreaHomePensionStarsService;
import com.fedtech.pension.org.service.CommunityPensionStarsService;
import com.fedtech.pension.org.service.ServiceOrgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


/**
 * @author guxiangyang
 * @date 2019/8/21
 */
@Controller
@RequestMapping("/admin/api/institution/")
public class AreaHomePensionStarsApiController extends BaseController {

    @Reference(version = "1.0.0")
    private AreaHomePensionStarsService areaHomePensionStarsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 内蒙古市区域性居家养老服务中心星级评定标准
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("areaHomePensionStars/list")
    @ResponseBody
    public PageResponse<AreaHomePensionStars> getList(AreaHomePensionStars filter, PageRequest pageRequest)throws Exception {

        return areaHomePensionStarsService.selectPageList(filter, pageRequest);
    }


    /**
     * 内蒙古市区域性居家养老服务中心星级评定标准删除
     * @param id
     * @return
     */

    @RequestMapping("org/areaHomePensionStars/delete")
    @ResponseBody
    public JsonResult delete(Integer id) {
        JsonResult result = new JsonResult();
        if (areaHomePensionStarsService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }



    /***
     * 内蒙古市区域性居家养老服务中心星级评定标准详情修改
     * @param
     * @return
     */
    @RequestMapping(value = "org/areaHomePensionStars/updata" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updata(AreaHomePensionStars areaHomePensionStars) {

        JsonResult result = new JsonResult();

        if (areaHomePensionStarsService.updateByPrimaryKeySelective(areaHomePensionStars)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }


    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("org/areaHomePensionStars/deleteSome")
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
        if (areaHomePensionStarsService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }




    /***
     * 内蒙古市区域性居家养老服务中心星级评定标准添加
     * @param
     * @return
     */
    @RequestMapping(value = "org/areaHomePensionStars/add" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add1(AreaHomePensionStars areaHomePensionStars) {

        JsonResult result = new JsonResult();
        ServiceOrg serviceOrg = null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            areaHomePensionStars.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        if (!org.springframework.util.StringUtils.isEmpty(Integer.parseInt(currentUser().getServiceOrgId()))) {
            serviceOrg=serviceOrgService.selectByPrimaryKey(Integer.parseInt(currentUser().getServiceOrgId()));
            areaHomePensionStars.setArea(serviceOrg.getAreaName());
            areaHomePensionStars.setOrganizationNames(serviceOrg.getInstitutionName());
            areaHomePensionStars.setUserId(currentUser().getUid());
            areaHomePensionStars.setApplicationStatus(0);
            areaHomePensionStars.setPgType(0);

        }

        if (areaHomePensionStarsService.insert(areaHomePensionStars)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;

    }


    /***
     * 区域养老服务站星级评定标准详情评估人员评级新增修改
     * @param
     * @return
     */
    @RequestMapping(value = "org/areaHomePensionStarsAssess/updata" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updataAssess(AreaHomePensionStars areaHomePensionStars) {

        if(areaHomePensionStars.getPgType()==0){
            AreaHomePensionStars areaHomePensionStarsOld = areaHomePensionStarsService.selectByPrimaryKey(areaHomePensionStars.getId());
            areaHomePensionStarsOld.setApplicationStatus(1);
            areaHomePensionStarsService.updateByPrimaryKeySelective(areaHomePensionStarsOld);
            areaHomePensionStars.setId(null);
            areaHomePensionStars.setUserId(currentUser().getUid());
            areaHomePensionStars.setPgType(1);
            areaHomePensionStars.setApplicationStatus(0);
            JsonResult result = new JsonResult();
            if (areaHomePensionStarsService.insert(areaHomePensionStars)) {
                result.markSuccess("添加评估成功", null);
            } else {
                result.markError("添加评估失败");
            }
            return result;

        }else{

            JsonResult result = new JsonResult();

            if (areaHomePensionStarsService.updateByPrimaryKeySelective(areaHomePensionStars)) {
                result.markSuccess("修改评估成功", null);
            } else {
                result.markError("修改评估失败");
            }
            return result;
        }
    }



}
