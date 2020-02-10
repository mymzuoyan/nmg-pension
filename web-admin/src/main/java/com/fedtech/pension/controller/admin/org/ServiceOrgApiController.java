package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.commons.utils.JacksonUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.dwr.DwrService;
import com.fedtech.pension.elderly.service.JiuYeService;
import com.fedtech.pension.elderly.vo.EmployStatisticsVo;
import com.fedtech.pension.org.entity.*;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.org.vo.QualificationStatistics;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.entity.Message;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.AreaService;
import com.fedtech.pension.sys.service.MessageService;
import com.fedtech.pension.sys.service.UserService;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author gengqiang
 */
@Controller
@RequestMapping("/admin/api/")
public class ServiceOrgApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(ServiceOrgApiController.class);

    public String SAVEURL_serviceOrg = "/file/img/serviceOrg/";

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;
    @Reference(version = "1.0.0")
    private ServiceOrgLocationService serviceOrgLocationService;

    @Reference(version = "1.0.0")
    private ServiceOrgAssessmentService serviceOrgAssessmentService;

    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private AreaService areaService;
    //
    @Reference(version = "1.0.0")
    private MessageService messageService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;

    @Reference(version = "1.0.0")
    private JiuYeService jiuYeService;

    @Reference(version = "1.0.0")
    private ServiceOrgCommentService serviceOrgCommentService;

    @Autowired
    private DwrService dwrService;


    /**
     * 养老服务组织信息列表
     * <p>
     * <p>
     * 完整度（开户银行 银行账号 服务半径 logo不算在内） 客户更改
     *
     * @param serviceOrg
     * @param pageRequest
     * @return
     */
    @RequestMapping("serviceOrgList")
    @ResponseBody
    @SystemControllerLog(description = "查看养老服务组织信息列表")
    public PageResponse<ServiceOrg> getServiceOrgList(ServiceOrg serviceOrg, PageRequest pageRequest) {
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区域管理员
            String areaName = serviceOrg.getAreaName();
            if (StringUtils.isEmpty(areaName)) {
                areaName = currentUser().getAreaName();
            }
            serviceOrg.setAreaName(areaName);
        }
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue()) || currentUser.hasRole(RoleType.JgAdmin.getValue())) {
            User user = userService.selectByPrimaryKey(currentUser().getUid());
            serviceOrg.setId(Integer.parseInt(user.getServiceOrgId()));
        }

        PageResponse<ServiceOrg> dataTable = serviceOrgService.selectPageList(serviceOrg, pageRequest);
        return dataTable;
    }

    /**
     * 根据条件来获取组织列表
     *
     * @return
     */
    @RequestMapping("/serviceOrg/getServiceOrgByFilter")
    @ResponseBody
    public List<ServiceOrgLocation> getServiceOrgByFilter(ServiceOrgLocation serviceOrgLocation) {
        return serviceOrgLocationService.getServiceOrgByFilter(serviceOrgLocation);
    }

    /**
     * 导出养老服务组织信息列表
     *
     * @param filter
     * @return
     */
    @RequestMapping("serviceOrgList/export")
    @SystemControllerLog(description = "导出养老服务组织信息列表")
    public void export(ServiceOrg filter, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        List<ServiceOrg> serviceOrgs = serviceOrgService.getAllRecode(filter);
        response.setContentType("octets/stream");
        String fileName = "服务组织信息.xls";
        String title = "服务组织信息";
        if (filter.getType() != null) {
            if (2 == filter.getType()) {
                fileName = "养老机构信息.xls";
                title = "养老机构信息";
            } else if (3 == filter.getType()) {
                fileName = "社会服务企业信息.xls";
                title = "社会服务企业信息";
            }
        }

        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<ServiceOrg> ex = new ExportExcel<>();
        String[] headers = {"所属区域", "组织名称", "单位性质", "联系人", "联系电话", "注册类型",
                "等级", "状态", "信息完整度"
        };
        String[] fieldNames = {"areaName", "institutionName", "instProp", "applyName", "phone", "regTypeDictId",
                "gradeDictId", "status", "infoIntegrity"};
        ex.exportExcel(title, headers, fieldNames, serviceOrgs, out, "yyyy-MM-dd");
        out.close();
    }


    /**
     * 删除服务组织信息
     *
     * @param eventId
     * @return
     */
    @RequestMapping("serviceOrgDelete")
    @ResponseBody
    @SystemControllerLog(description = "删除服务组织信息")
    public JsonResult deleteServiceOrg(Integer eventId) {
        JsonResult result = new JsonResult();
        if (serviceOrgService.deleteByPrimaryKey(eventId)) {
            List<Integer> serviceOrgIds = new ArrayList<>();
            serviceOrgIds.add(eventId);
            if (userFuwuService.deleteByServiceOrgIds(serviceOrgIds)) {// 删除组织下服务人员
                if (userService.updateUsersByServiceOrgIds(2, serviceOrgIds)) {// 删除此组织用户及旗下服务人员用户信息
                    result.markSuccess("删除成功", null);
                }
            }
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除组织信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("/serviceOrg/deleteSomeMsg")
    @ResponseBody
    @SystemControllerLog(description = "批量删除组织信息")
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (serviceOrgService.deleteSomeMsg(idList)) {
                if (userFuwuService.deleteByServiceOrgIds(idList)) {// 删除组织下服务人员
                    if (userService.updateUsersByServiceOrgIds(2, idList)) {// 删除此组织用户及旗下服务人员用户信息
                        result.markSuccess("删除成功", null);
                    }
                }
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 更新服务组织信息
     *
     * @param serviceOrg
     * @return
     */
    @RequestMapping("serviceOrgEdit")
    @ResponseBody
    @SystemControllerLog(description = "更新服务组织信息")
    public JsonResult doUpdateServiceOrg(ServiceOrg serviceOrg) throws ParseException {
        JsonResult result = new JsonResult();
        if (serviceOrgService.updateByPrimaryKeySelective(serviceOrg)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 审核账号并生成账号
     *
     * @param serviceOrg
     * @return
     */
    @RequestMapping("serviceOrgVerify")
    @ResponseBody
    @SystemControllerLog(description = "审核服务组织信息")
    public JsonResult verifyServiceOrg(ServiceOrg serviceOrg, String content, String applyIdcardNo) throws MessagingException {
        JsonResult result = new JsonResult();
        if (ObjectUtils.isNotNull(serviceOrg.getId())) {
            if (serviceOrg.getStatus() == 1) {
                //审核通过
                serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrg.getId());
                serviceOrg.setStatus(1);
                User user = serviceOrgService.updateAndCreateUser(serviceOrg);
                user.setUserIdCardNo(serviceOrg.getApplyIdcardNo());
                userService.updateUserIdCardNoById(user.getUid(),serviceOrg.getApplyIdcardNo());
                if (ObjectUtils.isNotNull(user)) {
                    try {
                        serviceOrgService.sendUserAccountEmail(serviceOrg,user);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    result.markSuccess("审核成功", user);
                } else {
                    result.markError("审核失败");
                }
            }
            if (serviceOrg.getStatus() == 3) {
                //审核不通过
                serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrg.getId());
                if (serviceOrgService.deleteAndNotice(serviceOrg, content)) {
                    result.markSuccess("审核不通过", "");
                } else {
                    result.markError("审核失败");
                }
            }
        } else {
            result.markError("审核失败");
        }
        return result;
    }


    /**
     * 判断单位名称是否重复
     *
     * @param institutionName
     * @return
     */
    @RequestMapping("judgeInstitutionName")
    @ResponseBody
    public JsonResult judgeInstitutionName(String institutionName) {
        ServiceOrg serviceOrg = new ServiceOrg();
        JsonResult result = new JsonResult();
        if (!StringUtils.isEmpty(institutionName)) {
            serviceOrg.setInstitutionName(institutionName);
            List<ServiceOrg> serviceOrgs = serviceOrgService.selectByInstitutionName(serviceOrg);
            if (!serviceOrgs.isEmpty() && serviceOrgs.size() > 0) {
                result.markError("重复");
            } else {
                result.markSuccess("可用", null);
            }
        }
        return result;
    }

    @RequestMapping("/serviceOrg/importLogoUrl")
    @ResponseBody
    public JsonResult importLogoUrl(HttpServletRequest request, MultipartFile file) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult fileResult = new JsonResult();
        fileResult = util.saveFile(request, file, "/file/img/serviceOrg/logo/", false);
        if (fileResult.isSuccess()) {
            result.markSuccess("上传成功！", fileResult.getData().toString());
        } else {
            result.markError("上传失败！");
        }
        return result;
    }


    /**
     * 添加服务组织信息
     *
     * @param serviceOrg
     * @return
     */
    @RequestMapping("serviceOrgAdd")
    @ResponseBody
    public JsonResult addServiceOrg(ServiceOrg serviceOrg) throws ParseException {
        JsonResult result = new JsonResult();
        if (serviceOrg.getStatus() == 1) {
            serviceOrg.setCreateTime(new Date());
            User user = serviceOrgService.insertAndCreateUser(serviceOrg);
            if (ObjectUtils.isNotNull(user)) {
                result.markSuccess("添加成功", user);
            } else {
                result.markError("添加失败");
            }
        } else {
            serviceOrg.setCreateTime(new Date());
            if (serviceOrgService.insert(serviceOrg)) {
                result.markSuccess("添加成功", null);
            } else {
                result.markError("添加失败");
            }
        }
        return result;
    }


    /**
     * 养老服务组织信息列表(包含经纬度信息)
     *
     * @param serviceOrgLocation
     * @return
     */
    @RequestMapping("/serviceOrg/locationList")
    @ResponseBody
    public List<ServiceOrgLocation> serviceOrgLocationList(ServiceOrgLocation serviceOrgLocation) {
        List<ServiceOrgLocation> list = serviceOrgLocationService.selectAllServiceOrg(serviceOrgLocation);
        return list;
    }

    /**
     * 养老服务组织信息列表(包含经纬度信息)
     *
     * @param serviceOrgLocation
     * @return
     */
    @RequestMapping("/serviceOrg/all")
    @ResponseBody
    public List<ServiceOrgLocation> serviceOrgLocationCache(ServiceOrgLocation serviceOrgLocation) {
        return serviceOrgLocationService.serviceOrgLocationCache(serviceOrgLocation);
    }


    /**
     * 更新组织地理信息
     *
     * @param serviceOrgLocation
     * @return
     */
    @RequestMapping("/serviceOrg/updateLocation")
    @ResponseBody
    @SystemControllerLog(description = "更新组织地理信息")
    public JsonResult updateServiceOrgLocation(ServiceOrgLocation serviceOrgLocation) {
        JsonResult result = new JsonResult();
        if (ObjectUtils.isNotNull(serviceOrgLocation.getServiceOrgId())) {
            if (serviceOrgLocationService.updateOrInsertLocation(serviceOrgLocation)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        } else {
            result.markError("没有明确组织");
        }
        return result;

    }


    /**
     * 更新所有组织地理信息
     *
     * @return
     */
    @RequestMapping("/serviceOrg/updateAllLocation")
    @ResponseBody
    public JsonResult updateAllLocation() {
        JsonResult result = new JsonResult();
        List<ServiceOrg> serviceOrgs = serviceOrgService.getAllRecode(new ServiceOrg());
        if (ObjectUtils.isNotNull(serviceOrgs)) {
            for (ServiceOrg s : serviceOrgs) {
                if (ObjectUtils.isNotNull(s.getAddress())) {
                    serviceOrgService.updateLocation(s);
                }
            }
        }
        result.markSuccess("更新成功", null);
        return result;
    }


    /**
     * 得到统计数据
     *
     * @return
     */
    @RequestMapping("/serviceOrg/getServiceOrgStatistics")
    @ResponseBody
    public Map<String, Map<String, List<Integer>>> getServiceOrgStatistics() {
        return serviceOrgService.serviceOrgStatistics("1,2,3,4,5,6,7,8");
    }

    /**
     * 各区各等级统计情况
     *
     * @return
     */
    @RequestMapping("/serviceOrg/getStatisticsByAreaAndLevel")
    @ResponseBody
    public Map<String, List<Integer>> getStatisticsByAreaAndLevel() {
        Area area = areaService.selectByPrimaryKey(currentUser().getAreaId());
        if (area.getLevel() <= 2) {
            return serviceOrgService.getStatisticsByAreaAndLevel(area.getId());
        } else {
            return serviceOrgService.getStatisticsByAreaAndLevel(area.getParentId());

        }
    }

    /**
     * 组织数量统计（服务类型和组织等级）
     *
     * @return
     */
    @RequestMapping("/serviceOrg/getStatisticsByTypeAndLevel")
    @ResponseBody
    public Map<String, List<Integer>> getStatisticsByTypeAndLevel() {
        return serviceOrgService.getStatisticsByTypeAndLevel();
    }


    /**
     * 组织信息导入
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/serviceOrg/import", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "组织信息导入")
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
                int x = sheet.getLastRowNum();
                Row row = sheet.getRow(i);

                serviceOrg = new ServiceOrg();
                // 所属区域
                serviceOrg.setAreaName("内蒙古市," + getCellValue(row.getCell(0)));
//                String areaNames = getCellValue(row.getCell(0));
//                if (!StringUtils.isEmpty(areaNames)) {
//                    //todo 设置区域
//                    serviceOrg.setAreaName(areaNames);
//                    serviceOrg.setZipcode(areaService.selectAreaIdByName(areaNames.split(",")[1]).get(0).getDistrictId());
//                    String areaName = areaNames.substring(areaNames.lastIndexOf(",") + 1, areaNames.length());
//                    //serviceOrg.setAreaId(areaService.selectAreaIdByName(areaName).get(0).getId());
//                } else {
//                    b = false;
//                    errorReasons.add(String.format("第%d行所属区域为空，请检查后重新导入", i + 1));
//                    continue;
//                }
                // 单位名称
                String institutionName = getCellValue(row.getCell(1));
                if (!StringUtils.isEmpty(institutionName)) {
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

                String gradeDictId = getCellValue(row.getCell(2));
                if (gradeDictId.equals("A")) {
                    serviceOrg.setGradeDictId(0);
                } else if (gradeDictId.equals("2A")) {
                    serviceOrg.setGradeDictId(1);
                } else if (gradeDictId.equals("3A")) {
                    serviceOrg.setGradeDictId(2);
                } else if (gradeDictId.equals("4A")) {
                    serviceOrg.setGradeDictId(3);
                } else if (gradeDictId.equals("5A")) {
                    serviceOrg.setGradeDictId(4);
                }

                if (!StringUtils.isEmpty(getCellValue(row.getCell(3)))) {
                    // 组织类型
                    serviceOrg.setInstitutionTypeDictId(getCellValue(row.getCell(3)));
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行单位名称重复，请检查后重新导入", i + 1));
                    continue;
                }

                // 联系人
                serviceOrg.setApplyName(getCellValue(row.getCell(4)));
                // 固话
                serviceOrg.setPhone(getCellValue(row.getCell(5)));
                // 手机号码
                serviceOrg.setMobile(getCellValue(row.getCell(6)));
                // 注册类型  1-民非 2-工商 3-事业单位
                String regTypeDictId = getCellValue(row.getCell(7));
//                if (!StringUtils.isEmpty(regTypeDictId)) {
                if ("民非".equals(regTypeDictId)) {
                    serviceOrg.setRegTypeDictId(1);
                } else if ("工商".equals(regTypeDictId)) {
                    serviceOrg.setRegTypeDictId(2);
                } else if ("事业单位".equals(regTypeDictId)) {
                    serviceOrg.setRegTypeDictId(3);
                }
//                } else {
//                    b = false;
//                    errorReasons.add(String.format("第%d行注册类型为空，请检查后重新导入", i + 1));
//                    continue;
//                }

                // 单位地址
                serviceOrg.setAddress(getCellValue(row.getCell(8)) == "" ? null : getCellValue(row.getCell(8)));
                // 审核状态 0:未审核 1：已审核 2-平台导入
                serviceOrg.setStatus(2);
                // 1:服务组织 2:机构 3:养老联盟
                serviceOrg.setType(type);
                serviceOrg.setInstitutionTypeDictId("1");
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
                serviceOrgService.insertOrg(serviceOrg);
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
     * 获取execl里的数据
     *
     * @return
     */
    public String getCellValue(Cell cell) {
        String value = "";
        try {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_NUMERIC: {
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        //用于转化为日期格式

                        Date d = cell.getDateCellValue();

                        DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

                        value = formater.format(d);

                    } else {
                        value = String.valueOf(new DecimalFormat("#").format(cell.getNumericCellValue()));
                    }
                    break;
                }
                case Cell.CELL_TYPE_STRING: {
                    value = cell.getStringCellValue();
                    break;
                }
                default: {
                    value = "";
                    break;
                }
            }
        } catch (Exception e) {
            value = "";
        }
        return value;
    }

    /**
     * 生成导入的服务组织账号
     *
     * @throws Exception
     */
    @RequestMapping("serviceOrgList/exportAccount")
    @SystemControllerLog(description = "导出养老服务组织账号")
    public void exportAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        List<User> users = (List<User>) session.getAttribute("users");
        session.removeAttribute("users");
        response.setContentType("octets/stream");
        String fileName = "新导入服务组织账号.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<User> ex = new ExportExcel<>();
        String[] headers = {"所属区域", "组织名称", "登录账号", "默认密码"};
        String[] fieldNames = {"areaName", "nick_name", "login_name", "pass_word"};
        ex.exportExcel(fileName, headers, fieldNames, users, out, "yyyy-MM-dd");
        out.close();
    }




    /**
     * 获取组织评估列表
     *
     * @param serviceOrgAssessment
     * @param pageRequest
     * @return
     */
    @RequestMapping("/orgAssess/getAssessList")
    @ResponseBody
    @SystemControllerLog(description = "查看组织评估列表")
    public PageResponse<ServiceOrgAssessment> getAssessmentList(ServiceOrgAssessment serviceOrgAssessment, PageRequest pageRequest, String startDateString, String endDateString) throws ParseException {
        if (!StringUtils.isEmpty(startDateString)) {
            serviceOrgAssessment.setStartDate(df.parse(startDateString));
        }
        if (!StringUtils.isEmpty(endDateString)) {
            serviceOrgAssessment.setEndDate(df.parse(endDateString));
        }
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区域管理员
            String areaName = currentUser().getAreaName();
            if (!StringUtils.isEmpty(areaName)) {
                if (areaName.split(",").length >= 2) {
                    areaName = areaName.split(",")[1];
                }
            }
            serviceOrgAssessment.setAreaName(areaName);
            serviceOrgAssessment.setRoleId(3);
        }
        if (currentUser.hasRole(RoleType.SuAdmin.getValue())) {
            serviceOrgAssessment.setRoleId(1);
        }
        if (currentUser.hasRole(RoleType.MuAdmin.getValue())) {
            serviceOrgAssessment.setRoleId(2);
        }
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            serviceOrgAssessment.setRoleId(4);
        }
        PageResponse<ServiceOrgAssessment> dataTable = serviceOrgAssessmentService.selectPageList(serviceOrgAssessment, pageRequest);
        return dataTable;
    }

    /**
     * 上传评估资料
     *
     * @param request
     * @param files
     * @param id
     * @param type
     * @return
     */
    @RequestMapping("/orgAssess/assessUpload")
    @ResponseBody
    public JsonResult assessAdd1(HttpServletRequest request, @RequestParam("files") MultipartFile[] files, String id, String type) {
        JsonResult result = new JsonResult();
        String fileNames = "";
        if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                if (!StringUtils.isEmpty(id)) {
                    FileUtil util = new FileUtil();
                    if (!file.isEmpty()) {
                        JsonResult result1 = util.saveFile(request, file, SAVEURL_serviceOrg + id + "/" + type + "/", false);
                        fileNames += result1.getData() + ",";
                    }
                }
            }
            result.markSuccess("保存成功", fileNames);
        }

        return result;
    }

    /**
     * 申请组织评估
     *
     * @param request
     * @param serviceOrgAssessment
     * @return
     * @throws IOException
     */
    @RequestMapping("/orgAssess/addAssess")
    @ResponseBody
    @SystemControllerLog(description = "申请组织评估")
    public JsonResult addAssess(HttpServletRequest request, ServiceOrgAssessment serviceOrgAssessment) throws IOException {
        JsonResult result = new JsonResult();
        serviceOrgAssessment.setQustandard(2);
        serviceOrgAssessment.setStandard(2);
        serviceOrgAssessment.setCreateTime(new Date());
        Integer serviceOrgId = serviceOrgAssessment.getServiceOrgId();
        // 生成的缩略图存入数据库
        String gThumb = thumbnails(request, serviceOrgAssessment.getGeneralRequirement(), serviceOrgId, "generalRequirement");
        serviceOrgAssessment.setgThumb(gThumb);
        String iThumb = thumbnails(request, serviceOrgAssessment.getInfrastructure(), serviceOrgId, "infrastructure");
        serviceOrgAssessment.setiThumb(iThumb);
        String paThumb = thumbnails(request, serviceOrgAssessment.getPersonnelAllocation(), serviceOrgId, "personnelAllocation");
        serviceOrgAssessment.setPaThumb(paThumb);
        String pasThumb = thumbnails(request, serviceOrgAssessment.getProjectAndScale(), serviceOrgId, "projectAndScale");
        serviceOrgAssessment.setPasThumb(pasThumb);
        String spThumb = thumbnails(request, serviceOrgAssessment.getServicePerformance(), serviceOrgId, "servicePerformance");
        serviceOrgAssessment.setSpThumb(spThumb);
        String bThumb = thumbnails(request, serviceOrgAssessment.getBasicFunction(), serviceOrgId, "basicFunction");
        serviceOrgAssessment.setbThumb(bThumb);
        String qThumb = thumbnails(request, serviceOrgAssessment.getQualification(), serviceOrgId, "qualification");
        serviceOrgAssessment.setqThumb(qThumb);
        String rThumb = thumbnails(request, serviceOrgAssessment.getRegulatoryFramework(), serviceOrgId, "regulatoryFramework");
        serviceOrgAssessment.setrThumb(rThumb);
        String sThumb = thumbnails(request, serviceOrgAssessment.getSecurityAssurance(), serviceOrgId, "securityAssurance");
        serviceOrgAssessment.setsThumb(sThumb);
        String suThumb = thumbnails(request, serviceOrgAssessment.getSupervision(), serviceOrgId, "supervision");
        serviceOrgAssessment.setSuThumb(suThumb);
        ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgAssessment.getServiceOrgId());
        if (serviceOrgAssessmentService.insert(serviceOrgAssessment)) {
            result.markSuccess("申请成功", null);
            Integer gradeDictId = serviceOrgAssessment.getGradeDictId();
            List<Integer> uids = new ArrayList<Integer>();
            String areaName = serviceOrg.getAreaName();
            String areas = areaName.split(",")[1];
            // 全部等级服务组织 推送到区 区级初审 初审同意推送到市
            List<Integer> roleds = new ArrayList<Integer>();
            roleds.add(RoleType.ReAdmin.getId());
            User user = new User();
            user.setAreaName(areas);
            uids = userService.selectAllUserIdByRoles(user, roleds);
            //todo 推送
            Message message = new Message();
            message.setTitle("组织等级考评");
            message.setType(2);
            message.setContent("组织等级考评:" + serviceOrg.getInstitutionName() + "的组织等级考评申请待审核！");
            message.setCreateTime(new Date());
            message.setCreatorId(currentUser().getUid());
            messageService.sendMessage(message, uids);
            dwrService.sendMessgaeToUser2(uids, "2", "您有申请待审核");
        }
        return result;
    }

    /**
     * 组织评估申请修改
     *
     * @param request
     * @param serviceOrgAssessment
     * @return
     * @throws IOException
     */
    @RequestMapping("/orgAssess/orgUpdate")
    @ResponseBody
    @SystemControllerLog(description = "组织评估申请修改")
    public JsonResult orgUpdateAssess(HttpServletRequest request, ServiceOrgAssessment serviceOrgAssessment) throws IOException {
        JsonResult result = new JsonResult();
        Integer serviceOrgId = serviceOrgAssessment.getServiceOrgId();
        // 生成的缩略图存入数据库
        String gThumb = thumbnails(request, serviceOrgAssessment.getGeneralRequirement(), serviceOrgId, "generalRequirement");
        serviceOrgAssessment.setgThumb(gThumb);
        String iThumb = thumbnails(request, serviceOrgAssessment.getInfrastructure(), serviceOrgId, "infrastructure");
        serviceOrgAssessment.setiThumb(iThumb);
        String paThumb = thumbnails(request, serviceOrgAssessment.getPersonnelAllocation(), serviceOrgId, "personnelAllocation");
        serviceOrgAssessment.setPaThumb(paThumb);
        String pasThumb = thumbnails(request, serviceOrgAssessment.getProjectAndScale(), serviceOrgId, "projectAndScale");
        serviceOrgAssessment.setPasThumb(pasThumb);
        String spThumb = thumbnails(request, serviceOrgAssessment.getServicePerformance(), serviceOrgId, "servicePerformance");
        serviceOrgAssessment.setSpThumb(spThumb);
        String bThumb = thumbnails(request, serviceOrgAssessment.getBasicFunction(), serviceOrgId, "basicFunction");
        serviceOrgAssessment.setbThumb(bThumb);
        String qThumb = thumbnails(request, serviceOrgAssessment.getQualification(), serviceOrgId, "qualification");
        serviceOrgAssessment.setqThumb(qThumb);
        String rThumb = thumbnails(request, serviceOrgAssessment.getRegulatoryFramework(), serviceOrgId, "regulatoryFramework");
        serviceOrgAssessment.setrThumb(rThumb);
        String sThumb = thumbnails(request, serviceOrgAssessment.getSecurityAssurance(), serviceOrgId, "securityAssurance");
        serviceOrgAssessment.setsThumb(sThumb);
        String suThumb = thumbnails(request, serviceOrgAssessment.getSupervision(), serviceOrgId, "supervision");
        serviceOrgAssessment.setSuThumb(suThumb);
        if (serviceOrgAssessmentService.updateByPrimaryKeySelective(serviceOrgAssessment)) {
            result.markSuccess("修改成功", null);
        } else {
            result.markError("修改失败");
        }
        return result;
    }


    /**
     * 生成缩略图
     *
     * @param request
     * @param imageUrls
     * @param serviceOrgId
     * @param imageName
     * @return
     * @throws IOException
     */
    public String thumbnails(HttpServletRequest request, String imageUrls, Integer serviceOrgId, String imageName) throws IOException {
        String savePath = getPhysicalPath(request);
        String imageType = imageUrls.substring(0, imageUrls.length() - 1);
        String tmp = "";
        if (!StringUtils.isEmpty(imageType)) {
            for (int i = 0; i < imageType.split(",").length; i++) {
                if (imageType.split(",")[i] != null && imageType.split(",")[i] != "") {
                    String thumbnailsPath = SAVEURL_serviceOrg + serviceOrgId + "/" + imageName + "/" + imageName + i + "_200_300" + imageType.split(",")[i].substring(imageType.split(",")[i].lastIndexOf("."));
                    try {
                        Thumbnails.of(savePath + imageType.split(",")[i])
                                .size(200, 300)
                                .toFile(new File(savePath + thumbnailsPath));//生成_200*300缩略图
                    } catch (IOException e) {
                        logger.info("cmyk转化异常");
                        File cmykJPEGFile = new File(savePath + imageType.split(",")[i]);
                        try {
                            BufferedImage image = ImageIO.read(cmykJPEGFile);
                            ImageOutputStream output = ImageIO.createImageOutputStream(cmykJPEGFile);
                            if (!ImageIO.write(image, "jpg", output)) {
                                logger.info("-----cmyk转化异常:{}-----");
                            }
                            Thumbnails.of(image)
                                    .size(200, 300)
                                    .toFile(new File(savePath + thumbnailsPath));//生成_200*300缩略图
                            logger.info("-----cmyk转化成功-----");
                        } catch (IOException e1) {
                            logger.info("-----cmyk转化异常:{}-----", e1.getMessage());
                        }
                    }
                    tmp += thumbnailsPath + ",";
                }
            }
        }
        return tmp;
    }

    /**
     * 获取物理位置
     *
     * @param request
     * @return
     */
    private String getPhysicalPath(HttpServletRequest request) {
        return request.getSession().getServletContext().getRealPath("");
    }

    /**
     * 审核组织评估
     *
     * @param serviceOrgAssessment
     * @return
     */
    @RequestMapping("/orgAssess/updateAssess")
    @ResponseBody
    @SystemControllerLog(description = "审核组织评估")
    public JsonResult updateAssess(ServiceOrgAssessment serviceOrgAssessment) {
        JsonResult result = new JsonResult();
        Integer standard = serviceOrgAssessment.getStandard();
        Integer qustandard = serviceOrgAssessment.getQustandard();
        String standards = "";
        if (!StringUtils.isEmpty(standard)) {
            if (standard == 1) {
                standards = "已获通过！";
            } else if (standard == 0) {
                standards = "未获通过，原因是" + serviceOrgAssessment.getContent() + "。";
            }
        }

        String qustandards = "";
        if (!StringUtils.isEmpty(qustandard)) {
            if (serviceOrgAssessment.getGradeDictId() < 2) {
                if (qustandard == 1) {
                    qustandards = "已获通过！";
                    serviceOrgAssessment.setStandard(1);
                } else if (qustandard == 0) {
                    qustandards = "未获通过，原因是" + serviceOrgAssessment.getQucontent() + "。";
                }
            } else {
                if (qustandard == 1) {
                    qustandards = "初审已获通过！";
                } else if (qustandard == 0) {
                    qustandards = "初审未获通过，原因是" + serviceOrgAssessment.getQucontent() + "。";
                }
            }
        }
        if (serviceOrgAssessment != null) {
            serviceOrgAssessment.setId(serviceOrgAssessment.getId());
            serviceOrgAssessment.setUpdateTime(new Date());
            if (serviceOrgAssessmentService.updateByPrimaryKeySelective(serviceOrgAssessment)) {
                //更新数据库
                boolean flag = false;
                if (serviceOrgAssessment.getGradeDictId() < 2 && serviceOrgAssessment.getQustandard() == 1) {
                    flag = true;
                }
                if (serviceOrgAssessment.getGradeDictId() >= 2 && serviceOrgAssessment.getStandard() == 1) {
                    flag = true;
                }
                if (flag) {
                    ServiceOrg serviceOrg0 = new ServiceOrg();
                    serviceOrg0.setId(serviceOrgAssessment.getServiceOrgId());
                    serviceOrg0.setGradeDictId(serviceOrgAssessment.getGradeDictId());
                    serviceOrgService.updateByPrimaryKeySelective(serviceOrg0);
                }
                result.markSuccess("评估成功", null);
                List<Integer> uids = new ArrayList<Integer>();
                List<Integer> roleds = new ArrayList<Integer>();
                roleds.add(RoleType.ZuAdmin.getId());
                User user = new User();
                user.setServiceOrgId(serviceOrgAssessment.getServiceOrgId().toString());
                uids = userService.selectAllUserIdByRoles(user, roleds);
                //推送
                Message message = new Message();
                message.setTitle("组织等级考评结果");
                message.setType(2);
                ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgAssessment.getServiceOrgId());
                if (!StringUtils.isEmpty(standards)) {
                    message.setContent(serviceOrg.getInstitutionName() + "，您的养老组织等级申报" + standards);
                }
                if (!StringUtils.isEmpty(qustandards)) {
                    message.setContent(serviceOrg.getInstitutionName() + "，您的养老组织等级申报" + qustandards);
                }
                message.setCreateTime(new Date());
                message.setCreatorId(currentUser().getUid());
                messageService.sendMessage(message, uids);
                dwrService.sendMessgaeToUser2(uids, "2", "您有申请已审核");

                if (!StringUtils.isEmpty(qustandard)) {
                    Message message1 = new Message();
                    message1.setTitle("组织等级考评结果");
                    message1.setCreateTime(new Date());
                    message1.setCreatorId(currentUser().getUid());
                    message1.setType(2);
                    if (qustandard == 1) {
                        uids.removeAll(uids);
                        //todo  推送
                        //todo 获取uids

                        message1.setContent(serviceOrg.getInstitutionName() + "初审已获通过，待您审核！");
                        messageService.sendMessage(message1, uids);
                        dwrService.sendMessgaeToUser2(uids, "2", "您有申请待审核");
                    }
                }
            }
        } else {
            result.markError("该申请不存在");
        }
        return result;
    }


    /**
     * 获取园内组织
     *
     * @param lat
     * @param lng
     * @param radius
     * @return
     */
    @RequestMapping("getServiceOrgsByCircle")
    @ResponseBody
    public List<ServiceOrgLocation> getServiceOrgsByCircle(double lat, double lng, double radius) {
        return serviceOrgService.getServiceOrgsByCircle(lat, lng, radius);
    }


    /**
     * 补贴数据量统计
     *
     * @return
     */
    @RequestMapping("orgAssess/getStatistic")
    @ResponseBody
    public PageResponse<EmployStatisticsVo> getStatistic(Integer areaId) {
        if (areaId == null) {
            areaId = 1;
        }
        PageResponse<EmployStatisticsVo> pageResponse = new PageResponse<>();
        pageResponse.setData(jiuYeService.getStatistics(areaId));
        pageResponse.setRecordsTotal(jiuYeService.getStatistics(areaId).size());
        pageResponse.setRecordsFiltered(jiuYeService.getStatistics(areaId).size());
        pageResponse.setDraw(1);
        return pageResponse;
    }


    /**
     * 评价列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("serviceOrg/comment/list")
    @ResponseBody
    public PageResponse<ServiceOrgComment> list(ServiceOrgComment filter, PageRequest pageRequest) {
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            filter.setAreaName(currentUser().getAreaName());
        }
        return serviceOrgCommentService.selectPageList(filter, pageRequest);
    }
}
