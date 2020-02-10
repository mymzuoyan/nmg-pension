package com.fedtech.pension.controller.admin.dictionary;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.ServiceProject;
import com.fedtech.pension.sys.entity.ServiceType;
import com.fedtech.pension.sys.service.ServiceProjectService;
import com.fedtech.pension.sys.service.ServiceTypeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * @author gengqiang
 * @date 2017/9/8
 */
@RestController
@RequestMapping("/admin/api/dictionary/")
public class DictionaryApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceTypeService serviceTypeService;

    @Reference(version = "1.0.0")
    private ServiceProjectService serviceProjectService;

    /**   ------------------------------服务类型Api---------------------------  **/

    /**
     * 服务类型管理
     *
     * @return
     */
    @RequestMapping(value = "serviceType/list", method = RequestMethod.POST)
    public PageResponse<ServiceType> getServiceTypeList(ServiceType serviceType, PageRequest pageRequest) {
        return serviceTypeService.selectPageList(serviceType, pageRequest);
    }

    /**
     * 获取全部服务类型
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "serviceProject/all", method = RequestMethod.POST)
    public List<ServiceType> getServiceTypeAll(ServiceType serviceType) {
        return serviceTypeService.getAllRecode(serviceType);
    }

    /**
     * 删除服务类型
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "serviceType/delete", method = RequestMethod.POST)
    public JsonResult deleteServiceType(Integer id) {
        JsonResult result = new JsonResult();
        if (serviceTypeService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 更新服务类型
     *
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "serviceType/update", method = RequestMethod.POST)
    public JsonResult updateServiceType(ServiceType serviceType) {
        JsonResult result = new JsonResult();
        if (serviceTypeService.updateByPrimaryKeySelective(serviceType)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 添加服务类型
     *
     * @param serviceType
     * @return
     */
    @RequestMapping(value = "serviceType/add", method = RequestMethod.POST)
    public JsonResult addServiceType(ServiceType serviceType) {
        JsonResult result = new JsonResult();
        if (serviceTypeService.insert(serviceType)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /**   ------------------------------服务项目Api---------------------------  **/


    /**
     * 服务项目管理
     *
     * @return
     */
    @RequestMapping(value = "serviceProject/list", method = RequestMethod.POST)
    public PageResponse<ServiceProject> getServiceProjectList(ServiceProject serviceProject, PageRequest pageRequest) {
        return serviceProjectService.selectPageList(serviceProject, pageRequest);
    }

    /**
     * 删除服务项目
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "serviceProject/delete", method = RequestMethod.POST)
    public JsonResult deleteServiceProject(Integer id) {
        JsonResult result = new JsonResult();
        if (serviceProjectService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 更新服务项目
     *
     * @param serviceProject
     * @return
     */
    @RequestMapping(value = "serviceProject/update", method = RequestMethod.POST)
    public JsonResult updateServiceProject(ServiceProject serviceProject) {
        JsonResult result = new JsonResult();
        if (serviceProjectService.updateByPrimaryKeySelective(serviceProject)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 添加服务项目
     *
     * @param serviceProject
     * @return
     */
    @RequestMapping(value = "serviceProject/add", method = RequestMethod.POST)
    public JsonResult addServiceProject(ServiceProject serviceProject) {
        JsonResult result = new JsonResult();
        serviceProject.setCreateTime(new Date());
        serviceProject.setCreator(currentUser().getUid());
        if (serviceProject.getStatus() == null) {
            serviceProject.setStatus(1);
        }
        if (serviceProjectService.insert(serviceProject)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }


}
