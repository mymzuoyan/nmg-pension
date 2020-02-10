package com.fedtech.pension.controller.admin.sys;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.TreeBean;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @author Administrator
 * @date 2016/9/9
 */
@Controller
@RequestMapping("/admin/api/area/")
public class AreaApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(AreaApiController.class);

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    /**
     * getTree 区域和组织
     * <p>
     * sysRole=0 根据客户需求，组织也可以修改其所属区域，不仅限于注册时所选的区域，可选其他区。
     *
     * @return
     */
    @RequestMapping(value = "getTree", method = RequestMethod.POST)
    @ResponseBody
    public List<TreeBean> getTree(@RequestParam(value = "sysRole", required = false) Integer sysRole) {
        List<TreeBean> treeBeens = new ArrayList<TreeBean>();
        List<ServiceOrg> serviceOrgs = null;
        List<Area> areas = new ArrayList<>();
        Set<Integer> areaIds = new HashSet<>();
        Area area = null;
        boolean flag = false;
        String districtId = "";
        Subject currentUser = SecurityUtils.getSubject();
        if (ObjectUtils.isNotNull(sysRole) && !sysRole.equals(0)) {
            //超级管理员，市级管理员，区域只选南京
            if (sysRole == RoleType.SuAdmin.getId() || sysRole == RoleType.MuAdmin.getId()) {
                area = new Area();
                area.setLevel(1);
            }
            //区域管理员，区域到区级
            else if (sysRole == RoleType.ReAdmin.getId()) {
                area = new Area();
                area.setLevel(2);
            } else if ((sysRole == RoleType.ZuAdmin.getId())) {
                serviceOrgs = serviceOrgService.getAllRecode(null);
            }
            //服务人员,选择组织
            else if (sysRole == RoleType.ServiceUser.getId()) {
                if ((currentUser.hasRole(RoleType.ZuAdmin.getValue()))) {
                    ServiceOrg serviceOrg = new ServiceOrg();
                    String serviceOrgIds = currentUser().getServiceOrgId();
                    if (serviceOrgIds.indexOf(",") < 0) {
                        //组织管理员
                        serviceOrg.setId(Integer.parseInt(serviceOrgIds));
                    } else {
                        //组织群管理员
                    }
                    serviceOrgs = serviceOrgService.getAllRecode(serviceOrg);
                } else {
                    serviceOrgs = serviceOrgService.getAllRecode(new ServiceOrg());
                }
            }

            if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
                area = new Area();
                area.setId(currentUser().getAreaId());
                area.setName(currentUser().getAreaName());
                area.setParentId(0);
                areas.add(area);
            } else {
                areas = areaService.getAllRecode(area);
            }
        } else {
            area = new Area();
            if (!currentUser.hasRole(RoleType.SuAdmin.getValue())  && ObjectUtils.isNotNull(sysRole) && !sysRole.equals(0)) {
                Area filter = areaService.selectByPrimaryKey(currentUser().getAreaId());
                districtId = filter.getDistrictId();
                flag = true;
                area.setDistrictId(districtId);
            }else {
                if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) ||
                        currentUser.hasRole(RoleType.StAdmin.getValue())|| currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue())){
                    Area filter = areaService.selectByPrimaryKey(currentUser().getAreaId());
                    districtId = filter.getDistrictId();
                    flag = true;
                    area.setDistrictId(districtId);
                }
            }
            areas = areaService.getAllRecode(area);
        }
        if (ObjectUtils.isNotNull(serviceOrgs)) {
            for (ServiceOrg s : serviceOrgs
                    ) {
                TreeBean bean = new TreeBean();
                bean.setId("serviceOrg" + s.getId().toString());
                bean.setText(s.getInstitutionName());
                if (s.getAreaId() != null) {
                    bean.setParent(s.getAreaId().toString());
                } else {
                    bean.setParent("0");
                }
                bean.setType("serviceOrg");
                treeBeens.add(bean);
            }
        }
        if (ObjectUtils.isNotNull(areas)) {
            for (Area a :
                    areas) {
                TreeBean bean = new TreeBean();
                bean.setId(a.getId().toString());
                bean.setText(a.getName());
                if (flag && districtId.equals(a.getDistrictId())) {
                    bean.setParent("0");
                } else {
                    bean.setParent(a.getParentId().toString());
                }
                treeBeens.add(bean);
            }
        }

        return treeBeens;
    }


    /**
     * get area's tree
     * <p>
     * areaId=1 修改组织服务范围（南京市范围内的都可以选择，非南京市不要），所有权限都可以修改
     *
     * @return
     */
    @RequestMapping(value = "getAreaTree", method = RequestMethod.POST)
    @ResponseBody
    public List<TreeBean> getAreaTree(Integer areaId) {
        List<TreeBean> treeBeens = new ArrayList<TreeBean>();
        HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
        Set<Integer> ids = hash.keySet();
        Set<Area> list = new HashSet<>();
        Set<Area> addList = new HashSet<>();
        Area area = new Area();
        if (!StringUtils.isEmpty(areaId) && areaId.equals(1)) {
            area = (Area) hash.get(areaId);
        } else {
            area = (Area) hash.get(currentUser().getAreaId());
        }

        if (area.getParentId() != 0) {
            area.setParentId(0);
            area.setName("内蒙古市," + area.getName());
        }
        list.add(area);
        for (int i = area.getLevel() + 1; i <= 4; i++) {
            list.addAll(addList);
            for (Area a : list) {
                if (a.getLevel() == (i - 1)) {
                    for (Integer j : ids) {
                        Area b = (Area) hash.get(j);
                        if (b.getParentId().equals(a.getId())) {
                            addList.add(b);
                        }
                    }
                }
            }
        }
        list.addAll(addList);
        if (ObjectUtils.isNotNull(list)) {
            for (Area a : list) {
                TreeBean bean = new TreeBean();
                bean.setId(a.getId().toString());
                bean.setText(a.getName());
                bean.setParent(a.getParentId().toString());
                treeBeens.add(bean);
            }
        }
        return treeBeens;
    }


    /**
     * 得到等级小于level的区域
     *
     * @param area
     * @return
     */
    @RequestMapping(value = "getAreaLessLevel", method = RequestMethod.POST)
    @ResponseBody
    public List<Area> getAreaLessLevel(Area area) {
        List<Area> areas = areaService.getAllRecode(area);
        return areas;
    }


    /**
     * 得到DistrictId
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getDistrictId", method = RequestMethod.POST)
    @ResponseBody
    public String getDistrictId(@Parameter Integer id) {
        Area area = areaService.selectByPrimaryKey(id);
        String districtId = area.getDistrictId();
        return districtId;
    }

    /**
     * 通过父级id获取区域信息
     *
     * @param parentId
     * @return
     */
    @RequestMapping("getListByParentId")
    @ResponseBody
    public List<Area> getListByParentId(Integer parentId) {
        List<Area> areas = areaService.selectByParentId(parentId);
        return areas;
    }

    @RequestMapping("getListByLevel")
    @ResponseBody
    public List<Area> getListByLevel(Area area) {
        List<Area> areas = areaService.selectPageList(area, new PageRequest()).getData();
        return areas;
    }

}
