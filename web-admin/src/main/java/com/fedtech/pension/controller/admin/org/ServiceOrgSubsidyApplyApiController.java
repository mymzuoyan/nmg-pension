package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.entity.ElderlyOperatingSubsidies;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.elderly.service.ElderlyOperatingSubsidiesService;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.quantity.ServiceOrgSubsidyApplyQuantity;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.org.vo.ServiceOrgSubsidyApplyStatistic;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author gengqiang&miaoyueming
 * @date 2018/1/22
 */
@Controller
@RequestMapping("/admin/api/serviceOrg/subsidy/")
public class ServiceOrgSubsidyApplyApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ServiceOrgSubsidyApplyService serviceOrgSubsidyApplyService;


    @Reference(version = "1.0.0")
    private StarRatingOfInstitutionsService starRatingOfInstitutionsService;

    @Reference(version = "1.0.0")
    private ServiceOrgConstructionSubApplyService serviceOrgConstructionSubApplyService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerCourtyardInformationService serviceOrgTowerCourtyardInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgFloorInformationService serviceOrgFloorInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerRoomInformationService serviceOrgTowerRoomInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgBedsInformationService serviceOrgBedsInformationService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyService serviceOrgElderlyService ;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private ElderlyOperatingSubsidiesService elderlyOperatingSubsidiesService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;







   

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    public final String ADMIN_PREFIX = "/admin/serviceSource/";


    /**
     * 申请
     *
     * @param apply
     * @return
     */
    @RequestMapping("apply")
    @ResponseBody
    public JsonResult applySubsidy(ServiceOrgSubsidyApply apply) {
        JsonResult result = new JsonResult();
        apply.setCreateTime(new Date());
        apply.setCreator(currentUser());
        apply.setStatus(ServiceOrgSubsidyApplyQuantity.DAISEHNGHE);
        if (serviceOrgSubsidyApplyService.insert(apply)) {
            result.markSuccess("申请成功", null);
        } else {
            result.markError("申请失败");
        }
        return result;
    }

    /**
     * 建设补贴申请新增
     *
     * @return
     */
    @RequestMapping("mechanismAdd")
    public String mechanismAdd(Model model) {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            //model.addAttribute("serviceOrgId", currentUser().getServiceOrgId());
            ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(Integer.parseInt(currentUser().getServiceOrgId()));
            //开业时间
            model.addAttribute("beginTime", serviceOrg.getBeginTime());
            //法定代表人
            model.addAttribute("legalRepresentatives", serviceOrg.getLegalRepresentatives());
            //联系方式
            model.addAttribute("mobile", serviceOrg.getMobile());
            //组织机构代码
            model.addAttribute("orgCode", serviceOrg.getOrgCode());
            //通讯地址
            model.addAttribute("address", serviceOrg.getAddress());
            //建筑面积
            model.addAttribute("landArea", serviceOrg.getLandArea());
            //建筑面积
            model.addAttribute("landArea", serviceOrg.getLandArea());
            //机构星级
            model.addAttribute("starClass",serviceOrg.getStarClass());
            //总床位数
            Integer bedNums = 0;
            //补贴金额
            Integer money=0;
            //入住月数
            Integer monthNum=13;

            List<ServiceOrgTowerCourtyardInformation> serviceOrgTowerCourtyardInformations = serviceOrgTowerCourtyardInformationService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            for (ServiceOrgTowerCourtyardInformation serviceOrgTowerCourtyardInformation : serviceOrgTowerCourtyardInformations) {
                Integer bedNum = serviceOrgTowerCourtyardInformation.getBedNum();
                bedNums += bedNum;
            }
            model.addAttribute("bedNums", bedNums);
            //管理人员个数
            Integer managerPersonalNums = 0;
            //服务人员个数
            Integer servicePersonalNums = 0;
            //其他人员个数
            Integer elsePersonalNums = 0;
            List<UserFuWu> userFuWus = userFuwuService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));


            for (UserFuWu fuWus : userFuWus) {
                //从业人员入职时间
                Date entryTime = fuWus.getEntryTime();
                String format = df.format(entryTime);
                String userTime = format.substring(0, 4);

                //去年时间设置
                Calendar instance = Calendar.getInstance();
                instance.setTime(new Date());
                instance.add(Calendar.YEAR, -1);
                Date y = instance.getTime();
                //去年时间
                String year = df.format(y).substring(0, 4);
                if(userTime.equals(year)) {
                    Integer userType = fuWus.getUserType();
                    if (userType == 7) {
                        managerPersonalNums++;
                    }
                    if (userType == 8) {
                        servicePersonalNums++;
                    }
                    if (userType == 9) {
                        elsePersonalNums++;
                    }
                }
            }
            model.addAttribute("managerPersonalNums", managerPersonalNums);
            model.addAttribute("servicePersonalNums", servicePersonalNums);
            model.addAttribute("elsePersonalNums", elsePersonalNums);
            //职工总数
            Integer total = managerPersonalNums + servicePersonalNums + elsePersonalNums;
            model.addAttribute("total", total);
            //老人数
            Integer extremelyPoorElderly = 0;
            //老人ID
            String elderlyId="";
            //申请补贴床次数1-12月
            Integer bedNum1 = 0;
            Integer bedNum2 = 0;
            Integer bedNum3 = 0;
            Integer bedNum4 = 0;
            Integer bedNum5 = 0;
            Integer bedNum6 = 0;
            Integer bedNum7 = 0;
            Integer bedNum8 = 0;
            Integer bedNum9 = 0;
            Integer bedNum10 = 0;
            Integer bedNum11 = 0;
            Integer bedNum12 = 0;
            User user = userService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            List<ServiceOrgElderly> serviceOrgElderlies = serviceOrgElderlyService.selectByServiceOrgId(user.getUid());
            for (ServiceOrgElderly serviceOrgElderly : serviceOrgElderlies) {
                ElderlyOperatingSubsidies elderlyOperatingSubsidies = new ElderlyOperatingSubsidies();

                //年度设置老人入院时间
                Date checkInTimes = serviceOrgElderly.getCheckInTime();
                String inTimes = df.format(checkInTimes);
                String inMonths = inTimes.substring(0, 4);


                //去年时间设置
                Calendar c = Calendar.getInstance();
                c.setTime(new Date());
                c.add(Calendar.YEAR, -1);
                Date y = c.getTime();
                //去年时间
                String year = df.format(y).substring(0, 4);

                if (inMonths.equals(year)) {

                if (serviceOrgElderly.getOperatingSubsidies() == 1 && serviceOrgElderly.getCheckOutTime() == null) {

                    extremelyPoorElderly++;
                    elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";

                    Date checkInTime = serviceOrgElderly.getCheckInTime();
                    String inTime = df.format(checkInTime);
                    String inMonth = inTime.substring(5, 7);
                    //老人入住月数
                    Integer monthNums=monthNum-Integer.parseInt(inMonth);
                    Integer starClass = serviceOrg.getStarClass();
                    if(starClass!=null){
                        if(starClass==5){
                            money+=monthNums*165;
                        }
                        if(starClass==4){
                            money+=monthNums*145;
                        }
                        if(starClass==3){
                            money+=monthNums*125;
                        }
                        if(starClass==2){
                            money+=monthNums*105;
                        }
                        if(starClass==1){
                            money+=monthNums*85;
                        }
                    }

                    if (inMonth.equals("01")) {
                        bedNum1++;
                    }
                    if (inMonth.equals("02")) {
                        bedNum2++;
                    }
                    if (inMonth.equals("03")) {
                        bedNum3++;
                    }
                    if (inMonth.equals("04")) {
                        bedNum4++;
                    }
                    if (inMonth.equals("05")) {
                        bedNum5++;
                    }
                    if (inMonth.equals("06")) {
                        bedNum6++;
                    }
                    if (inMonth.equals("07")) {
                        bedNum7++;
                    }
                    if (inMonth.equals("08")) {
                        bedNum8++;
                    }
                    if (inMonth.equals("09")) {
                        bedNum9++;
                    }
                    if (inMonth.equals("10")) {
                        bedNum10++;
                    }
                    if (inMonth.equals("11")) {
                        bedNum11++;
                    }
                    if (inMonth.equals("12")) {
                        bedNum12++;
                    }
                }
                if (serviceOrgElderly.getOperatingSubsidies() == 1 && serviceOrgElderly.getCheckOutTime() != null) {

                    Date checkInTime = serviceOrgElderly.getCheckInTime();
                    String inTime = df.format(checkInTime);
                    String inMonth = inTime.substring(5, 7);
                    String inYear = inTime.substring(0, 4);


                    Date checkOutTime = serviceOrgElderly.getCheckOutTime();
                    String outTime = df.format(checkOutTime);
                    String outmonth = outTime.substring(5, 7);
                    String outYear = outTime.substring(0, 4);

                    if (inYear.equals(outYear) ) {
                        Integer starClass = serviceOrg.getStarClass();
                        Integer month =Integer.parseInt(outmonth)-Integer.parseInt(inMonth);
                        if (inMonth.equals("01") && !outmonth.equals("01")) {
                            extremelyPoorElderly++;
                            bedNum1++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }

                        }
                        if (inMonth.equals("02") && !outmonth.equals("02")) {
                            extremelyPoorElderly++;
                            bedNum2++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("03") && !outmonth.equals("03")) {
                            extremelyPoorElderly++;
                            bedNum3++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("04") && !outmonth.equals("04")) {
                            extremelyPoorElderly++;
                            bedNum4++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("05") && !outmonth.equals("05")) {
                            extremelyPoorElderly++;
                            bedNum5++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("06") && !outmonth.equals("06")) {
                            extremelyPoorElderly++;
                            bedNum6++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("07") && !outmonth.equals("07")) {
                            extremelyPoorElderly++;
                            bedNum7++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("08") && !outmonth.equals("08")) {
                            extremelyPoorElderly++;
                            bedNum8++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("09") && !outmonth.equals("09")) {
                            extremelyPoorElderly++;
                            bedNum9++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("10") && !outmonth.equals("10")) {
                            extremelyPoorElderly++;
                            bedNum10++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("11") && !outmonth.equals("11")) {
                            extremelyPoorElderly++;
                            bedNum11++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                        if (inMonth.equals("12") && !outmonth.equals("12")) {
                            extremelyPoorElderly++;
                            bedNum12++;
                            elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";
                            if(starClass!=null){
                                if(starClass==5){
                                    money+=month*165;
                                }
                                if(starClass==4){
                                    money+=month*145;
                                }
                                if(starClass==3){
                                    money+=month*125;
                                }
                                if(starClass==2){
                                    money+=month*105;
                                }
                                if(starClass==1){
                                    money+=month*85;
                                }
                            }
                        }
                    }
                    if (!inYear.equals(outYear) ) {

                        extremelyPoorElderly++;
                        elderlyId+=serviceOrgElderly.getElderlyMsg().getId()+",";

                        //老人入住月数
                        Integer monthNums=monthNum-Integer.parseInt(inMonth);
                        Integer starClass = serviceOrg.getStarClass();
                        if(starClass!=null){
                            if(starClass==5){
                                money+=monthNums*165;
                            }
                            if(starClass==4){
                                money+=monthNums*145;
                            }
                            if(starClass==3){
                                money+=monthNums*125;
                            }
                            if(starClass==2){
                                money+=monthNums*105;
                            }
                            if(starClass==1){
                                money+=monthNums*85;
                            }
                        }
                        if (inMonth.equals("01")) {
                            bedNum1++;
                        }
                        if (inMonth.equals("02")) {
                            bedNum2++;
                        }
                        if (inMonth.equals("03")) {
                            bedNum3++;
                        }
                        if (inMonth.equals("04")) {
                            bedNum4++;
                        }
                        if (inMonth.equals("05")) {
                            bedNum5++;
                        }
                        if (inMonth.equals("06")) {
                            bedNum6++;
                        }
                        if (inMonth.equals("07")) {
                            bedNum7++;
                        }
                        if (inMonth.equals("08")) {
                            bedNum8++;
                        }
                        if (inMonth.equals("09")) {
                            bedNum9++;
                        }
                        if (inMonth.equals("10")) {
                            bedNum10++;
                        }
                        if (inMonth.equals("11")) {
                            bedNum11++;
                        }
                        if (inMonth.equals("12")) {
                            bedNum12++;
                        }
                    }
                }
            }
        }
            model.addAttribute("extremelyPoorElderly", extremelyPoorElderly);
            model.addAttribute("elderlyId", elderlyId);
            model.addAttribute("bedNum1", bedNum1);
            model.addAttribute("bedNum2", bedNum2);
            model.addAttribute("bedNum3", bedNum3);
            model.addAttribute("bedNum4", bedNum4);
            model.addAttribute("bedNum5", bedNum5);
            model.addAttribute("bedNum6", bedNum6);
            model.addAttribute("bedNum7", bedNum7);
            model.addAttribute("bedNum8", bedNum8);
            model.addAttribute("bedNum9", bedNum9);
            model.addAttribute("bedNum10", bedNum10);
            model.addAttribute("bedNum11", bedNum11);
            model.addAttribute("bedNum12", bedNum12);
            model.addAttribute("money", money);

            //床位总数
            Integer bedNum=bedNum1+bedNum2+bedNum3+bedNum4+bedNum5+bedNum6+bedNum7+bedNum8+bedNum9+bedNum10+bedNum11+bedNum12;
            model.addAttribute("bedNum", bedNum);
            // 特困老人和其他总数
            Integer totalElderAndOther=extremelyPoorElderly;
            model.addAttribute("totalElderAndOther", totalElderAndOther);
        }

        return ADMIN_PREFIX + "mechanismAdd";
    }

    /**
     * 列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<ServiceOrgSubsidyApply> getList(ServiceOrgSubsidyApply filter, PageRequest pageRequest,
                                                        @RequestParam(value = "startDateString", required = false) String startDateString,
                                                        @RequestParam(value = "endDateString", required = false) String endDateString) {

        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            filter.setAreaName(currentUser().getAreaName());
        }
        try {
            if (!StringUtils.isEmpty(startDateString)){
                filter.setStartDate(df.parse(startDateString));
            }
            if(!StringUtils.isEmpty(endDateString)){
                filter.setEndDate(df.parse(endDateString));
            }
        } catch (ParseException e) {
            logger.error("时间转换异常");
            e.printStackTrace();
        }
        return serviceOrgSubsidyApplyService.selectPageList(filter, pageRequest);
    }

    /**
     * 建设补助申请列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("mechanismList")
    @ResponseBody
    public PageResponse<ServiceOrgConstructionSubsidyApply> getMechanismList(ServiceOrgConstructionSubsidyApply filter, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            filter.setAreaName(currentUser().getAreaName());
        }
        return serviceOrgConstructionSubApplyService.selectPageList(filter, pageRequest);
    }



    /**
     * 新增建设补助申请
     *
     * @param serviceOrgConstructionSubsidyApply
     * @return
     * @throws ParseException
     */
    @RequestMapping("addMechanisam")
    @ResponseBody
    public JsonResult addMechanisam(ServiceOrgConstructionSubsidyApply serviceOrgConstructionSubsidyApply) throws ParseException {
        JsonResult result = new JsonResult();
        ServiceOrgConstructionSubsidyApply serviceOrgConstructionSubsidyApply1 = serviceOrgConstructionSubApplyService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        if(serviceOrgConstructionSubsidyApply1==null){
            serviceOrgConstructionSubsidyApply.setStatus("0");
            serviceOrgConstructionSubsidyApply.setCityStatus("0");
            serviceOrgConstructionSubsidyApply.setAreaStaus("0");
        if (serviceOrgConstructionSubApplyService.insert(serviceOrgConstructionSubsidyApply)) {
            String elderlyIds = serviceOrgConstructionSubsidyApply.getElderlyId();
            String[] split = elderlyIds.split(",");
            for (int i = 0; i < split.length; i++) {
                ElderlyOperatingSubsidies elderlyOperatingSubsidies = new ElderlyOperatingSubsidies();
                ServiceOrgElderly serviceOrgElderly = serviceOrgElderlyService.selectByElderlyId(Integer.parseInt(split[i]));
                ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(Integer.parseInt(split[i]));
                elderlyOperatingSubsidies.setEldername(elderlyMsg.getElderName());
                if(elderlyMsg.getDeathTime()!=null){
                    elderlyOperatingSubsidies.setState(df.format(elderlyMsg.getDeathTime()));
                }
                elderlyOperatingSubsidies.setBirthday(elderlyMsg.getBirthday());
                elderlyOperatingSubsidies.setSexdictid(elderlyMsg.getSexDictId());
                elderlyOperatingSubsidies.setRealaddress(elderlyMsg.getRealAddress());
                elderlyOperatingSubsidies.setIdcardno(elderlyMsg.getIdcardno());
                elderlyOperatingSubsidies.setMobile(elderlyMsg.getMobile());
                elderlyOperatingSubsidies.setCheckInTime(df.format(serviceOrgElderly.getCheckInTime()));
                if(serviceOrgElderly.getCheckOutTime()!=null){
                    elderlyOperatingSubsidies.setCheckOutTime(df.format(serviceOrgElderly.getCheckOutTime()));
                }

                elderlyOperatingSubsidies.setServiceorgname(serviceOrgConstructionSubsidyApply.getServiceOrgName());

                elderlyOperatingSubsidies.setInsconsuid(serviceOrgConstructionSubApplyService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId())).getId());

                elderlyOperatingSubsidiesService.insert(elderlyOperatingSubsidies);

            }

            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        }else{
          /*  serviceOrgConstructionSubsidyApply.setId(serviceOrgConstructionSubsidyApply1.getId());
           if( serviceOrgConstructionSubApplyService.updateByPrimaryKeySelective(serviceOrgConstructionSubsidyApply)){
               result.markSuccess("更新成功", null);
           }else{
               result.markError("更新失败");
           }*/
            result.markSuccess("该机构运营补贴已申请", null);
        }
        return result;
    }

    /**
     * 更新建设补助申请
     *
     * @param serviceOrgConstructionSubsidyApply
     * @return
     * @throws ParseException
     */
    @RequestMapping("updateMechanisam")
    @ResponseBody
    public JsonResult updateMechanisam(ServiceOrgConstructionSubsidyApply serviceOrgConstructionSubsidyApply) throws ParseException {
        JsonResult result = new JsonResult();
        Integer total = Integer.parseInt(serviceOrgConstructionSubsidyApply.getManagement())+ Integer.parseInt(serviceOrgConstructionSubsidyApply.getServicePersonal())
                + Integer.parseInt(serviceOrgConstructionSubsidyApply.getOtherPersonal());
        Integer totalElderAndOther = Integer.parseInt(serviceOrgConstructionSubsidyApply.getExtremelyPoorElderly()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getOther());
        serviceOrgConstructionSubsidyApply.setTotalElderAndOther(totalElderAndOther + "");
        serviceOrgConstructionSubsidyApply.setTotal(total + "");
        Integer bedNum = Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum1()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum2())
                + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum3()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum4())
                + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum5()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum6())
                + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum7()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum8())
                + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum9()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum10())
                + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum11()) + Integer.parseInt(serviceOrgConstructionSubsidyApply.getBedNum12());
        serviceOrgConstructionSubsidyApply.setBedNum(bedNum + "");
        if (serviceOrgConstructionSubApplyService.updateByPrimaryKeySelective(serviceOrgConstructionSubsidyApply)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 机构服务质量星级评定列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("starList")
    @ResponseBody
    public PageResponse<StarRatingOfInstitutions> getStarList(StarRatingOfInstitutions filter, PageRequest pageRequest,
                                                              @RequestParam(value = "startDateString", required = false) String startDateString,
                                                              @RequestParam(value = "endDateString", required = false) String endDateString) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            filter.setAreaName(currentUser().getAreaName());
        }
        if(filter.getType() != null && filter.getType() == 1){
            filter.setListDetail(0);
        } else {
            filter.setListDetail(1);
        }
        try {
            if (!StringUtils.isEmpty(startDateString)){
                filter.setStartDate(df.parse(startDateString));
            }
            if(!StringUtils.isEmpty(endDateString)){
                filter.setEndDate(df.parse(endDateString));
            }
        } catch (ParseException e) {
            logger.error("时间转换异常");
            e.printStackTrace();
        }
        return starRatingOfInstitutionsService.selectPageList(filter, pageRequest);
    }


    /**
     * 审核
     *
     * @param apply
     * @return
     */
    @RequestMapping("verify")
    @ResponseBody
    public JsonResult verify(ServiceOrgSubsidyApply apply) {
        JsonResult result = new JsonResult();
        apply.setVerifyTime(new Date());
        apply.setVerifyer(currentUser());
        if (serviceOrgSubsidyApplyService.updateByPrimaryKeySelective(apply)) {
            result.markSuccess("审核成功", null);
        } else {
            result.markError("审核失败");
        }
        return result;
    }


    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public JsonResult delete(Integer id) {
        JsonResult result = new JsonResult();
        if (serviceOrgSubsidyApplyService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;

    }

    /**
     * 删除建设补助申请
     *
     * @param id
     * @return
     */
    @RequestMapping("delMechanismInfo")
    @ResponseBody
    public JsonResult delMechanismInfo(Integer id) {
        JsonResult result = new JsonResult();
        Integer insConSuId=id;
        if (serviceOrgConstructionSubApplyService.deleteByPrimaryKey(id)) {
           elderlyOperatingSubsidiesService.delByInsConSuld(insConSuId);

            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;

    }

    /**
     * 审核建设补助申请
     * @return
     */
    @RequestMapping(value = "examine", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "审核建设补助申请")
    public JsonResult examine(ServiceOrgConstructionSubsidyApply serviceOrgConstructionSubsidyApply ,String statusNum) {
        JsonResult result = new JsonResult();

        serviceOrgConstructionSubsidyApply = serviceOrgConstructionSubApplyService.selectByPrimaryKey(serviceOrgConstructionSubsidyApply.getId());

        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())) {

            if(serviceOrgConstructionSubsidyApply.getCityStatus().equals("1")){
                result.markSuccess("市级已审核通过", null);

            }else {
                serviceOrgConstructionSubsidyApply.setAreaStaus(statusNum);
                if(statusNum.equals("1")){
                    //区级审核通过
                    serviceOrgConstructionSubsidyApply.setStatus("1");
                }
                if(statusNum.equals("2")){
                    //区级审核未通过
                    serviceOrgConstructionSubsidyApply.setStatus("2");
                }
                if (serviceOrgConstructionSubApplyService.updateByPrimaryKeySelective(serviceOrgConstructionSubsidyApply)) {

                    result.markSuccess("区级审核建设补助申请成功", null);
                } else {
                    result.markError("区级审核建设补助申请失败");
                }
            }
        }
        if (getCurrentUser().hasRole(RoleType.MuAdmin.getValue())) {

            if(serviceOrgConstructionSubsidyApply.getAreaStaus().equals("0") || serviceOrgConstructionSubsidyApply.getAreaStaus().equals("2")){
                result.markSuccess("区级未审核通过", null);
            }else{
                serviceOrgConstructionSubsidyApply.setCityStatus(statusNum);
                if(statusNum.equals("1")){
                    //市级审核通过
                    serviceOrgConstructionSubsidyApply.setStatus("3");
                }
                if(statusNum.equals("2")){
                    //市级审核未通过
                    serviceOrgConstructionSubsidyApply.setStatus("4");
                }
                if (serviceOrgConstructionSubApplyService.updateByPrimaryKeySelective(serviceOrgConstructionSubsidyApply)) {

                    result.markSuccess("市级审核建设补助申请成功", null);
                } else {
                    result.markError("市级审核建设补助申请失败");
                }

            }
        }


        return result;
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping("deleteStarRate")
    @ResponseBody
    public JsonResult deleteStarRate(Integer id) {
        JsonResult result = new JsonResult();
        if (starRatingOfInstitutionsService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;

    }


    /**
     * 数据统计
     *
     * @param query
     * @return
     */
    @RequestMapping("getStatistics")
    @ResponseBody
    public JsonResult getStatistics(ServiceOrgSubsidyApplyStatistic query) {
        JsonResult result = new JsonResult();
        if (StringUtils.isEmpty(query.getAreaId())) {
            query.setAreaId(currentUser().getAreaId());
        }
        result.markSuccess("数据统计", serviceOrgSubsidyApplyService.getStatistics(query));
        return result;
    }



    @RequestMapping("showServiceOrgId1")
    @ResponseBody
    public String showServiceOrgId1() {
        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())||getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgId=currentUser().getServiceOrgId();
        }
        return serviceOrgId;
    }

    @RequestMapping("showServiceOrgId2")
    @ResponseBody
    public String showServiceOrgId2() {
        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())||getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgId=currentUser().getServiceOrgId();
        }
        return serviceOrgId;
    }




    /**
     *
     * 运营补贴老人信息列表
     *
     *
     *
     * @param elderlyOperatingSubsidies
     * @param pageRequest
     * @return
     */
    @RequestMapping("elderlyOperatingSubsidiesInf")
    @ResponseBody
    @SystemControllerLog(description = "运营补贴老人信息列表")
    public PageResponse<ElderlyOperatingSubsidies> getElderlyOperatingSubsidiesList(ElderlyOperatingSubsidies elderlyOperatingSubsidies, PageRequest pageRequest,Integer operatingSubsidiesElderlyId) {

        elderlyOperatingSubsidies.setInsconsuid(operatingSubsidiesElderlyId);
        PageResponse<ElderlyOperatingSubsidies> dataTable = elderlyOperatingSubsidiesService.selectPageList(elderlyOperatingSubsidies, pageRequest);
        return dataTable;
    }



    /**
     * 导出运营补贴申请列表
     *
     * @param filter
     * @return
     */
    @RequestMapping("export")
    @SystemControllerLog(description = "导出运营补贴申请列表")
    public void export(ServiceOrgConstructionSubsidyApply filter, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {

        List<ServiceOrgConstructionSubsidyApply> serviceOrgConstructionSubsidyApply = serviceOrgConstructionSubApplyService.getAllRecode(filter);
        response.setContentType("octets/stream");
        String fileName = "运营补贴申请列表.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<ServiceOrgConstructionSubsidyApply> ex = new ExportExcel<>();
        String[] headers = {"机构名称", "详细地址", "联系电话", "申请补贴床位数", "入住老人数", "星级"};
        String[] fieldNames = {"serviceOrgName", "address", "mobile", "bedNum", "totalElderAndOther", "starClass"};
        ex.exportExcel(fileName, headers, fieldNames, serviceOrgConstructionSubsidyApply, out, "yyyy-MM-dd");
        out.close();

    }

}
