package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.JiuYe;
import com.fedtech.pension.elderly.service.JiuYeService;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgAssessment;
import com.fedtech.pension.org.entity.ServiceOrgRecord;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.service.ServiceOrgAssessmentService;
import com.fedtech.pension.org.service.ServiceOrgRecordService;
import com.fedtech.pension.org.service.ServiceOrgRecreationalActivitiesService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.entity.UserApprove;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserApproveService;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import static com.fedtech.web.utils.Servlets.getRequest;

/**
 * @author gengqiang
 */
@Controller
@RequestMapping("/admin/")
public class ServiceOrgController extends BaseController {
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgAssessmentService serviceOrgAssessmentService;

    @Reference(version = "1.0.0")
    public UserService userService;

    @Reference(version = "1.0.0")
    public JiuYeService jiuYeService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private UserApproveService userApproveService;

    @Reference(version = "1.0.0")
    private ServiceOrgRecordService serviceOrgRecordService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    public final String ADMIN_PREFIX = "/admin/serviceSource/";


    /**
     * 养老服务组织信息显示
     *
     * @return
     */
    @RequestMapping("serviceOrgShow")
    public String showServiceOrg(@RequestParam(value = "areaName", required = false) String areaName,
                                 @RequestParam(value = "grade", required = false) Integer grade,
                                 @RequestParam(value = "socialForce", required = false) String socialForce,
                                 Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
            model.addAttribute("grade", grade);
            model.addAttribute("socialForce", socialForce);
        }
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            return "redirect:/admin/serviceOrgDetail/" + currentUser().getServiceOrgId() + "?method=edit";
        } else {
            return ADMIN_PREFIX + "serviceOrg_list";
        }
    }

    @RequestMapping("statistics")
    public String serviceOrgStatistics(Model model, @RequestParam(value = "areaName", required = false, defaultValue = "") String areaName) {
        boolean flag = false;

        if (!StringUtils.isEmpty(areaName)) {
            Area area = areaService.getAreaByNameFromCache(areaName);
            model.addAttribute("areaId", area.getId());
            if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue()) || getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {
                if (area.getLevel() == 1) {
                    flag = true;
                }
            }
        } else {
            model.addAttribute("areaId", currentUser().getAreaId());
            if (getCurrentUser().hasRole(RoleType.SuAdmin.getValue()) || getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {
                flag = true;
            }
        }
        model.addAttribute("flag", flag);

        return ADMIN_PREFIX + "serviceOrg_statistics1";
    }

    /**
     * 医护服务组织信息
     *
     * @return
     */
    @RequestMapping("serviceOrg/cureList")
    public String showCureServiceOrgs(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }
        return "/admin/health/serviceOrg_cure_list";
    }


    /**
     * 养老服务组织价格体系
     *
     * @return
     */
    @RequestMapping("serviceOrg/price/{id}")
    public String showServiceOrgPrice(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "serviceOrg_price";
    }

    /**
     * 养老服务组织培训记录
     *
     * @return
     */
    @RequestMapping("serviceOrg/train/{id}")
    public String showServiceOrgTrain(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "serviceOrg_train";
    }

    /**
     * 组织定位
     *
     * @return
     */
    @RequestMapping("serviceOrgDetailMap/{id}")
    public String showServiceOrgDetailMap(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "serviceOrg_detail_map";
    }


    /**
     * 养老服务组织信息编辑
     *
     * @param id
     * @return
     */
    @RequestMapping("serviceOrgDetail/{id}")
    public String serviceOrgDetail(@PathVariable("id") Integer id, Model model) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(id);
        Subject currentUser = SecurityUtils.getSubject();
        // 组织管理员不可修改等级 只可申请
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.ZuAdmin.getId());
        }
        // 市级管理员更改3A,4A,5A级
        else if (currentUser.hasRole(RoleType.MuAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.MuAdmin.getId());
        }
        // 区级管理员可更改(1A,)2A级
        else if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.ReAdmin.getId());
        }
        // 超级管理员可更改全部等级
        else if (currentUser.hasRole(RoleType.SuAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.SuAdmin.getId());
        }
        List<Integer> uids = new ArrayList<>();
        UserApprove userApprove = new UserApprove();
        userApprove.setType("组织平台注册");
        List<UserApprove> userApproves = userApproveService.selectPageList(userApprove, new PageRequest()).getData();
        for (UserApprove ua : userApproves) {
            uids.add(ua.getUid());
        }
        if (uids.contains(currentUser().getUid())) {
            model.addAttribute("approve", 1);
        }
        model.addAttribute("m", serviceOrg);
        return ADMIN_PREFIX + "serviceOrg_detail";
    }

    /**
     * 建档照片缩略
     * @param imageUrls
     * @param model
     * @param imageName
     */
    public void imageList(String imageUrls, Model model, String imageName) {
        List<String> imageList = new ArrayList<String>();
        List<String> thumbnailsList = new ArrayList<String>();
        String[] imageUrl = imageUrls.split(",");
        if (!StringUtils.isEmpty(imageUrls)) {
            for (int i = 0; i < imageUrl.length; i++) {
                if (imageUrl[i] != null && imageUrl[i] != "") {
                    imageList.add(imageUrl[i]);
                    //原图
                    String str = imageUrl[i].substring(0,imageUrl[i].lastIndexOf("."))+"_80_80"+ imageUrl[i].substring(imageUrl[i].lastIndexOf("."));

                    thumbnailsList.add(str);
                }
            }
        }
        model.addAttribute(imageName + "s", imageList);
        model.addAttribute(imageName + "thumbnails", thumbnailsList);

    }

    /**
     * 服务组织建档信息
     *
     * @param id
     * @return
     */
    @RequestMapping("serviceOrg/putOnRecord/{id}")
    public String showRecord(@PathVariable("id") Integer id, Model model) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(id);
        ServiceOrgRecord serviceOrgRecord = serviceOrgRecordService.selectByPrimaryKey(id);
        if(serviceOrgRecord != null){
            if(serviceOrgRecord.getHomeBaseAttach() != null && !serviceOrgRecord.getHomeBaseAttach().equals("")){
                imageList(serviceOrgRecord.getHomeBaseAttach(),model,"homeBaseAttach");
                serviceOrgRecord.setHomeBaseAttach(serviceOrgRecord.getHomeBaseAttach());
            }
            if(serviceOrgRecord.getQiYeAttach() != null && !serviceOrgRecord.getQiYeAttach().equals("")){
                imageList(serviceOrgRecord.getQiYeAttach(),model,"qiYeAttach");
                serviceOrgRecord.setQiYeAttach(serviceOrgRecord.getQiYeAttach());
            }
            if(serviceOrgRecord.getFangChanAttach() != null && !serviceOrgRecord.getFangChanAttach().equals("")){
                imageList(serviceOrgRecord.getFangChanAttach(),model,"fangChanAttach");
                serviceOrgRecord.setFangChanAttach(serviceOrgRecord.getFangChanAttach());
            }
            if(serviceOrgRecord.getzFAttach() != null && !serviceOrgRecord.getzFAttach().equals("")){
                imageList(serviceOrgRecord.getzFAttach(),model,"zFAttach");
                serviceOrgRecord.setzFAttach(serviceOrgRecord.getzFAttach());
            }
            if(serviceOrgRecord.getxFAttach() != null && !serviceOrgRecord.getxFAttach().equals("")){
                imageList(serviceOrgRecord.getxFAttach(),model,"xFAttach");
                serviceOrgRecord.setxFAttach(serviceOrgRecord.getxFAttach());
            }
            if(serviceOrgRecord.getsQAttach() != null && !serviceOrgRecord.getsQAttach().equals("")){
                imageList(serviceOrgRecord.getsQAttach(),model,"sQAttach");
                serviceOrgRecord.setsQAttach(serviceOrgRecord.getsQAttach());
            }
            if(serviceOrgRecord.getwSAttach() != null && !serviceOrgRecord.getwSAttach().equals("")){
                imageList(serviceOrgRecord.getwSAttach(),model,"wSAttach");
                serviceOrgRecord.setwSAttach(serviceOrgRecord.getwSAttach());
            }
            if(serviceOrgRecord.getPeopleAttach() != null && !serviceOrgRecord.getPeopleAttach().equals("")){
                imageList(serviceOrgRecord.getPeopleAttach(),model,"peopleAttach");
                serviceOrgRecord.setPeopleAttach(serviceOrgRecord.getPeopleAttach());
            }
            if(serviceOrgRecord.getFwAttach() != null && !serviceOrgRecord.getFwAttach().equals("")){
                imageList(serviceOrgRecord.getFwAttach(),model,"fwAttach");
                serviceOrgRecord.setFwAttach(serviceOrgRecord.getFwAttach());
            }
            HttpServletRequest request = getRequest();
            String scheme = request.getScheme();
            String serverName = request.getServerName();
            String url = scheme+"://"+serverName+":"+"8088";
            model.addAttribute("url", url);
        }
        model.addAttribute("s", serviceOrgRecord);
        model.addAttribute("m", serviceOrg);
        return ADMIN_PREFIX + "serviceOrg_record";
    }

    /**
     * 养老服务组织信息新增
     *
     * @return
     */
    @RequestMapping("serviceOrg/add")
    public String serviceOrgAdd(Model model) {
        return ADMIN_PREFIX + "serviceOrg_add";
    }

    /**
     * 养老服务组织地图显示
     *
     * @return
     */
    @RequestMapping("serviceOrgShow/map")
    public String showServiceOrgMap() {
        return ADMIN_PREFIX + "serviceOrg_map";
    }

    /**
     * 服务老人信息显示
     *
     * @param id
     * @param institutionName
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("serviceElder/{id}")
    public String showServiceElder(@PathVariable("id") Integer id, String institutionName, Model model) throws UnsupportedEncodingException {
        /* String name = new String(institutionName.getBytes("iso-8859-1"), "utf-8");*/
        model.addAttribute("institutionName", institutionName);
        model.addAttribute("serviceOrgId", id);
        return ADMIN_PREFIX + "serviceElder_list";
    }

    /**
     * 服务老人信息新增
     *
     * @param model
     * @return
     */
    @RequestMapping("serviceElderDetail/add/{id}")
    public String addServiceElder(@PathVariable("id") Integer id, Model model, String institutionName) throws UnsupportedEncodingException {
        /*String name = new String(institutionName.getBytes("iso-8859-1"), "utf-8");*/
        model.addAttribute("institutionName", institutionName);
        model.addAttribute("serviceOrgId", id);
        return ADMIN_PREFIX + "serviceElder_detail";
    }

    /**
     * 养老服务组织统计
     *
     * @return
     */
    @RequestMapping("serviceOrgShow/statistics")
    public String showServiceOrgStatistics() {
        return ADMIN_PREFIX + "serviceOrg_statistics";
    }

    /**
     * 养老服务组织统计
     *
     * @return
     */
    @RequestMapping("serviceOrgShow/tab/statistics")
    public String showServiceOrgStatisticsTab() {
        return ADMIN_PREFIX + "serviceOrg_tab_statistics";
    }

    /**
     * 显示床位信息
     *
     * @return
     */
    @RequestMapping("showBedInfo")
    public String showBedInfo() {
        return ADMIN_PREFIX + "bedInfo_list";
    }

    /**
     * 显示政府项目信息
     *
     * @return
     */
    @RequestMapping("showServiceProject")
    public String showServiceProject() {
        return ADMIN_PREFIX + "serviceProject_list";
    }

    /**
     * 显示政府服务信息
     *
     * @return
     */
    @RequestMapping("showGovService")
    public String showGovService() {
        return ADMIN_PREFIX + "govService_list";
    }

    /**
     * 显示居家养老服务组织评估
     *
     * @return
     */
    @RequestMapping("orgAssessShow")
    public String showOrgAssess(Model model,
                                @RequestParam(value = "areaName", required = false) String areaName,
                                @RequestParam(value = "qustandard", required = false) Integer qustandard,
                                @RequestParam(value = "standard", required = false) Integer standard,
                                @RequestParam(value = "gradeDictId", required = false) Integer gradeDictId) {
        Subject currentUser = SecurityUtils.getSubject();
        User user = userService.selectByPrimaryKey(currentUser().getUid());

        model.addAttribute("user", user);

        // 组织管理员且该组织未被添加与未被评估过 可增加
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            String serviceOrgs = user.getServiceOrgId();
            if (serviceOrgs.indexOf(",") < 0) {
                //组织管理员
                ServiceOrgAssessment serviceOrgAssessment = serviceOrgAssessmentService.selectByServiceOrgId(Integer.parseInt(serviceOrgs));
                if (serviceOrgAssessment != null) {
                    if (serviceOrgAssessment.getGradeDictId() < 2) {
                        if (serviceOrgAssessment.getQustandard() != 2) {
                            model.addAttribute("added", 0);
                        } else {
                            model.addAttribute("added", 1);
                        }
                    } else {
                        if (serviceOrgAssessment.getStandard() != 2) {
                            model.addAttribute("added", 0);
                        } else {
                            model.addAttribute("added", 1);
                        }
                    }
                } else {
                    model.addAttribute("added", 0);
                }
                model.addAttribute("roleId", RoleType.ZuAdmin.getId());
            } else {
                //组织群管理员

            }
        }
        // 市级管理员可查看全部列表 审批3A,4A,5A级申报
        else if (currentUser.hasRole(RoleType.MuAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.MuAdmin.getId());
        }
        // 区级管理员可查看本区列表 审批(1A,)2A 初审3A,4A,5A级申报
        else if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.ReAdmin.getId());
        }
        // 超级管理员可查看全部列表 审批全部等级
        else if (currentUser.hasRole(RoleType.SuAdmin.getValue())) {
            model.addAttribute("roleId", RoleType.SuAdmin.getId());
        }
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }

        if (ObjectUtils.isNotNull(qustandard)) {
            model.addAttribute("qustandard", qustandard);
        }

        if (ObjectUtils.isNotNull(standard)) {
            model.addAttribute("standard", standard);
        }

        if (ObjectUtils.isNotNull(gradeDictId)) {
            model.addAttribute("gradeDictId", gradeDictId);
        }

        return ADMIN_PREFIX + "serviceOrg_assess_list";
    }


    /**
     * 查询从业人员补贴人数
     *
     * @return
     */
    @RequestMapping("huiZongShow")
    public String showhuiZong(Model model,
                              @RequestParam(value = "areaName", required = false) String areaName,
                              @RequestParam(value = "qustandard", required = false) Integer qustandard,
                              @RequestParam(value = "standard", required = false) Integer standard,
                              @RequestParam(value = "gradeDictId", required = false) Integer gradeDictId) {
        System.out.println(jiuYeService.selectCountByAreaName(areaName));
        Subject currentUser = SecurityUtils.getSubject();
        JiuYe jiuYe = jiuYeService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("jiuYe", jiuYe);

        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }

        if (ObjectUtils.isNotNull(qustandard)) {
            model.addAttribute("qustandard", qustandard);
        }

        if (ObjectUtils.isNotNull(standard)) {
            model.addAttribute("standard", standard);
        }

        if (ObjectUtils.isNotNull(gradeDictId)) {
            model.addAttribute("gradeDictId", gradeDictId);
        }

        return ADMIN_PREFIX + "serviceOrg_assess_list";
    }

    /**
     * 增加评估信息页面
     *
     * @param method
     * @param model
     * @return
     */
    @RequestMapping("orgAssessAdd")
    public String addOrgAssess(String method, Model model, String roleId, String serviceOrgId) {
        ServiceOrg serviceOrg = null;
        if (!StringUtils.isEmpty(serviceOrgId)) {
            serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(serviceOrgId));
        }
        model.addAttribute("serviceOrg", serviceOrg);
        model.addAttribute("roleId", roleId);
        model.addAttribute("method", method);
        return ADMIN_PREFIX + "serviceOrg_assess_detail";
    }

    /**
     * 养老机构服务质量星级评定标准页面
     *
     * @param method
     * @param model
     * @return
     */
    @RequestMapping("addStarRate")
    public String addStarRate(String method, Model model, String roleId, String serviceOrgId) {
        ServiceOrg serviceOrg = null;
        if (!StringUtils.isEmpty(serviceOrgId)) {
            serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(serviceOrgId));
        }
        model.addAttribute("serviceOrg", serviceOrg);
        model.addAttribute("roleId", roleId);
        model.addAttribute("method", method);
        return ADMIN_PREFIX + "serviceOrg_subsidy_star_add";
    }

    /**
     * 预览评估信息
     *
     * @param id
     * @param model
     * @param method
     * @return
     */
    @RequestMapping("orgAssessDetail/{id}")
    public String orgAssessDetail(HttpServletRequest request, @PathVariable("id") Integer id, Model model, @RequestParam("method") String method, @RequestParam("roleId") String roleId) throws IOException {
        ServiceOrgAssessment serviceOrgAssessment = serviceOrgAssessmentService.selectByPrimaryKey(id);
        imageList(serviceOrgAssessment.getGeneralRequirement(), serviceOrgAssessment.getgThumb(), model, "generalRequirement");
        imageList(serviceOrgAssessment.getQualification(), serviceOrgAssessment.getqThumb(), model, "qualification");
        imageList(serviceOrgAssessment.getBasicFunction(), serviceOrgAssessment.getbThumb(), model, "basicFunction");
        imageList(serviceOrgAssessment.getProjectAndScale(), serviceOrgAssessment.getPasThumb(), model, "projectAndScale");
        imageList(serviceOrgAssessment.getServicePerformance(), serviceOrgAssessment.getSpThumb(), model, "servicePerformance");
        imageList(serviceOrgAssessment.getSecurityAssurance(), serviceOrgAssessment.getsThumb(), model, "securityAssurance");
        imageList(serviceOrgAssessment.getInfrastructure(), serviceOrgAssessment.getiThumb(), model, "infrastructure");
        imageList(serviceOrgAssessment.getPersonnelAllocation(), serviceOrgAssessment.getPaThumb(), model, "personnelAllocation");
        imageList(serviceOrgAssessment.getRegulatoryFramework(), serviceOrgAssessment.getrThumb(), model, "regulatoryFramework");
        imageList(serviceOrgAssessment.getSupervision(), serviceOrgAssessment.getSuThumb(), model, "supervision");

        // 市级登录
        List<Integer> uids1 = new ArrayList<>();

        // 区级登录
        List<Integer> uids2 = new ArrayList<>();
        List<Integer> roleds = new ArrayList<Integer>();
        roleds.add(RoleType.ReAdmin.getId());
        User user = new User();
        user.setAreaName(currentUser().getAreaName());
        uids2 = userService.selectAllUserIdByRoles(new User(), roleds);
        if (uids2.contains(currentUser().getUid())) {
            model.addAttribute("approve", 1);
        }
        model.addAttribute("orgAssess", serviceOrgAssessment);
        model.addAttribute("roleId", roleId);
        model.addAttribute("method", method);
        return ADMIN_PREFIX + "serviceOrg_assess_detail";
    }

    /**
     * 上传组织信息原图与缩略图遍历
     *
     * @param imageUrls
     * @param thumbImageUrls
     * @param model
     * @param imageName
     */
    public void imageList(String imageUrls, String thumbImageUrls, Model model, String imageName) {
        List<String> imageList = new ArrayList<String>();
        List<String> thumbnailsList = new ArrayList<String>();
        String[] imageUrl = imageUrls.split(",");
        String[] thumbImageUrl = thumbImageUrls.split(",");
        if (!StringUtils.isEmpty(imageUrls)) {
            for (int i = 0; i < imageUrl.length; i++) {
                if (imageUrl[i] != null && imageUrl[i] != "") {
                    imageList.add(imageUrl[i]);
                }
            }
        }
        if (!StringUtils.isEmpty(thumbImageUrls)) {
            for (int j = 0; j < thumbImageUrl.length; j++) {
                if (thumbImageUrl[j] != null && thumbImageUrl[j] != "") {
                    thumbnailsList.add(thumbImageUrl[j]);
                }
            }
        }
        model.addAttribute(imageName + "s", imageList);
        model.addAttribute(imageName + "thumbnails", thumbnailsList);

    }

    /**
     * 从业人员汇总统计
     *
     * @return
     */
    @RequestMapping("orgAssess/huiZong")
    public String showOrgAssesshuiZong(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        Integer areaId = 0;
        if (ObjectUtils.isNull(areaName)) {
            areaId = currentUser().getAreaId();
            areaName = currentUser().getAreaName();
        }
        if (ObjectUtils.isNotNull(areaName)) {
            HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
            Set<Integer> ids = hash.keySet();
            for (Integer id : ids) {
                Area area = (Area) hash.get(id);
                if (area.getName().equals(areaName)) {
                    areaId = id;
                    break;
                }
            }
        }
        model.addAttribute("areaId", areaId);
        model.addAttribute("areaName", areaName);
        System.out.println(1);
        return ADMIN_PREFIX + "serviceOrg_assess_huizong";
    }

    /**
     * 评估组织统计
     *
     * @return
     */
    @RequestMapping("orgAssess/statistic")
    public String showOrgAssessStatistic(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        Integer areaId = 0;
        if (ObjectUtils.isNull(areaName)) {
            areaId = currentUser().getAreaId();
            areaName = currentUser().getAreaName();
        }
        if (ObjectUtils.isNotNull(areaName)) {
            HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
            Set<Integer> ids = hash.keySet();
            for (Integer id : ids) {
                Area area = (Area) hash.get(id);
                if (area.getName().equals(areaName)) {
                    areaId = id;
                    break;
                }
            }
        }
        model.addAttribute("areaId", areaId);
        model.addAttribute("areaName", areaName);
        return ADMIN_PREFIX + "serviceOrg_assess_statistic";
    }

    /**
     * 评估组织统计
     *
     * @return
     */
    @RequestMapping("orgAssess/jiuYeHuiZong")
    public String showOrgAssessHuiZong(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        Integer areaId = 0;
        if (ObjectUtils.isNull(areaName)) {
            areaId = currentUser().getAreaId();
            areaName = currentUser().getAreaName();
        }
        if (ObjectUtils.isNotNull(areaName)) {
            HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
            Set<Integer> ids = hash.keySet();
            for (Integer id : ids) {
                Area area = (Area) hash.get(id);
                if (area.getName().equals(areaName)) {
                    areaId = id;
                    break;
                }
            }
        }
        model.addAttribute("areaId", areaId);
        model.addAttribute("areaName", areaName);
        return ADMIN_PREFIX + "serviceOrg_assess_huizong";
    }


    /**
     * 显示组织的绩效考核
     *
     * @return
     */
    @RequestMapping("serviceOrg/performanceAppraisal")
    public String showPerformanceAppraisal() {
        return ADMIN_PREFIX + "serviceOrg_performance_appraisal";
    }

    /**
     * 显示组织的绩效考核
     *
     * @return
     */
    @RequestMapping("serviceOrg/{id}/task/list")
    public String showTaskList(@PathVariable Integer id, Model model) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(id);
        model.addAttribute("serviceOrg", serviceOrg);
        return ADMIN_PREFIX + "serviceOrg_task_list";
    }

    /**
     * @return
     */
    @RequestMapping("orgAssess/showData/{areaId}")
    public String showData(@PathVariable("areaId") Integer areaId, Model model) {
        model.addAttribute("value", areaId);
        return ADMIN_PREFIX + "serviceOrg_assess_huizong";
    }


    /**
     * 评价列表
     *
     * @param type
     * @param model
     * @return
     */
    @RequestMapping("serviceOrg/comment/list")
    public String showCommentList(@RequestParam("type") Integer type, Model model) {
        model.addAttribute("type", type);
        return ADMIN_PREFIX + "service_org_comment_list";

    }


}
