package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.data.TreeBean;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.SysPermission;
import com.fedtech.pension.sys.service.SysPermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Gong
 * @date 2016/5/11
 */
@Controller
@RequestMapping("/admin/api/permission/")
public class PermissionApiController extends BaseController {

    @Reference(version = "1.0.0")
    private SysPermissionService permissionService;

    /**
     * 获取权限树形图
     *
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public List<TreeBean> selectAll() {
        List<SysPermission> list = permissionService.selectAllPermissions();
        return formatJsTree(list);
    }

    /**
     * 获取所有的权限
     *
     * @param sysPermission
     * @param pageRequest
     * @return
     */
    @RequestMapping("getList")
    @ResponseBody
    public PageResponse<SysPermission> selectPermissions(SysPermission sysPermission, PageRequest pageRequest) {
        PageResponse<SysPermission> dataTable = permissionService.selectPageList(sysPermission, pageRequest);
        return (dataTable);
    }


    private List<TreeBean> formatJsTree(List<SysPermission> list) {
        List<TreeBean> listTree = new ArrayList<TreeBean>();
        TreeBean treeBean;
        for (SysPermission bean : list) {
            treeBean = new TreeBean();
            treeBean.setId(String.valueOf(bean.getId()));
            treeBean.setParent(bean.getParentId().toString());
            treeBean.setText(bean.getName());
            listTree.add(treeBean);
        }
        return listTree;
    }

    /**
     * 删除权限
     *
     * @param sysPermissionId
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除权限")
    public JsonResult deletePermission(Integer sysPermissionId) {
        JsonResult result = new JsonResult();
        if (permissionService.deleteByPrimaryKey(sysPermissionId)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 添加权限
     *
     * @param sysPermission
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addSysPermission(SysPermission sysPermission) {
        JsonResult result = new JsonResult();
        sysPermission.setCreatorId(currentUser().getUid());
        sysPermission.setCreateTime(new Date());
        if (!ObjectUtils.isNotNull(sysPermission.getParentId())) {
            sysPermission.setParentId(0);
        }
        if (permissionService.insert(sysPermission)) {
            result.markSuccess("保存成功", sysPermission.getId());
        } else {
            result.markError("保存失败");
        }
        return result;
    }


    /**
     * 更新权限
     *
     * @param sysPermission
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新权限名称")
    public JsonResult updateSysPermission(SysPermission sysPermission) {
        JsonResult result = new JsonResult();
        if (permissionService.updateByPrimaryKeySelective(sysPermission)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 获取权限详情
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "detail", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult getDetail(@RequestParam("pid") Integer id) {
        JsonResult result = new JsonResult();

        if (id == null) {
            return null;
        }

        SysPermission per = permissionService.selectByPrimaryKey(id);
        if (null != per) {
            result.markSuccess("", per);
        } else {
            result.markError("不存在该权限信息");
        }
        return result;
    }
}
