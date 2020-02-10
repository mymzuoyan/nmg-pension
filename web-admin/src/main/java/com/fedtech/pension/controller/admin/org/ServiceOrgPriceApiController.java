package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.TreeBean;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgPrice;
import com.fedtech.pension.org.service.ServiceOrgPriceService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.entity.ServiceProject;
import com.fedtech.pension.sys.entity.ServiceType;
import com.fedtech.pension.sys.service.ServiceProjectService;
import com.fedtech.pension.sys.service.ServiceTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CoderQiang
 * @date 2017/5/22
 */
@Controller
@RequestMapping("/admin/api/serviceOrg/price/")
public class ServiceOrgPriceApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(ServiceOrgPriceApiController.class);

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgPriceService serviceOrgPriceService;

    @Reference(version = "1.0.0")
    private ServiceProjectService serviceProjectService;

    @Reference(version = "1.0.0")
    private ServiceTypeService serviceTypeService;


    /**
     * 获取组织的服务类型
     *
     * @return
     */
    @RequestMapping("getServiceTypeByOrg")
    @ResponseBody
    public List<TreeBean> getServiceTypeByOrg(Integer serviceOrgId) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgId);
        List<TreeBean> list = new ArrayList<>();
        if (ObjectUtils.isNotNull(serviceOrg.getServiceProject())) {
            List<ServiceType> serviceTypes = serviceTypeService.getTypeByIds(serviceOrg.getServiceProject());
            serviceTypes.forEach(c -> {
                TreeBean treeBean = new TreeBean();
                treeBean.setParent("0");
                treeBean.setId(c.getId() + "");
                treeBean.setText(c.getName());
                list.add(treeBean);
            });
        }
        return list;

    }

    /**
     * 获取组织的服务项目
     *
     * @param serviceOrgId
     * @return
     */
    @RequestMapping("getServiceProjectByOrg")
    @ResponseBody
    @SystemControllerLog(description = "查看服务组织价格体系")
    public JsonResult getServiceProjectByOrg(Integer serviceOrgId) {
        JsonResult result = new JsonResult();
        ServiceOrg sl = serviceOrgService.selectByPrimaryKey(serviceOrgId);
        Map<String, List<ServiceProject>> map = new LinkedHashMap<>();
        if (ObjectUtils.isNotNull(sl) && ObjectUtils.isNotNull(sl.getServiceProject())) {
            //获取组织的服务项目列表
            List<ServiceProject> serviceProjects = serviceProjectService.selectByTypeAndServiceOrgId(sl.getServiceProject(), serviceOrgId);
            for (ServiceProject s : serviceProjects) {
                List<ServiceProject> list = new ArrayList<>();
                if (ObjectUtils.isNotNull(map.get(s.getServiceTypeName()))) {
                    list = map.get(s.getServiceTypeName());
                }
                list.add(s);
                map.put(s.getServiceTypeName(), list);
            }
            if (ObjectUtils.isNotNull(serviceProjects)) {
                result.markSuccess("获取成功", map);
            }
        }
        return result;
    }

    /**
     * 根据服务项目名称和组织Id来获取列表
     *
     * @param name
     * @param serviceOrgId
     * @return
     */
    @RequestMapping("getByNameAndServiceOrgId")
    @ResponseBody
    public List<ServiceOrgPrice> getByNameAndServiceOrgId(String name, Integer serviceOrgId) {
        return serviceOrgPriceService.selectByNameAndServiceOrgId(name, serviceOrgId);
    }

    /**
     * 根据服务项目名称和组织Id来获取列表
     *
     * @param serviceProjectId
     * @param serviceOrgId
     * @return
     */
    @RequestMapping("getByProjectIdAndServiceOrgId")
    @ResponseBody
    public List<ServiceOrgPrice> getByProjectIdAndServiceOrgId(Integer serviceProjectId, Integer serviceOrgId) {
        return serviceOrgPriceService.selectByProjectIdAndServiceOrgId(serviceProjectId, serviceOrgId);
    }


    /**
     * 更新服务组织价格体系
     *
     * @return
     */
    @RequestMapping("addPrice")
    @ResponseBody
    @SystemControllerLog(description = "添加服务组织价格体系")
    public JsonResult addPrice(HttpServletRequest request, Integer serviceOrgId) {
        JsonResult result = new JsonResult();
        String[] ids = request.getParameterValues("id");
        String[] prices = request.getParameterValues("price");
        String[] moreInfo = request.getParameterValues("moreInfo");
        List<ServiceOrgPrice> serviceOrgPrices = new ArrayList<>();
        for (int i = 0; i < ids.length; i++) {
            ServiceOrgPrice serviceOrgPrice = new ServiceOrgPrice();
            try {
                serviceOrgPrice.setServiceProjectId(Integer.parseInt(ids[i]));
                if (!StringUtils.isEmpty(prices[i])) {
                    serviceOrgPrice.setPrice(Double.valueOf(prices[i]));
                } else {
                    serviceOrgPrice.setPrice(-1D);
                }
                if (!StringUtils.isEmpty(moreInfo[i])) {
                    serviceOrgPrice.setMoreInfo(moreInfo[i]);
                } else {
                    serviceOrgPrice.setMoreInfo("");
                }
                serviceOrgPrice.setServiceOrgId(serviceOrgId);
                serviceOrgPrices.add(serviceOrgPrice);
            } catch (Exception e) {
                e.printStackTrace();
                continue;
            }
        }
        //更新
        if (ObjectUtils.isNotNull(serviceOrgPrices) && serviceOrgPriceService.updateServiceOrgPrice(serviceOrgPrices, serviceOrgId)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markSuccess("添加失败", null);
        }
        return result;
    }

    @RequestMapping("updatePrice")
    @ResponseBody
    @SystemControllerLog(description = "更新服务组织价格体系")
    public JsonResult updatePrice(ServiceOrgPrice serviceOrgPrice) {
        JsonResult result = new JsonResult();
        //更新
        if (serviceOrgPriceService.updateByPrimaryKeySelective(serviceOrgPrice)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markSuccess("更新失败", null);
        }
        return result;
    }

    @RequestMapping("deletePrice")
    @ResponseBody
    @SystemControllerLog(description = "删除服务组织价格体系")
    public JsonResult deletePrice(Integer id) {
        JsonResult result = new JsonResult();
        //更新
        if (serviceOrgPriceService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markSuccess("删除失败", null);
        }
        return result;
    }

}
