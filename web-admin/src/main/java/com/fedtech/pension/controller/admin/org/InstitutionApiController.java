package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcelUtil;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.power.entity.OldManCard;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.UserService;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.fedtech.commons.utils.ExportExcelUtil.getCellValue;

/**
 * @author gengqiang
 * @date 2017/8/15
 */
@Controller
@RequestMapping("/admin/api/institution/")
public class InstitutionApiController extends BaseController {

    @Reference(version = "1.0.0", timeout = 600000, retries = 0)
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private ServiceOrgElderlyService serviceOrgElderlyService;

    @Reference(version = "1.0.0")
    private StarRatingOfInstitutionsService starRatingOfInstitutionsService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private ServiceOrgTowerRoomInformationService serviceOrgTowerRoomInformationService;

    @Reference(version = "1.0.0")
    private ServiceOrgBedsInformationService serviceOrgBedsInformationService;


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 养老机构信息列表(包含经纬度信息)
     * （缓存）
     *
     * @param serviceOrgLocation
     * @return
     */
    @RequestMapping("/all")
    @ResponseBody
    public List<ServiceOrgLocation> serviceOrgLocationCache(ServiceOrgLocation serviceOrgLocation) {
        return serviceOrgLocationService.serviceOrgLocationCache(serviceOrgLocation);
    }

    /**
     * 得到统计数据
     *
     * @return
     */
    @RequestMapping("getStatistics")
    @ResponseBody
    public Map<String, Map<String, List<Integer>>> getServiceOrgStatistics() {
        return serviceOrgService.serviceOrgStatistics("9");
    }

    /**
     * 机构星级数量统计
     *
     * @return
     */
    @RequestMapping("getInstitutionStarClass")
    @ResponseBody
    public Map<String, List<Integer>> getInstitutionStarClass() {
        return starRatingOfInstitutionsService.getInstitutionStarClass();
    }

    /**
     * 入住老人列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("elderly/list")
    @ResponseBody
    public PageResponse<ServiceOrgElderly> getList(ServiceOrgElderly filter, PageRequest pageRequest, String startCheckOutTimeStr, String endCheckOutTimeStr, String endCheckInTimeStr, String startCheckInTimeStr) throws Exception {
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            filter.setServiceOrgId(userService.selectByServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId())).getUid());
        }
        if (!StringUtils.isEmpty(startCheckInTimeStr)) {
            filter.setStartCheckInTime(df.parse(startCheckInTimeStr));
        }
        if (!StringUtils.isEmpty(endCheckInTimeStr)) {
            filter.setEndCheckInTime(df.parse(endCheckInTimeStr));
        }
        if (!StringUtils.isEmpty(startCheckOutTimeStr)) {
            filter.setStartCheckOutTime(df.parse(startCheckOutTimeStr));
        }
        if (!StringUtils.isEmpty(endCheckOutTimeStr)) {
            filter.setEndCheckOutTime(df.parse(endCheckOutTimeStr));
        }
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            ElderlyMsg elderlyMsg = new ElderlyMsg();
            elderlyMsg.setAreaName(currentUser().getAreaName());
            filter.setElderlyMsg(elderlyMsg);
        }
        return serviceOrgElderlyService.selectPageList(filter, pageRequest);
    }

//    /***
//     * 入住老人更新
//     * @param serviceOrgElderly
//     * @return
//     */
//    @RequestMapping(value = "elderly/update", method = RequestMethod.POST)
//    @ResponseBody
//    public JsonResult update(ServiceOrgElderly serviceOrgElderly,String roomNum) {
//
//
//        JsonResult result = new JsonResult();
//        String serviceOrgId=null;
//        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
//            serviceOrgId=currentUser().getServiceOrgId();
//        }
//
//        ServiceOrgElderly serviceOrgElderly1 = serviceOrgElderlyService.selectByPrimaryKey(serviceOrgElderly.getId());
//
//        if(serviceOrgElderly1.getBedNumber() != null
//            && serviceOrgElderly1.getRoomNum() != null
//            && serviceOrgElderly1.getBedNumber().equals(serviceOrgElderly.getBedNumber())
//            && serviceOrgElderly1.getRoomNum().equals(serviceOrgElderly.getRoomNum())){
//            try {
//                ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation =
//                        serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum, serviceOrgId);
//                if (serviceOrgElderly.getRoomStatus() == 1) {
//                    serviceOrgTowerRoomInformation.setRoomStatus(3);
//                } else {
//                    serviceOrgTowerRoomInformation.setRoomStatus(1);
//                }
//                if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly)) {
//                    serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
//                    result.markSuccess("更新成功1", null);
//                } else {
//                    result.markError("更新失败1");
//                }
//            }catch (Exception e){
//                e.printStackTrace();
//                result.markError("更新异常1");
//            }
//
//        } else if (serviceOrgElderly1.getBedNumber() == null && serviceOrgElderly1.getRoomNum() == null){
//            try {
//                //1、更新老人入住信息
//                serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly);
//
//                //2、更新床位信息
//                ServiceOrgBedsInformation bedsInformation = new ServiceOrgBedsInformation();
//                //2.1、根据房间编号查询ID
//                ServiceOrgTowerRoomInformation towerRoom
//                        = serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum, serviceOrgId);
//                serviceOrgBedsInformationService.selectByBedNumberAndRoomId(roomNum,
//                        towerRoom.getId());
//                bedsInformation.setRoomId(towerRoom.getId());
//                bedsInformation.setBedNumber(serviceOrgElderly.getBedNumber());
//                bedsInformation.setBedsState(2);
//                //2.2、查询床位编号
//                ServiceOrgBedsInformation bedNumberAndRoomId = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly.getBedNumber(),
//                        towerRoom.getId());
//                if (bedNumberAndRoomId.getBedsState() == 2) {
//                    result.markError("该床位已使用");
//                    return result;
//                }
//                bedsInformation.setId(bedNumberAndRoomId.getId());
//                serviceOrgBedsInformationService.updateByPrimaryKeySelective(bedsInformation);
//
//                //3、更新房间信息
//                towerRoom.setRoomStatus(1);
//                serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(towerRoom);
//
//                result.markSuccess("更新成功2", null);
//            }catch (Exception e){
//                e.printStackTrace();
//                result.markError("更新异常2");
//            }
//        } else{
//            try {
//                serviceOrgElderly.setBedInfo("已使用");
//                ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation = serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum, serviceOrgId);
//                if (serviceOrgElderly.getRoomStatus() == 1) {
//                    serviceOrgTowerRoomInformation.setRoomStatus(3);
//                } else {
//                    serviceOrgTowerRoomInformation.setRoomStatus(1);
//                }
//                ServiceOrgBedsInformation serviceOrgBedsInformation
//                        = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly.getBedNumber(),
//                        serviceOrgTowerRoomInformation.getId());
//                if (serviceOrgBedsInformation.getBedsState() == 2) {
//                    result.markError("该床位已使用");
//                    return result;
//                }
//                serviceOrgBedsInformation.setBedsState(2);
//                ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation2
//                        = serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(serviceOrgElderly1.getRoomNum(), serviceOrgId);
//                ServiceOrgBedsInformation serviceOrgBedsInformation1
//                        = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly1.getBedNumber(), serviceOrgTowerRoomInformation2.getId());
//                serviceOrgBedsInformation1.setBedsState(1);
//                List<ServiceOrgBedsInformation> serviceOrgBedsInformations = serviceOrgBedsInformationService.selectByRoomId(serviceOrgTowerRoomInformation2.getId());
//
//                for (ServiceOrgBedsInformation orgBedsInformation : serviceOrgBedsInformations) {
//                    if (!orgBedsInformation.getBedNumber().equals(serviceOrgElderly1.getBedNumber())) {
//                        if (orgBedsInformation.getBedsState() == 2) {
//                            serviceOrgTowerRoomInformation2.setRoomStatus(1);
//                            break;
//                        }
//                    }
//                    serviceOrgTowerRoomInformation2.setRoomStatus(2);
//                }
//                if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly)) {
//
//                    serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation);
//
//                    serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation2);
//
//                    serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
//
//                    serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation1);
//
//                    result.markSuccess("更新成功3", null);
//                } else {
//                    result.markError("更新失败3");
//                }
//            }catch (Exception e){
//                e.printStackTrace();
//                result.markError("更新异常3");
//            }
//        }
//
//        return result;
//    }


    /***
     * 入住老人更新
     * @param serviceOrgElderly
     * @return
     */
    @RequestMapping(value = "elderly/update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(ServiceOrgElderly serviceOrgElderly,String roomNum) {


        JsonResult result = new JsonResult();
        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgId=currentUser().getServiceOrgId();
        }
        //查询原老人入住
        ServiceOrgElderly serviceOrgElderly1 = serviceOrgElderlyService.selectByPrimaryKey(serviceOrgElderly.getId());
        if(serviceOrgElderly1.getBedNumber()!=null &&  serviceOrgElderly1.getRoomNum()!=null){
            //判断原老人床位编号和房间编号是否改变
            if(serviceOrgElderly1.getBedNumber().equals(serviceOrgElderly.getBedNumber())&&serviceOrgElderly1.getRoomNum().equals(serviceOrgElderly.getRoomNum())){
                //根据房间编号查询房间信息
                ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation= serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum,serviceOrgId);
                //是否包房1否2是
                if(serviceOrgElderly.getRoomStatus()==1){
                    //设置房间状态1已使用2.空闲3.包房
                    serviceOrgTowerRoomInformation.setRoomStatus(3);
                }else{
                    //已使用
                    serviceOrgTowerRoomInformation.setRoomStatus(1);
                }

                //更新入住老人信息
                if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly)) {
                    //设置房间状态
                    serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
                    result.markSuccess("更新成功", null);
                } else {
                    result.markError("更新失败");
                }
            }else{
                //判断原老人床位编号和房间编号是否改变  设置床位信息
                serviceOrgElderly.setBedInfo("已使用");
                //根据房间编号查询房间信息
                ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation= serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum,serviceOrgId);
                //判断入住老人是否包房1否2是
                if(serviceOrgElderly.getRoomStatus()==1){
                    //设置房间状态1已使用2.空闲3.包房
                    serviceOrgTowerRoomInformation.setRoomStatus(3);
                }else{

                    serviceOrgTowerRoomInformation.setRoomStatus(1);
                }
                //根据床位编号查询床位信息
                ServiceOrgBedsInformation serviceOrgBedsInformation = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly.getBedNumber(), serviceOrgTowerRoomInformation.getId());
                //床位状态1未使用2已使用
                if(serviceOrgBedsInformation.getBedsState()==2){
                    result.markError("该床位已使用");
                    return result;
                }
                //设置床位状态1未使用2已使用
                serviceOrgBedsInformation.setBedsState(2);
                //根据房间编号查查房间信息
                ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation2= serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(serviceOrgElderly1.getRoomNum(),serviceOrgId);
                //根据床位编号查询床位信息
                ServiceOrgBedsInformation serviceOrgBedsInformation1 = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly1.getBedNumber(), serviceOrgTowerRoomInformation2.getId());
                //设置床位状态1未使用2已使用
                serviceOrgBedsInformation1.setBedsState(1);
                //根据房间id查询床位信息
                List<ServiceOrgBedsInformation> serviceOrgBedsInformations = serviceOrgBedsInformationService.selectByRoomId(serviceOrgTowerRoomInformation2.getId());
                for (ServiceOrgBedsInformation orgBedsInformation : serviceOrgBedsInformations) {
                    //床位编号是否等入住老人床位编号
                    if(!orgBedsInformation.getBedNumber().equals(serviceOrgElderly1.getBedNumber())){

                        //床位状态1未使用2已使用
                        if(orgBedsInformation.getBedsState()==2){
                            //房间状态1已使用2.空闲3.包房
                            serviceOrgTowerRoomInformation2.setRoomStatus(1);
                            break;
                        }
                    }
                    //设置房间状态1已使用2.空闲3.包房
                    serviceOrgTowerRoomInformation2.setRoomStatus(2);
                }
                if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly)) {

                    serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation);
                    serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation2);
                    serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
                    serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation1);

                    result.markSuccess("更新成功", null);
                } else {
                    result.markError("更新失败");
                }
            }

            return result;
        }else{
            if(serviceOrgElderly.getCheckOutTime()==null){


            serviceOrgElderly.setBedInfo("已使用");
            //根据房间编号查询房间信息
            ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation= serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum,serviceOrgId);

            //判断入住老人是否包房1否2是
            if(serviceOrgElderly.getRoomStatus()==1){
                //设置房间状态1已使用2.空闲3.包房
                serviceOrgTowerRoomInformation.setRoomStatus(3);
            }else{

                serviceOrgTowerRoomInformation.setRoomStatus(1);
            }
            //根据床位编号查询床位信息
            ServiceOrgBedsInformation serviceOrgBedsInformation = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly.getBedNumber(), serviceOrgTowerRoomInformation.getId());
            //床位状态1未使用2已使用
            if(serviceOrgBedsInformation.getBedsState()==2){
                result.markError("该床位已使用");
                return result;
            }
            //设置床位状态1未使用2已使用
            serviceOrgBedsInformation.setBedsState(2);


            if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly)) {

                serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation);
                serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);

                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }

            }else{
                serviceOrgElderly.setBedInfo("空闲");
                if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly)) {

                    result.markSuccess("更新成功", null);
                } else {
                    result.markError("更新失败");
                }
            }


            return result;

        }

    }



    /**
     * 入住老人导入
     */
    @RequestMapping(value = "orgElderlyImport", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) throws IOException {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ServiceOrgElderly> serviceOrgElderlies = new ArrayList<ServiceOrgElderly>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        //一共多少数据
        int num = 0;
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix) || "xlsx".equals(suffix)) {
                try {
                    wb = WorkbookFactory.create(is);
                } catch (InvalidFormatException e) {
                    e.printStackTrace();
                }
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ServiceOrgElderly serviceOrgElderly = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                serviceOrgElderly = new ServiceOrgElderly();

                //通过身份证获取老人id
                String cardNo = ExportExcelUtil.getCellValue(row.getCell(0));
                ElderlyMsg msg = null;
                if (!org.springframework.util.StringUtils.isEmpty(cardNo)) {
                    msg = elderlyMsgService.selectByCardNo(cardNo);
                    if (ObjectUtils.isNotNull(msg)) {
                        serviceOrgElderly.setElderlyId(msg.getId());
                    } else {
                        b = false;
                        errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加", i + 1));
                        continue;
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加", i + 1));
                    continue;
                }

                //机构名称
                String institutionName = currentUser().getServiceOrgName();
                ServiceOrg org = null;
                if (StringUtils.isNotEmpty(institutionName)) {
                    org = serviceOrgService.getOrgIdByInstitutionName(institutionName);
                    if (ObjectUtils.isNotNull(org)) {
                        serviceOrgElderly.setServiceOrgId(Integer.parseInt(userService.selectUidByNickName(institutionName)));
                        serviceOrgElderly.setOrganizationName(institutionName);
                    } else {
                        b = false;
                        errorReasons.add(String.format("第%d行机构名称有误，请检查后重新添加", i + 1));
                        continue;
                    }
                }

                //入院时间  出院时间
                String inTime = ExportExcelUtil.getCellValue(row.getCell(2));
                serviceOrgElderly.setCheckInTime(inTime);

                String outTime = ExportExcelUtil.getCellValue(row.getCell(3));
                Date checkOutTime = null;
                try {
                    checkOutTime = df.parse(outTime);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                serviceOrgElderly.setCheckOutTime(outTime);

//                //床位编号
//                serviceOrgElderly.setBedNumber(ExportExcelUtil.getCellValue(row.getCell(5)));

                //床位类型
                String sBedType = ExportExcelUtil.getCellValue(row.getCell(4));
                Integer bedType = Integer.parseInt(sBedType);
                serviceOrgElderly.setBedType(bedType);

                //床位信息
//                String bedInfo = ExportExcelUtil.getCellValue(row.getCell(7));
//                serviceOrgElderly.setBedInfo(bedInfo);

                //入院状态
                String sStatus = ExportExcelUtil.getCellValue(row.getCell(5));
                serviceOrgElderly.setStatus(Integer.parseInt(sStatus));

                //失能状况
                String disableStutiation = ExportExcelUtil.getCellValue(row.getCell(6));
                serviceOrgElderly.setDisableStutiation(Integer.parseInt(disableStutiation));

                //是否加入运营补贴
                String operatingSubsidies = ExportExcelUtil.getCellValue(row.getCell(7));
                serviceOrgElderly.setOperatingSubsidies(Integer.parseInt(operatingSubsidies));

                //住院编号
                String number = ExportExcelUtil.getCellValue(row.getCell(8));
                if (!StringUtils.isEmpty(number)) {
                    serviceOrgElderly.setNumber(number);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行入院编号为空，请检查后重新添加", i + 1));
                    continue;
                }

                //是否包房
                String roomStatus = ExportExcelUtil.getCellValue(row.getCell(9));
                serviceOrgElderly.setRoomStatus(Integer.parseInt(roomStatus));

                if (b) {
                    serviceOrgElderlies.add(serviceOrgElderly);
                }
                if (serviceOrgElderlies.size() == 500) {
                    if (serviceOrgElderlyService.insertSome(serviceOrgElderlies)) {
                        serviceOrgElderlies.removeAll(serviceOrgElderlies);
                        result.markSuccess("导入成功", null);
                        result.setData(errorReasons);
                    } else {
                        result.markError("导入失败");
                        result.setData(errorReasons);
                    }
                }
            }
        } else {
            result.markError("文件内容为空！");
        }
        if (serviceOrgElderlies.size() > 0 && serviceOrgElderlyService.insertSome(serviceOrgElderlies)) {
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }

    /***
     * 入院
     * @param serviceOrgElderly
     * @return
     */
    @RequestMapping(value = "elderly/add1", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add1(ServiceOrgElderly serviceOrgElderly, String idcardno,String roomNum) {

        JsonResult result = new JsonResult();
        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgElderly.setOrganizationName(currentUser().getServiceOrgName());
        }

        ServiceOrgElderly serviceOrgElderly1 = serviceOrgElderlyService.selectByElderlyId(elderlyMsgService.selectByCardNo(idcardno).getId());
        if(serviceOrgElderly1!=null && serviceOrgElderly1.getCheckOutTime()==null){
            result.markError("该老人已入住");
        }else{
            if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
                serviceOrgId=currentUser().getServiceOrgId();
            }
            ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation= serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(roomNum,serviceOrgId);
            ServiceOrgBedsInformation serviceOrgBedsInformation=serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly.getBedNumber(),serviceOrgTowerRoomInformation.getId());
            serviceOrgBedsInformation.setBedsState(2);
            if(serviceOrgElderly.getRoomStatus()==0){
                serviceOrgTowerRoomInformation.setRoomStatus(1);
            }else{
                serviceOrgTowerRoomInformation.setRoomStatus(3);
            }
            ElderlyMsg elderlyMsg = null;
            if (StringUtils.isEmpty(idcardno)) {
                return null;
            } else {
                elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
            }
            serviceOrgElderly.setElderlyId(elderlyMsg.getId());
            serviceOrgElderly.setServiceOrgId(currentUser().getUid());
            serviceOrgElderly.setBedInfo("使用中");
            if (serviceOrgElderlyService.insert(serviceOrgElderly)) {
                serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation);
                serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);

                result.markSuccess("添加成功", null);
            } else {
                result.markError("添加失败");
            }
        }

        return result;
    }

    /***
     * 出院
     * @param serviceOrgElderly
     * @return
     */
    @RequestMapping(value = "elderly/add2", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add2(ServiceOrgElderly serviceOrgElderly, String idcardno) {
        JsonResult result = new JsonResult();
        ElderlyMsg elderlyMsg = null;
        if (StringUtils.isEmpty(idcardno)) {
            return null;
        } else {
            elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
        }

        ServiceOrgElderly serviceOrgElderly1=serviceOrgElderlyService.selectByElderlyId( elderlyMsg.getId());

        if(serviceOrgElderly1==null ){
            result.markError("该老人未入住");
            return result;
        }
        if(serviceOrgElderly1.getCheckOutTime()!=null){
            result.markError("该老人已出院");
            return result;
        }
        serviceOrgElderly1.setCheckOutTime(df.format(serviceOrgElderly.getCheckOutTime()));
        serviceOrgElderly1.setStatus(serviceOrgElderly.getStatus());
        serviceOrgElderly1.setDisableStutiation(serviceOrgElderly.getDisableStutiation());
        serviceOrgElderly1.setBedInfo("空闲");
      /*  serviceOrgElderly.setElderlyId(elderlyMsg.getId());
        serviceOrgElderly.setServiceOrgId(currentUser().getUid());*/
        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgId=currentUser().getServiceOrgId();
        }
        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation= serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(serviceOrgElderly1.getRoomNum(),serviceOrgId);
        serviceOrgTowerRoomInformation.setRoomStatus(2);
        ServiceOrgBedsInformation serviceOrgBedsInformation=serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly1.getBedNumber(),serviceOrgTowerRoomInformation.getId());
        serviceOrgBedsInformation.setBedsState(1);
        if (serviceOrgElderlyService.updateByPrimaryKeySelective(serviceOrgElderly1)) {
            serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
            serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation);
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    /***
     * 机构入住老人的出院/入院
     * @param serviceOrgElderly
     * @return
     */
    @RequestMapping(value = "elderly/detailAddInOut", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult orgInOutHospital(ServiceOrgElderly serviceOrgElderly, String idcardno) {
        JsonResult result = new JsonResult();
        ElderlyMsg elderlyMsg = null;
        if (StringUtils.isEmpty(idcardno)) {
            return null;
        } else {
            elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
        }
        serviceOrgElderly.setElderlyId(elderlyMsg.getId());
        if (serviceOrgElderlyService.insert(serviceOrgElderly)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }


    @RequestMapping("elderly/delete")
    @ResponseBody
    public JsonResult delete(Integer id) {
        JsonResult result = new JsonResult();
        ServiceOrgElderly serviceOrgElderly = serviceOrgElderlyService.selectByPrimaryKey(id);
        String serviceOrgId=null;
        if (getCurrentUser().hasRole(RoleType.JgAdmin.getValue())) {
            serviceOrgId=currentUser().getServiceOrgId();
        }
        ServiceOrgTowerRoomInformation serviceOrgTowerRoomInformation = new ServiceOrgTowerRoomInformation();
        ServiceOrgBedsInformation serviceOrgBedsInformation = new ServiceOrgBedsInformation();

                if(serviceOrgElderly.getRoomNum()!="" && serviceOrgElderly.getRoomNum()!=null) {

                    serviceOrgTowerRoomInformation = serviceOrgTowerRoomInformationService.selectByRoomNumAndServiceOrgId(serviceOrgElderly.getRoomNum(), serviceOrgId);
                    if (serviceOrgTowerRoomInformation != null) {
                        serviceOrgTowerRoomInformation.setRoomStatus(2);
                    }
                }
                if(serviceOrgElderly.getBedNumber()!="" && serviceOrgElderly.getBedNumber()!=null) {
                    serviceOrgBedsInformation = serviceOrgBedsInformationService.selectByBedNumberAndRoomId(serviceOrgElderly.getBedNumber(), serviceOrgTowerRoomInformation.getId());
                    if (serviceOrgBedsInformation != null) {
                        serviceOrgBedsInformation.setBedsState(1);
                    }
                }


        if (serviceOrgElderlyService.deleteByPrimaryKey(id)) {
            if(serviceOrgTowerRoomInformation.getId()!=null){
                serviceOrgTowerRoomInformationService.updateByPrimaryKeySelective(serviceOrgTowerRoomInformation);
            }
            if(serviceOrgBedsInformation.getId()!=null){
                serviceOrgBedsInformationService.updateByPrimaryKeySelective(serviceOrgBedsInformation);
            }

            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("elderly/deleteSome")
    @ResponseBody
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        String[] ids = deleteIds.split(",");
        List<Integer> idList = new ArrayList<Integer>();
        for (String s : ids) {
            if (!org.apache.commons.lang.StringUtils.isEmpty(s)) {
                idList.add(Integer.parseInt(s));
            }
        }
        if (serviceOrgElderlyService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 获取老人信息
     *
     * @return
     */
    @RequestMapping(value = "getElderByCardNo", method = RequestMethod.POST)
    @ResponseBody
    public ElderlyMsg getElderByCardNo(String idcardno) {
        ElderlyMsg elderlyMsg = null;
        if (StringUtils.isEmpty(idcardno)) {
            return null;
        } else {
            elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
        }
        return elderlyMsg;
    }


    /**
     * 机构信息导入
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "机构信息导入")
    public JsonResult serviceOrgImport(@RequestParam("file") MultipartFile file,
                                       @RequestParam("type") Integer type, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JsonResult result = new JsonResult();
        List<String> errorReasons = new ArrayList<>();
        List<ServiceOrg> serviceOrgs = new ArrayList<ServiceOrg>();
        List<User> users = new ArrayList<>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一个多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix) || "xlsx".equals(suffix)) {
                wb = WorkbookFactory.create(is);
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ServiceOrg serviceOrg = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);

                serviceOrg = new ServiceOrg();
                // 所属区域
                serviceOrg.setAreaName(getCellValue(row.getCell(0)) == "" ? null : getCellValue(row.getCell(0)));
//                String areaNames = getCellValue(row.getCell(0));
//                if (!org.springframework.util.StringUtils.isEmpty(areaNames)) {
//                    //todo 设置区域
//                    serviceOrg.setAreaName(areaNames);
//                    serviceOrg.setZipcode(areaService.selectAreaIdByName(areaNames.split(",")[1]).get(0).getDistrictId());
//                    String areaName = areaNames.substring(areaNames.lastIndexOf(",")+1,areaNames.length());
//                    serviceOrg.setAreaId(areaService.selectAreaIdByName(areaName).get(0).getId());
//                } else {
//                    b = false;
//                    errorReasons.add(String.format("第%d行所属区域为空，请检查后重新添加", i + 1));
//                    continue;
//                }
                // 单位名称
                String institutionName = getCellValue(row.getCell(1));
                if (!org.springframework.util.StringUtils.isEmpty(institutionName)) {
                    ServiceOrg serviceOrg1 = new ServiceOrg();
                    serviceOrg1.setInstitutionName(institutionName);
                    List<ServiceOrg> serviceOrgs1 = serviceOrgService.selectByInstitutionName(serviceOrg1);
                    if (!serviceOrgs1.isEmpty() && serviceOrgs1.size() > 0) {
                        b = false;
                        errorReasons.add(String.format("第%d行单位名称重复，请检查后重新添加", i + 1));
                        continue;
                    } else {
                        serviceOrg.setInstitutionName(institutionName);
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行单位名称为空，请检查后重新添加", i + 1));
                    continue;
                }

                // 联系人
                serviceOrg.setApplyName(getCellValue(row.getCell(2)) == "" ? null : getCellValue(row.getCell(2)));
                // 固话
                serviceOrg.setPhone(getCellValue(row.getCell(3)) == "" ? null : getCellValue(row.getCell(3)));
                // 手机号码
                serviceOrg.setMobile(getCellValue(row.getCell(4)) == "" ? null : getCellValue(row.getCell(4)));
                // 单位地址
                serviceOrg.setAddress(getCellValue(row.getCell(5)) == "" ? null : getCellValue(row.getCell(5)));
                // 审核状态 0:未审核 1：已审核 2-平台导入
                serviceOrg.setStatus(1);
                // 1:服务组织 2:机构 3:养老联盟
                serviceOrg.setType(type);
                serviceOrg.setCreateTime(new Date());
                if (b) {
                    serviceOrgs.add(serviceOrg);
                }
            }
        } else {
            result.markError("文件内容为空！");
        }
        if (serviceOrgs.size() > 0) {

            for (int i = 0; i < serviceOrgs.size(); i++) {
                serviceOrgService.insertIns(serviceOrgs.get(i));
            }

            result.markSuccess("导入成功", null);
            result.setData(errorReasons);

            //自动导出生成的服务组织账号
            if (users.size() > 0) {
                Subject subject = SecurityUtils.getSubject();
                Session session = subject.getSession();
                session.setAttribute("users", users);
            }
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }


    /**
     * 组织信息导入
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/importMoreInfo", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "机构信息导入")
    public JsonResult institutionImport(@RequestParam("file") MultipartFile file,
                                        @RequestParam("type") Integer type,
                                        HttpServletRequest request,
                                        HttpServletResponse response) throws Exception {
        JsonResult result = new JsonResult();
        List<String> errorReasons = new ArrayList<>();
        List<ServiceOrg> serviceOrgs = new ArrayList<ServiceOrg>();
        List<User> users = new ArrayList<>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一个多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix) || "xlsx".equals(suffix)) {
                wb = WorkbookFactory.create(is);
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ServiceOrg serviceOrg = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                int x = sheet.getLastRowNum();
                Row row = sheet.getRow(i);
                serviceOrg = new ServiceOrg();
                serviceOrg.setType(type);
                // 单位名称
                String institutionName = getCellValue(row.getCell(1));
                if (!org.springframework.util.StringUtils.isEmpty(institutionName)) {
                    ServiceOrg serviceOrg1 = new ServiceOrg();
                    serviceOrg1.setInstitutionName(institutionName);
                    List<ServiceOrg> serviceOrgs1 = serviceOrgService.selectByInstitutionName(serviceOrg1);
                    if (!serviceOrgs1.isEmpty() && serviceOrgs1.size() > 0) {
                        b = false;
                        errorReasons.add(String.format("第%d行单位名称重复，请检查后重新导入", i + 1));
                        continue;
                    } else {
                        serviceOrg.setInstitutionName(institutionName);
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行单位名称为空，请检查后重新导入", i + 1));
                    continue;
                }

                // 联系人
                serviceOrg.setApplyName(getCellValue(row.getCell(2)));

                //区属
                String areaName = getCellValue(row.getCell(3));
                if (!org.springframework.util.StringUtils.isEmpty(areaName)) {
//                    //todo 设置区域
                    Area area = areaService.getAreaByNameFromCache(areaName);
                    if (area != null) {
                        serviceOrg.setZipcode(area.getDistrictId());
                        serviceOrg.setAreaId(area.getId());
                        serviceOrg.setAreaName("内蒙古市," + areaName);
                    } else {
                        b = false;
                        errorReasons.add(String.format("第%d行所属区域为空，请检查后重新导入", i + 1));
                        continue;
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行所属区域为空，请检查后重新导入", i + 1));
                    continue;
                }


                //星级等级
                String gradeDictId = getCellValue(row.getCell(4));
                if (!org.springframework.util.StringUtils.isEmpty(gradeDictId)) {
                    serviceOrg.setGradeDictId(Integer.parseInt(gradeDictId));
                }


                // 机构性质 1.公办养老机构2.民办养老机构3.公建民营机构4.农村敬老院5.农村中心敬老院 6.城市福利院 7.公建国营8。公建民营 9。民办非营利性10民办营利性
                String institutionsCategory = getCellValue(row.getCell(5));
                institutionsCategory = institutionsCategory.trim();
                if (!StringUtils.isEmpty(institutionsCategory)) {
                    if ("农村敬老院".equals(institutionsCategory)) {
                        serviceOrg.setInstitutionsCategory("4");
                    } else if ("城市福利院".equals(institutionsCategory)) {
                        serviceOrg.setInstitutionsCategory("6");

                    } else if ("公建国营".equals(institutionsCategory)) {
                        serviceOrg.setInstitutionsCategory("7");

                    } else if ("公建民营".equals(institutionsCategory)) {
                        serviceOrg.setInstitutionsCategory("8");

                    } else if ("民办非营利性".equals(institutionsCategory)) {
                        serviceOrg.setInstitutionsCategory("9");

                    } else if ("民办营利性".equals(institutionsCategory)) {
                        serviceOrg.setInstitutionsCategory("10");

                    }

                }


                String buildType = getCellValue(row.getCell(6));
                institutionsCategory = buildType.trim();
                if (!StringUtils.isEmpty(buildType)) {
                    if ("正常营业".equals(institutionsCategory)) {
                        serviceOrg.setBuildType(3);
                    } else if ("未运营".equals(institutionsCategory)) {
                        serviceOrg.setBuildType(2);

                    }
                }


                // 地址
                serviceOrg.setAddress(getCellValue(row.getCell(7)));
                // 联系方式
                serviceOrg.setMobile(getCellValue(row.getCell(8)));
                //建筑面积
                String landArea = getCellValue(row.getCell(9));
                try {
                    serviceOrg.setLandArea(Double.parseDouble(landArea));

                } catch (Exception e) {

                }
                //床位
                String bedCount = getCellValue(row.getCell(10));
                try {
                    serviceOrg.setDesignBedCount(bedCount);
                    serviceOrg.setBedCount(Integer.parseInt(bedCount));
                } catch (Exception e) {

                }

                //床位
                String bedEmptyCount = getCellValue(row.getCell(11));
                try {
                    serviceOrg.setBedEmptyCount(serviceOrg.getBedCount() - Integer.parseInt(bedEmptyCount));

                } catch (Exception e) {

                }

                //是否取得食品经营许可证
                String isFoodSafePermit = getCellValue(row.getCell(14));
                try {
                    serviceOrg.setIsFoodSafePermit("是".equals(isFoodSafePermit) ? 1 : 0);
                } catch (Exception e) {

                }

                //是否取得消防验收手续
                String isFireLicense = getCellValue(row.getCell(15));
                try {
                    serviceOrg.setIsFireLicense(("是".equals(isFireLicense) ? "是" : "否"));
                } catch (Exception e) {

                }

                //老人数
                String elderNum = getCellValue(row.getCell(16));
                try {
                    serviceOrg.setElderNum(elderNum);
                } catch (Exception e) {

                }

                //服务人员数
                String workNum = getCellValue(row.getCell(20));
                try {
                    serviceOrg.setWorkNum(workNum);
                } catch (Exception e) {

                }
                //护理员
                String nursingNum = getCellValue(row.getCell(23));
                try {
                    serviceOrg.setNursingNum(nursingNum);
                } catch (Exception e) {

                }

                //医养结合
                String medicalServiceMode = getCellValue(row.getCell(25));
                if ("内设医务室".equals(medicalServiceMode)) {
                    serviceOrg.setMedicalServiceMode(1);
                } else if ("与医疗机构合作".equals(medicalServiceMode)) {
                    serviceOrg.setMedicalServiceMode(2);
                } else if ("未开展".equals(medicalServiceMode)) {
                    serviceOrg.setMedicalServiceMode(3);
                } else {
                    serviceOrg.setMedicalServiceMode(4);
                }
                // 审核状态 0:未审核 1：已审核 2-平台导入
                serviceOrg.setStatus(1);
                serviceOrg.setType(type);
                serviceOrg.setCreateTime(new Date());
                if (b) {
                    serviceOrgs.add(serviceOrg);
                }
            }
        } else {
            result.markError("文件内容为空！");
        }
        if (serviceOrgs.size() > 0) {
            for (ServiceOrg serviceOrg : serviceOrgs) {
                User user = serviceOrgService.insertAndCreateUser(serviceOrg);
                users.add(user);
            }
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);

            //自动导出生成的服务组织账号
            if (users.size() > 0) {
                logger.info("users-------------:" + JacksonUtil.bean2Json(users));
                Subject subject = SecurityUtils.getSubject();
                Session session = subject.getSession();
                session.setAttribute("users", users);
            }
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }


    @RequestMapping(value = "findServiceOrgByInstitutionName", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "通过组织名称查询组织信息")
    public JsonResult findServiceOrgByInstitutionName(ServiceOrg serviceOrg) throws Exception {
        JsonResult result = new JsonResult();
        List<ServiceOrg> list = serviceOrgService.selectByInstitutionName(serviceOrg);
        if (list.size() == 1) {
            result.markSuccess("查询成功", list.get(0));
        } else if (list.size() > 1) {
            result.markError("通过'" + serviceOrg.getInstitutionName() + "'查询出" + list.size() + "条数据");
        } else {
            result.markError("该组织名称无效");
        }
        return result;
    }
}
