package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.sys.entity.RolePermission;
import com.fedtech.pension.sys.entity.SysRole;
import com.fedtech.pension.sys.service.RolePermissionService;
import com.fedtech.pension.sys.service.SysRoleService;
import com.fedtech.pension.sys.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by GQ on 16/5/12.
 */
@Controller
@RequestMapping("/admin/api/sysrole/")
public class SysRoleApiController extends BaseController {

    @Reference(version = "1.0.0")
    private SysRoleService sysRoleService;
    @Reference(version = "1.0.0")
    private UserRoleService userRoleService;
    @Reference(version = "1.0.0")
    private RolePermissionService rolePermissionService;

    /**
     * 全部角色
     *
     * @param sysRole
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getList")
    @ResponseBody
    public PageResponse<SysRole> selectTaskTypeList(SysRole sysRole, PageRequest pageRequest){
        PageResponse<SysRole> dataTable = sysRoleService.selectPageList(sysRole,pageRequest);
        return dataTable;
    }



    /**
     * 删除角色
     * @param sysRoleId
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteCategory(Integer sysRoleId) {
        JsonResult result = new JsonResult();
        boolean b=false;
        if(sysRoleService.deleteByPrimaryKey(sysRoleId,currentUser().getUid()))
        {

            b=true;
        }
        if(b)
        {
            result.markSuccess("删除成功",null);
        }
        else
        {
            result.markError("删除失败");
        }
        return result;
    }
    /**
     * 更新角色
     * @param sysRole
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult updateCategory(SysRole sysRole) {
        JsonResult result = new JsonResult();
        if(sysRoleService.updateByPrimaryKeySelective(sysRole))
        {
            result.markSuccess("更新成功",null);
        }else{
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 添加角色
     * @param sysRole
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult addSysRole(SysRole sysRole,String premissions) {
        JsonResult result = new JsonResult();
        sysRole.setCreatorId(currentUser().getUid());
        sysRole.setCreateTime(new Date());
        sysRole.setDescription("");
        if(sysRoleService.insert(sysRole)){
            result.markSuccess("保存成功",null);
        }
        else
        {
            result.markError("保存失败");
        }
        return result;
    }

    /**
     * 获取角色权限列表
     * @param roleId
     * @return
     */
    @RequestMapping("perms")
    @ResponseBody
    public PageResponse<RolePermission> getPermissionsByRoleId(int roleId){
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(roleId);
        PageResponse<RolePermission> rolePermissions = rolePermissionService.selectPageList(rolePermission,new PageRequest());
        return rolePermissions;
    }


    /**
     * 更新角色权限
     * @param roleId
     * @param perms
     * @return
     */
    @RequestMapping("updatePerms")
    @ResponseBody
    @SystemControllerLog(description = "更新角色权限")
    public JsonResult getPermissionsByRoleId(int roleId,String perms){
       JsonResult result = new JsonResult();
        List<RolePermission> list = new ArrayList<RolePermission>();
        if(ObjectUtils.isNotNull(perms)){
            String[] arrPerms = perms.split(",");
            for(int i=0;i<arrPerms.length;i++){
                if(!"#".equals(arrPerms[i]) && ObjectUtils.isNotNull(arrPerms[i])){
                    RolePermission rolePermission = new RolePermission();
                    rolePermission.setRoleId(roleId);
                    rolePermission.setPermissionId(Integer.parseInt(arrPerms[i]));
                    list.add(rolePermission);
                }

            }
            if(rolePermissionService.insertSomeRolePermissions(list)>=0){
                result.markSuccess("保存成功",null);
            }
        }else {
            result.markError("未选中权限节点");
        }
        return result;

    }

}
