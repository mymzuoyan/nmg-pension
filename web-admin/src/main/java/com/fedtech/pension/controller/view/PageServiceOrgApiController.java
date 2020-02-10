package com.fedtech.pension.controller.view;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.Point;
import com.fedtech.commons.utils.GeoUtils;
import com.fedtech.commons.utils.Keys;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.dwr.DwrService;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgComment;
import com.fedtech.pension.org.entity.ServiceOrgLocation;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.service.ServiceOrgCommentService;
import com.fedtech.pension.org.service.ServiceOrgLocationService;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Administrator
 * @date 2016/12/16
 */
@Controller
@RequestMapping("/view/api/serviceOrg")
public class PageServiceOrgApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Autowired
    private DwrService dwrService;

    @Reference(version = "1.0.0")
    private MessageService messageService;

    @Reference(version = "1.0.0")
    private ServiceOrgCommentService serviceOrgCommentService;

    private static String PERM_SERVICE_ORG_REGISTER_VERIFY = "";

    /**
     * 添加服务组织信息
     *
     * @param serviceOrg
     * @return
     */
    @RequestMapping("/apply")
    @ResponseBody
    public JsonResult addServiceOrg(ServiceOrg serviceOrg) throws ParseException {
        JsonResult result = new JsonResult();
        ServiceOrg serviceOrg1 = new ServiceOrg();
        serviceOrg1.setInstitutionName(serviceOrg.getInstitutionName());
        List<ServiceOrg> serviceOrgs = serviceOrgService.selectByInstitutionName(serviceOrg1);
        int count = 0;
        if (!serviceOrgs.isEmpty() && serviceOrgs.size() > 0) {
            for (ServiceOrg so : serviceOrgs) {
                if (so.getStatus() != 2) {// 平台导入去除名称相同限制
                    count += 1;
                }
            }
            if (count != 0) {
                result.markError("该组织已存在");
            } else {
                result = insert(serviceOrg);
            }
        } else {
            result = insert(serviceOrg);
        }
        return result;
    }

    public JsonResult insert(ServiceOrg serviceOrg) {
        JsonResult result = new JsonResult();
        serviceOrg.setCreateTime(new Date());
        if (serviceOrgService.insert(serviceOrg)) {
            result.markSuccess("申请成功", null);
        } else {
            result.markError("申请失败");
        }
        return result;
    }



    /**
     * 分页获取组织列表
     *
     * @param serviceProjectId
     * @param lat
     * @param lng
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceOrgList(@RequestParam(value = "serviceProjectId") Integer serviceProjectId,
                                    @RequestParam(value = "lat", required = false) Double lat,
                                    @RequestParam(value = "lng", required = false) Double lng) {
        List<ServiceOrgLocation> serviceOrgLocations = new ArrayList<>();
        List<ServiceOrgLocation> sResult = new ArrayList<>();
        AppResult result = new AppResult();
        if (!ObjectUtils.isNotNull(currentUser().getUid())) {
            result.markError("请先登录");
            return result;
        }
        ServiceOrgPrice serviceOrgPrice = new ServiceOrgPrice();
        serviceOrgPrice.setServiceProjectId(serviceProjectId);
        PageRequest pageRequest = new PageRequest();
        pageRequest.setOrderDir("asc");
        pageRequest.setOrderField("a.price");
        List<ServiceOrgPrice> serviceOrgPrices = serviceOrgPriceService.selectByPage(serviceOrgPrice, pageRequest);
        for (ServiceOrgPrice s : serviceOrgPrices) {
            try {
                serviceOrgLocations.add((ServiceOrgLocation) serviceOrgLocationService.selectByServiceOrgId(s.getServiceOrgId()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (ObjectUtils.isNotNull(serviceOrgLocations)) {
            Point center = new Point();
            center.setLng(lng);
            center.setLat(lat);
            for (ServiceOrgLocation s : serviceOrgLocations) {
                if (ObjectUtils.isNotNull(s) && ObjectUtils.isNotNull(s.getLng())) {
                    Point point = new Point();
                    point.setLng(s.getLng());
                    point.setLat(s.getLat());
                    if (GeoUtils.isPointInCircle(point, center, Keys.PUSHRANGE)) {
                        sResult.add(s);
                    }
                }
            }
            if (!ObjectUtils.isNotNull(sResult)) {
                if (serviceOrgLocations.size() >= 4) {
                    sResult = serviceOrgLocations.subList(0, 4);
                } else {
                    sResult = serviceOrgLocations.subList(0, serviceOrgLocations.size());
                }
            }
        }
        result.markSuccess("获取组织成功", sResult);
        return result;
    }

    /**
     * 评论
     * @param serviceOrgComment
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public JsonResult addComment(ServiceOrgComment serviceOrgComment)
    {
        JsonResult result = new JsonResult();
        serviceOrgComment.setCreateTime(new Date());
        if (serviceOrgCommentService.insert(serviceOrgComment)) {
            result.markSuccess("评论成功", null);
        } else {
            result.markError("评论失败");
        }
        return result;
    }


}
