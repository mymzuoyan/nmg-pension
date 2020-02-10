package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.entity.ServiceOrg;
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
public class CommunityPensionStarsApiController extends BaseController {



    @Reference(version = "1.0.0")
    private CommunityPensionStarsService communityPensionStarsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");




    /**
     * 内蒙古市社区养老服务站星级评定标准
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("communityPensionStars/list")
    @ResponseBody
    public PageResponse<CommunityPensionStars> getList(CommunityPensionStars filter, PageRequest pageRequest)throws Exception {

        return communityPensionStarsService.selectPageList(filter, pageRequest);
    }


    /**
     * 内蒙古市社区养老服务站星级评定标准列表删除
     * @param id
     * @return
     */

    @RequestMapping("org/communityPensionStars/delete")
    @ResponseBody
    public JsonResult delete(Integer id) {
        JsonResult result = new JsonResult();
        if (communityPensionStarsService.deleteByPrimaryKey(id)) {
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
    @RequestMapping("org/communityPensionStars/deleteSome")
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
        if (communityPensionStarsService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


    /***
     * 社区养老服务站星级评定标准添加
     * @param
     * @return
     */
    @RequestMapping(value = "org/communityPensionStars/add" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add1(CommunityPensionStars communityPensionStars) {

        JsonResult result = new JsonResult();
        ServiceOrg serviceOrg = null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            communityPensionStars.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        if (!org.springframework.util.StringUtils.isEmpty(Integer.parseInt(currentUser().getServiceOrgId()))) {
             serviceOrg=serviceOrgService.selectByPrimaryKey(Integer.parseInt(currentUser().getServiceOrgId()));
            communityPensionStars.setArea(serviceOrg.getAreaName());
            communityPensionStars.setOrganizationNames(serviceOrg.getInstitutionName());
            communityPensionStars.setUserId(currentUser().getUid());
            communityPensionStars.setPgType(0);
            communityPensionStars.setApplicationStatus(0);
        }

        if (communityPensionStarsService.insert(communityPensionStars)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;

    }

    /***
     * 社区养老服务站星级评定标准详情修改
     * @param
     * @return
     */
    @RequestMapping(value = "org/communityPensionStars/updata" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updata(CommunityPensionStars communityPensionStars) {

        JsonResult result = new JsonResult();

        if (communityPensionStarsService.updateByPrimaryKeySelective(communityPensionStars)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }

    /***
     * 社区养老服务站星级评定标准详情评估人员评级新增修改
     * @param
     * @return
     */
    @RequestMapping(value = "org/communityPensionStarsAssess/updata" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updataAssess(CommunityPensionStars communityPensionStars) {

        if(communityPensionStars.getPgType()==0){
            CommunityPensionStars communityPensionStarsOld = communityPensionStarsService.selectByPrimaryKey(communityPensionStars.getId());
            communityPensionStarsOld.setApplicationStatus(1);
            communityPensionStarsService.updateByPrimaryKeySelective(communityPensionStarsOld);
            communityPensionStars.setId(null);
            communityPensionStars.setUserId(currentUser().getUid());
            communityPensionStars.setPgType(1);
            communityPensionStars.setApplicationStatus(0);
            JsonResult result = new JsonResult();
            if (communityPensionStarsService.insert(communityPensionStars)) {
                result.markSuccess("添加评估成功", null);
            } else {
                result.markError("添加评估失败");
            }
            return result;

        }else{

            JsonResult result = new JsonResult();

            if (communityPensionStarsService.updateByPrimaryKeySelective(communityPensionStars)) {
                result.markSuccess("修改成功", null);
            } else {
                result.markError("修改失败");
            }
            return result;
        }
    }

}
