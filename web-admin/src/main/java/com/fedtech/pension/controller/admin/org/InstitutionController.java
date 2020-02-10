package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgRecord;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.service.ServiceOrgElderlyService;
import com.fedtech.pension.org.service.ServiceOrgRecordService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.org.service.StarRatingOfInstitutionsService;
import com.fedtech.pension.sys.entity.UserApprove;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserApproveService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.fedtech.web.utils.Servlets.getRequest;

/**
 * @author gengqiang
 * @date 2017/8/15
 */
@Controller
@RequestMapping("/admin/institution/")
public class InstitutionController extends BaseController {
    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyService serviceOrgElderlyService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private StarRatingOfInstitutionsService starRatingOfInstitutionsService;

    @Reference(version = "1.0.0")
    private ServiceOrgRecordService serviceOrgRecordService;

    @Reference(version = "1.0.0")
    private UserApproveService userApproveService;

    public final String ADMIN_PREFIX = "/admin/serviceSource/";





    /**
     * 养老机构列表显示
     *
     * @return
     */
    @RequestMapping("list")
    public String showInstitutions(@RequestParam(value = "areaName", required = false) String areaName, Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        if (ObjectUtils.isNotNull(areaName)) {
            model.addAttribute("areaName", areaName);
        }
       if (currentUser.hasRole(RoleType.JgAdmin.getValue())) {
           return "redirect:/admin/institution/detail/" + currentUser().getServiceOrgId();
       } else {
          return ADMIN_PREFIX + "institution_list";
       }
    }


    /**
     * 养老机构信息查看或修改
     *
     * @param id
     * @return
     */
    @RequestMapping("detail/{id}")
    public String institutionDetail(@PathVariable("id") Integer id, Model model) {
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(id);
        StarRatingOfInstitutions starRatingOfInstitutions = starRatingOfInstitutionsService.selectByServiceOrgId(id);
        if(starRatingOfInstitutions != null) {
            serviceOrg.setStarClass(starRatingOfInstitutions.getStarClass());
        }
        Subject currentUser = SecurityUtils.getSubject();
        // 组织管理员不可修改等级 只可申请
        if (currentUser.hasRole(RoleType.JgAdmin.getValue())) {
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
        return ADMIN_PREFIX + "institution_detail";
    }

    /**
     * 养老机构建档信息
     *
     * @param id
     * @return
     */
    @RequestMapping("putOnRecord/{id}")
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
        return ADMIN_PREFIX + "institution_record";
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
     * 机构定位
     *
     * @return
     */
    @RequestMapping("map/{id}")
    public String showInstitutionMap(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "institution_detail_map";
    }

    /**
     * 养老机构地图显示
     *
     * @return
     */
    @RequestMapping("map")
    public String showInstitutionsMap() {
        return ADMIN_PREFIX + "institution_map";
    }

    /**
     * 养老院服务质量自查检查
     *
     * @return
     */
    @RequestMapping("{id}/nursingHomeServiceCheck")
    public String showServiceCheck(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "nursing_home_service_check";
    }

    /**
     * 养老机构信息新增
     *
     * @return
     */
    @RequestMapping("add")
    public String addInstitution() {
        return ADMIN_PREFIX + "institution_add";
    }


    /**
     * 养老机构组织统计
     *
     * @return
     */
    @RequestMapping("statistics")
    public String showInstitutionStatistics() {
        return ADMIN_PREFIX + "institution_statistics";
    }


    /**
     * 机构入住老人
     *
     * @return
     */
    @RequestMapping("{id}/elderly/list")
    public String showInstitutionDetailElderly(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "institution_detail_elderly_list";
    }

    /**
     * 所有入住老人
     *
     * @return
     */
    @RequestMapping("elderly/list")
    public String showInstitutionElderly(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
        }
        return ADMIN_PREFIX + "institution_elderly_list";
    }

    /**
     * 增加入院
     */
    @RequestMapping("elderly/add1")
    public String add1(Model model, ServiceOrgElderly serviceOrgElderly) {

        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(currentUser().getServiceOrgId()));
        String orgCode = serviceOrg.getOrgCode();
        model.addAttribute("orgCode", orgCode);
        return ADMIN_PREFIX + "institution_elderly_add1";
    }

    /**
     * 增加出院
     */
    @RequestMapping("elderly/add2")
    public String add2(Model model, ServiceOrgElderly serviceOrgElderly) {
        model.addAttribute("soe", serviceOrgElderly);
        return ADMIN_PREFIX + "institution_elderly_add2";
    }

    /**
     * 增加详情页面的入院
     */
    @RequestMapping("elderly/detailAddIn/{id}")
    public String addIn(@PathVariable("id") Integer id, Model model, ServiceOrgElderly serviceOrgElderly) {
        model.addAttribute("soe", serviceOrgElderly);
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "institution_detail_elderly_addIn";
    }

    /**
     * 增加详情页面的出院
     */
    @RequestMapping("elderly/detailAddOut/{id}")
    public String addOut(@PathVariable("id") Integer id, Model model, ServiceOrgElderly serviceOrgElderly) {
        model.addAttribute("soe", serviceOrgElderly);
        model.addAttribute("id", id);
        return ADMIN_PREFIX + "institution_detail_elderly_addOut";
    }

    /**
     * 修改
     */
    @RequestMapping("elderly/update/{id}")
    public String update(@PathVariable("id") Integer id, Model model) {
        String flag = "";
        ServiceOrgElderly serviceOrgElderly = serviceOrgElderlyService.selectByPrimaryKey(id);
        Date date = serviceOrgElderly.getCheckInTime();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String checkInTime = df.format(date);
        Date checkOut = serviceOrgElderly.getCheckOutTime();
        String checkOutTime=null;
        if(checkOut!=null){
             checkOutTime = df.format(checkOut);
        }

        if (!StringUtils.isEmpty(serviceOrgElderly.getCheckInTime())) {
            model.addAttribute("soe", serviceOrgElderly);
            model.addAttribute("checkInTime", checkInTime);
            model.addAttribute("checkOutTime", checkOutTime);
            flag = ADMIN_PREFIX + "institution_elderly_edit1";
        } else if (!StringUtils.isEmpty(serviceOrgElderly.getCheckOutTime())) {
            model.addAttribute("soe", serviceOrgElderly);
            flag = ADMIN_PREFIX + "institution_elderly_edit2";
        }
        return flag;
    }


    /**
     * 机构监护之实时报警页面
     *
     * @return
     */
    @RequestMapping("realTimeAlarm")
    public String showRealTimeAlarm() {
        return ADMIN_PREFIX + "realTimeAlarm";
    }


    /**
     * 机构监护之实时报警详情页面
     *
     * @return
     */
    @RequestMapping("realTimeAlarm/detail")
    public String showRealTimeAlarmDetail() {
        return ADMIN_PREFIX + "realTimeAlarm_detail";
    }

    /**
     * 实时报警之自助报警页面
     *
     * @return
     */
    @RequestMapping("selfServiceAlarm")
    public String showSelfServiceAlarm() {
        return ADMIN_PREFIX + "self_ServiceAlarm";
    }

    /**
     * 实时报警之自助报警详情页面
     *
     * @return
     */
    @RequestMapping("selfServiceAlarm/detail")
    public String showSelfServiceAlarmDetail() {
        return ADMIN_PREFIX + "self_ServiceAlarm_detail";
    }

    /**
     * 实时报警之自助报警详情页面
     *
     * @return
     */
    @RequestMapping("selfServiceAlarm/details")
    public String showSelfServiceAlarmDetails() {
        return ADMIN_PREFIX + "self_ServiceAlarm_details";
    }

}
