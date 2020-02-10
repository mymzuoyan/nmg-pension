package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.TreeBean;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.ServiceProject;
import com.fedtech.pension.sys.entity.ServiceType;
import com.fedtech.pension.sys.service.ServiceProjectService;
import com.fedtech.pension.sys.service.ServiceTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CodingQiang
 * @date 2016/10/27
 */
@Controller
@RequestMapping("/admin/api/ServiceProject/")
public class ServiceProjectApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceProjectService serviceProjectService;

    @Reference(version = "1.0.0")
    private ServiceTypeService serviceTypeService;

    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, List<ServiceProject>> selectServiceProjects(ServiceProject serviceProject) {
        Map<String, List<ServiceProject>> result = new HashMap<>();
        List<ServiceProject> serviceProjects = serviceProjectService.getAllRecode(serviceProject);
        for (ServiceProject p :
                serviceProjects) {
            if (ObjectUtils.isNull(p.getServiceTypeName())) {
                continue;
            }
            List<ServiceProject> old = result.get(p.getServiceTypeName());
            if (!ObjectUtils.isNotNull(old)) {
                old = new ArrayList<>();
            }
            old.add(p);
            result.put(p.getServiceTypeName(), old);
        }
        return result;
    }

    /**
     * 获取指定服务类型的服务项目的树形结构
     *
     * @param serviceTypeId
     * @return
     */
    @RequestMapping(value = "getTreeByServiceTypeId")
    @ResponseBody
    public List<TreeBean> getTreeByServiceTypeId(Integer serviceTypeId) {
        ServiceProject query = new ServiceProject();
        query.setServiceType(serviceTypeId);
        query.setStatus(1);
        List<TreeBean> list = new ArrayList<>();
        List<ServiceProject> serviceProjects = serviceProjectService.getAllRecode(query);
        serviceProjects.forEach(c -> {
            TreeBean treeBean = new TreeBean();
            treeBean.setParent("0");
            treeBean.setId(c.getId() + "");
            treeBean.setText(c.getServiceName());
            list.add(treeBean);
        });
        return list;
    }


    /**
     * 获取服务类型列表
     *
     * @return
     */
    @RequestMapping(value = "serviceType/list", method = RequestMethod.POST)
    @ResponseBody
    public AppResult serviceTypeList() {
        AppResult result = new AppResult();
        List<ServiceType> serviceTypes = serviceTypeService.getAllRecode(new ServiceType());
        result.markSuccess("获取服务类型列表成功", serviceTypes);
        return result;
    }

}
