package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.service.CommunityPensionStarsService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.org.service.StarRatingOfInstitutionsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


/**
 * @author miaoyueming
 * @date 2019/8/29
 */
@Controller
@RequestMapping("/admin/api/institution/")
public class StarRateApiController extends BaseController {



    @Reference(version = "1.0.0")
    private StarRatingOfInstitutionsService starRatingOfInstitutionsService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


    /**
     * 批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("org/starRate/deleteSome")
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
        if (starRatingOfInstitutionsService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


}
