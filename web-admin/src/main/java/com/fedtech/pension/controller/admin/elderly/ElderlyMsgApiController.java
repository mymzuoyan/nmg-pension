package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fedtech.commons.data.AppResult;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.*;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.controller.MyValidateApiController;
import com.fedtech.pension.elderly.entity.*;
import com.fedtech.pension.elderly.service.*;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import com.fedtech.pension.nurse.service.ServiceOrgNurseElderlyService;
import com.fedtech.pension.org.entity.ServiceOrgFixedAssets;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.entity.StarRatingOfInstitutions;
import com.fedtech.pension.org.service.*;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2016/9/9.
 */
@Controller
@RequestMapping("/admin/api/elderly/")
public class ElderlyMsgApiController extends BaseController {

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private JiuYeService jiuYeService;

    @Reference(version = "1.0.0")
    private AreaService areaService;

    @Reference(version = "1.0.0")
    private ElderLinkManService elderLinkManService;

    @Reference(version = "1.0.0")
    private ElderlyAssessmentService elderlyAssessmentService;

    @Reference(version = "1.0.0")
    private ElderAssessCheckService elderAssessCheckService;

    @Reference(version = "1.0.0")
    private ServiceOrgNurseElderlyService serviceOrgNurseElderlyService;

    @Reference(version = "1.0.0")
    private ServiceOrgRecreationalActivitiesService serviceOrgRecreationalActivitiesService;

    @Reference(version = "1.0.0")
    private ServiceOrgSocialDonationService serviceOrgSocialDonationService;

    @Reference(version = "1.0.0")
    private StarRatingOfInstitutionsService starRatingOfInstitutionsService;

    @Reference(version = "1.0.0")
    private ServiceOrgSocialWorkService serviceOrgSocialWorkService;

    @Reference(version = "1.0.0")
    private ServiceOrgFixedAssetsService serviceOrgFixedAssetsService;


    @Autowired
    private RedisAreaUtil redisAreaUtil;


    private MyValidateApiController myValidateApiController = new MyValidateApiController();

    private static Pattern NUMBER_PATTERN = Pattern.compile("^//d+(//.//d+)?$");


    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 获取老人信息
     *
     * @return
     */
    @RequestMapping(value = "getElderByCardNo", method = RequestMethod.POST)
    @ResponseBody
    public ElderlyMsg getElderByCardNo(String cardNo) {
        ElderlyMsg elderlyMsg = null;
        if (StringUtils.isEmpty(cardNo)) {
            return null;
        } else {
            elderlyMsg = elderlyMsgService.selectByCardNo(cardNo);
        }
        return elderlyMsg;
    }


    /**
     * 确认老人去世
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "isDead", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "确认老人死亡")
    public JsonResult isDeadElder(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (elderlyMsgService.isDeadElder(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("操作成功", null);
        } else {
            result.markError("操作失败");
        }
        return result;
    }

    /**
     * 批量确认老人去世
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("updateIsDeath")
    @ResponseBody
    @SystemControllerLog(description = "批量确认老人去世")
    public JsonResult updateIsDeath(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (elderlyMsgService.updateIsDeath(idList)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        }
        return result;
    }

    /**
     * 加载老人基础字段信息list
     *
     * @return
     */
    @RequestMapping(value = "getElderlyInfo", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<ElderlyMsg> getElderlyInfo(ElderlyMsg elderlyMsg, PageRequest pageRequest, String deathTimeString,
                                                   String cremationTimeString, String serviceNeedCheckbox,
                                                   String elderTypeDictIdsCheckbox,
                                                   @RequestParam(value = "flag", required = false, defaultValue = "true")
                                                               boolean flag) throws Exception {
        if (!StringUtils.isEmpty(deathTimeString)) {
            elderlyMsg.setDeathTime(df.parse(deathTimeString));
        }
        if(elderlyMsg.getIsDeath() == 0){
            elderlyMsg.setAreaName("");
        }
        if (!StringUtils.isEmpty(cremationTimeString)) {
            elderlyMsg.setCremationTime(df.parse(cremationTimeString));
        }
        List<Integer> elderTypeList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(elderTypeDictIdsCheckbox)) {
            for (int i = 0; i < elderTypeDictIdsCheckbox.split(",").length; i++) {
                if (elderTypeDictIdsCheckbox.split(",")[i] != null && elderTypeDictIdsCheckbox.split(",")[i] != "") {
                    elderTypeList.add(Integer.parseInt(elderTypeDictIdsCheckbox.split(",")[i]));
                }
            }
            elderlyMsg.setElderTypeList(elderTypeList);
        }
        List<Integer> serviceNeedList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(serviceNeedCheckbox)) {
            for (int i = 0; i < serviceNeedCheckbox.split(",").length; i++) {
                if (serviceNeedCheckbox.split(",")[i] != null && serviceNeedCheckbox.split(",")[i] != "") {
                    serviceNeedList.add(Integer.parseInt(serviceNeedCheckbox.split(",")[i]));
                }
            }
            elderlyMsg.setServiceNeedList(serviceNeedList);
        }
        if (flag) {
            //限制区域
            if (!ObjectUtils.isNotNull(elderlyMsg.getAreaName())) {
                elderlyMsg.setAreaName(currentUser().getAreaName());
            }
            Subject currentUser = SecurityUtils.getSubject();
            if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
                elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            }
        }
        PageResponse<ElderlyMsg> dataTable = elderlyMsgService.selectPageList(elderlyMsg, pageRequest);
        return dataTable;
    }

    /**
     * 加载就业人员基础字段信息list
     *
     * @return
     */
    @RequestMapping(value = "getJiuYeInfo", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取就业人员信息列表")
    public PageResponse<JiuYe> getJiuYeInfo(JiuYe jiuYe,PageRequest pageRequest,String serviceNeedCheckbox, String elderTypeDictIdsCheckbox, @RequestParam(value = "flag", required = false, defaultValue = "true") boolean flag) throws Exception {

        List<Integer> elderTypeList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(elderTypeDictIdsCheckbox)) {
            for (int i = 0; i < elderTypeDictIdsCheckbox.split(",").length; i++) {
                if (elderTypeDictIdsCheckbox.split(",")[i] != null && elderTypeDictIdsCheckbox.split(",")[i] != "") {
                    elderTypeList.add(Integer.parseInt(elderTypeDictIdsCheckbox.split(",")[i]));
                }
            }
            jiuYe.setElderTypeList(elderTypeList);
        }
        List<Integer> serviceNeedList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(serviceNeedCheckbox)) {
            for (int i = 0; i < serviceNeedCheckbox.split(",").length; i++) {
                if (serviceNeedCheckbox.split(",")[i] != null && serviceNeedCheckbox.split(",")[i] != "") {
                    serviceNeedList.add(Integer.parseInt(serviceNeedCheckbox.split(",")[i]));
                }
            }
            jiuYe.setServiceNeedList(serviceNeedList);
        }
        PageResponse<JiuYe> dataTable = jiuYeService.selectPageList(jiuYe, pageRequest);
        return dataTable;
    }

    /**
     * 加载老人基础字段信息list
     * 与服务表联查
     *
     * @return
     */
    @RequestMapping(value = "getElderlyServiceInfo", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取老人信息列表与服务表联查")
    public PageResponse<ElderlyMsg> getElderlyServiceInfo(ElderlyMsg elderlyMsg, PageRequest pageRequest, String deathTimeString,
                                                          String cremationTimeString, String serviceNeedCheckbox, String elderTypeDictIdsCheckbox, @RequestParam(value = "flag", required = false, defaultValue = "true") boolean flag) throws Exception {
        if (!StringUtils.isEmpty(deathTimeString)) {
            elderlyMsg.setDeathTime(df.parse(deathTimeString));
        }
        if (!StringUtils.isEmpty(cremationTimeString)) {
            elderlyMsg.setCremationTime(df.parse(cremationTimeString));
        }
        List<Integer> elderTypeList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(elderTypeDictIdsCheckbox)) {
            for (int i = 0; i < elderTypeDictIdsCheckbox.split(",").length; i++) {
                if (elderTypeDictIdsCheckbox.split(",")[i] != null && elderTypeDictIdsCheckbox.split(",")[i] != "") {
                    elderTypeList.add(Integer.parseInt(elderTypeDictIdsCheckbox.split(",")[i]));
                }
            }
            elderlyMsg.setElderTypeList(elderTypeList);
        }
        List<Integer> serviceNeedList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(serviceNeedCheckbox)) {
            for (int i = 0; i < serviceNeedCheckbox.split(",").length; i++) {
                if (serviceNeedCheckbox.split(",")[i] != null && serviceNeedCheckbox.split(",")[i] != "")
                    serviceNeedList.add(Integer.parseInt(serviceNeedCheckbox.split(",")[i]));
            }
            elderlyMsg.setServiceNeedList(serviceNeedList);
        }
        if (flag) {
            //限制区域
            if (!ObjectUtils.isNotNull(elderlyMsg.getAreaName())) {
                elderlyMsg.setAreaName(currentUser().getAreaName());
            }
            Subject currentUser = SecurityUtils.getSubject();
            if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
                elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            }
        }
        PageResponse<ElderlyMsg> dataTable = elderlyMsgService.selectPageServiceList(elderlyMsg, pageRequest);
        return dataTable;
    }

    /**
     * 加载老人基础字段信息list
     *
     * @return
     */
    @RequestMapping(value = "getHealthElderlyInfo", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取健康档案老人信息")
    public PageResponse<ElderlyMsg> getHealthElderlyInfo(ElderlyMsg elderlyMsg, PageRequest pageRequest, String deathTimeString,
                                                         String cremationTimeString, String serviceNeedCheckbox, String elderTypeDictIdsCheckbox, @RequestParam(value = "flag", required = false, defaultValue = "true") boolean flag) throws Exception {
        if (!StringUtils.isEmpty(deathTimeString)) {
            elderlyMsg.setDeathTime(df.parse(deathTimeString));
        }
        if (!StringUtils.isEmpty(cremationTimeString)) {
            elderlyMsg.setCremationTime(df.parse(cremationTimeString));
        }
        List<Integer> elderTypeList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(elderTypeDictIdsCheckbox)) {
            for (int i = 0; i < elderTypeDictIdsCheckbox.split(",").length; i++) {
                if (elderTypeDictIdsCheckbox.split(",")[i] != null && elderTypeDictIdsCheckbox.split(",")[i] != "") {
                    elderTypeList.add(Integer.parseInt(elderTypeDictIdsCheckbox.split(",")[i]));
                }
            }
            elderlyMsg.setElderTypeList(elderTypeList);
        }
        List<Integer> serviceNeedList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(serviceNeedCheckbox)) {
            for (int i = 0; i < serviceNeedCheckbox.split(",").length; i++) {
                if (serviceNeedCheckbox.split(",")[i] != null && serviceNeedCheckbox.split(",")[i] != "") {
                    serviceNeedList.add(Integer.parseInt(serviceNeedCheckbox.split(",")[i]));
                }
            }
            elderlyMsg.setServiceNeedList(serviceNeedList);
        }
        if (flag) {
            //限制区域
            if (!ObjectUtils.isNotNull(elderlyMsg.getAreaName())) {
                elderlyMsg.setAreaName(currentUser().getAreaName());
            }
            Subject currentUser = SecurityUtils.getSubject();
            if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
                elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            }
        }
        PageResponse<ElderlyMsg> dataTable = elderlyMsgService.selectPageList(elderlyMsg, pageRequest);
        return dataTable;
    }

    /**
     * 导出老人信息列表
     *
     * @param request
     * @param response
     * @param elderlyMsg
     * @param pageRequest
     * @param deathTimeString
     * @param cremationTimeString
     * @param serviceNeedCheckbox
     * @param elderTypeDictIdsCheckbox
     * @throws Exception
     */
    @RequestMapping(value = "export")
    @SystemControllerLog(description = "导出老人信息列表")
    public void export(HttpServletRequest request,
                       HttpServletResponse response, ElderlyMsg elderlyMsg, PageRequest pageRequest, String deathTimeString,
                       String cremationTimeString, String serviceNeedCheckbox, String elderTypeDictIdsCheckbox) throws Exception {
        response.setContentType("octets/stream");
        String name = "老人数据";
        name = URLEncoder.encode(name, "UTF-8");
        String fileName = "老人数据.zip";
        int length = 50000;
        String[] headers = {"所在区域", "姓名", "身份证号", "年龄", "性别", "人员类别", "居住地址", "移动电话"};
        String[] fieldNames = {"areaName", "elderName", "idcardno", "age", "sexDictId", "elderTypeDictIds", "realAddress", "mobile"};
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/octet-stream;charset=UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        response.addHeader("Pargam", "no-cache");
        response.addHeader("Cache-Control", "no-cache");
        OutputStream out = response.getOutputStream();
        List<String> fileNames = new ArrayList();// 用于存放生成的文件名称s
        File zip = new File(fileName);// 压缩文件
        Integer allcount = elderlyMsgService.count(elderlyMsg);
        int page = allcount % length == 0 ? allcount / length : allcount / length + 1;
        for (int j = 0; j < page; j++) {
            String file = "老人数据" + j
                    + ".xls";
            fileNames.add(file);
            FileOutputStream o = null;
            o = new FileOutputStream(file);
            // 声明一个工作薄
            SXSSFWorkbook workbook = new SXSSFWorkbook(5000);
            // 生成一个表格
            Sheet sheet = workbook.createSheet();

            workbook.setSheetName(0, "老人数据");
            // 设置表格默认列宽度为15个字节
            sheet.setDefaultColumnWidth((short) 15);
            // 产生表格标题行
            Row row = sheet.createRow(0);
            for (short i = 0; i < headers.length; i++) {
                Cell cell = row.createCell(i);
                HSSFRichTextString text = new HSSFRichTextString(headers[i]);
                cell.setCellValue(text);
            }
            if (page > 1) {
                pageRequest.setLength(length);
                pageRequest.setStart(j * length);
            }
            List<ElderlyMsg> elderlyMsgs = elderlyMsgService.selectPageList(elderlyMsg, pageRequest).getData();
            Iterator<ElderlyMsg> it = elderlyMsgs.iterator();
            int index = 0;
            while (it.hasNext()) {
                index++;
                row = sheet.createRow(index);
                ElderlyMsg t = it.next();
                for (short i = 0; i < fieldNames.length; i++) {
                    Cell cell = row.createCell(i);
                    String fieldName = fieldNames[i];
                    String getMethodName = "get"
                            + fieldName.substring(0, 1).toUpperCase()
                            + fieldName.substring(1);
                    try {
                        Class tCls = t.getClass();
                        Method getMethod = tCls.getMethod(getMethodName
                        );
                        Object value = getMethod.invoke(t);
                        String textValue = null;
                        if (value instanceof Date) {
                            Date date = (Date) value;
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            textValue = sdf.format(date);
                        } else {
                            // 其它数据类型都当作字符串简单处理
                            if (value == null) {
                                textValue = "";
                            } else {
                                textValue = value.toString();
                            }
                        }
                        if (textValue != null) {
                            textValue = ExportExcel.getValue(textValue, fieldName);
                            Matcher matcher = NUMBER_PATTERN.matcher(textValue);
                            if (matcher.matches()) {
                                // 是数字当作double处理
                                cell.setCellValue(Double.parseDouble(textValue));
                            } else {
                                HSSFRichTextString richString = new HSSFRichTextString(
                                        textValue);
                                cell.setCellValue(richString);
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            try {
                workbook.write(o);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } finally {
                if (o != null) {
                    o.flush();
                    o.close();
                }
            }
        }
        File srcfile[] = new File[fileNames.size()];

        for (int i = 0, n = fileNames.size(); i < n; i++) {

            srcfile[i] = new File(fileNames.get(i));

        }
        FileZip.ZipFiles(srcfile, zip);

        FileInputStream inStream = new FileInputStream(zip);

        byte[] buf = new byte[4096];

        int readLength;

        while (((readLength = inStream.read(buf)) != -1)) {

            out.write(buf, 0, readLength);

        }
        inStream.close();
        out.close();
    }

    /**
     * 添加老人信息
     *
     * @param elderlyMsg
     * @param deathTimeString
     * @param cremationTimeString
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加老人信息")
    public JsonResult addElderlyMsg(ElderlyMsg elderlyMsg, String deathTimeString, String cremationTimeString) throws Exception {
        JsonResult result = new JsonResult();
        elderlyMsg.setCreateUserId(currentUser().getUid());
        elderlyMsg.setCreateTime(new Date());
        if (elderlyMsg.getStatus() != null) {
            elderlyMsg.setStatus(1);
        }
        if (!StringUtils.isEmpty(deathTimeString)) {
            elderlyMsg.setDeathTime(df.parse(deathTimeString));
        }
        if (!StringUtils.isEmpty(cremationTimeString)) {
            elderlyMsg.setCremationTime(df.parse(cremationTimeString));
        }
        elderlyMsg.setQrCoder(DESHelper.toHexString(DESHelper.encrypt(elderlyMsg.getIdcardno(), Keys.SECRETKEY)));
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        //判断是否已存在
        if (ObjectUtils.isNotNull(elderlyMsg.getIdcardno())) {
            if (ObjectUtils.isNotNull(elderlyMsgService.selectByCardNo(elderlyMsg.getIdcardno()))) {
                result.markError("该老人已存在");
                return result;
            }
        } else {

            result.markError("身份证不能为空");
            return result;
        }
        String code = elderlyMsg.getDeptCode();
        StringBuffer buffer = new StringBuffer(code);
        if (code.length() < 12) {
            for (int i = code.length(); i <= 11; i++) {
                buffer.append("0");
            }
            elderlyMsg.setDeptCode(buffer.toString());
        }
        elderlyMsg.setAreaOrder(getAreaOrder(elderlyMsg.getAreaName()));
        elderlyMsg = elderlyMsgService.insertBackId(elderlyMsg);
        if (ObjectUtils.isNotNull(elderlyMsg)) {
            //更新缓存
            result.markSuccess("保存成功", elderlyMsg.getId());
        } else {
            result.markError("保存失败");
        }
        return result;
    }
        


    /**
     * 星级评定
     *
     */
    @RequestMapping(value = "addStarRate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "星级评定")
    public JsonResult addStarRate(StarRatingOfInstitutions starRatingOfInstitutions, String deathTimeString, String cremationTimeString) throws Exception {
        JsonResult result = new JsonResult();

        if(starRatingOfInstitutions.getStarClass() == 1){
            starRatingOfInstitutions.setArea("1");
            starRatingOfInstitutions.setProfessionalRequirements("1");
            starRatingOfInstitutions.setProportion("1");
            starRatingOfInstitutions.setRehabilitationAreaRequirements("1");
        } else if(starRatingOfInstitutions.getStarClass() == 3) {
            starRatingOfInstitutions.setArea("1");
        }

        starRatingOfInstitutions.setAssessmentTime(new Date());

        if (starRatingOfInstitutionsService.selectByTypeAndSod(starRatingOfInstitutions.getServiceOrgId()) == null) {
            starRatingOfInstitutions.setType(1);
            if (starRatingOfInstitutionsService.insert(starRatingOfInstitutions)) {
                result.markSuccess("保存成功", starRatingOfInstitutions.getId());
            } else {
                result.markError("保存失败");
            }
        } else {
            if (starRatingOfInstitutionsService.updateStarRate(starRatingOfInstitutions)) {
                //更新缓存
                result.markSuccess("更新成功", starRatingOfInstitutions.getId());
            } else {
                result.markError("更新失败");
            }
        }

        return result;
    }

    /**
     * 更新机构服务质量星级评分(安全部分)
     */
    @RequestMapping(value = "updateStarRateSecurity", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新机构服务质量星级评分")
    public JsonResult updateStarRate(StarRatingOfInstitutions starRatingOfInstitutions) throws Exception {
        JsonResult result = new JsonResult();

        if(starRatingOfInstitutions.getStarClass() == 1){
            starRatingOfInstitutions.setArea("1");
            starRatingOfInstitutions.setProfessionalRequirements("1");
            starRatingOfInstitutions.setProportion("1");
            starRatingOfInstitutions.setRehabilitationAreaRequirements("1");
        } else if(starRatingOfInstitutions.getStarClass() == 3) {
            starRatingOfInstitutions.setArea("1");
        }

        starRatingOfInstitutions.setType(1);
        starRatingOfInstitutions.setAssessmentTime(new Date());
        if(starRatingOfInstitutionsService.selectBySodAndType(starRatingOfInstitutions.getServiceOrgId()) != null){
            starRatingOfInstitutions.setListDetail(0);
        }else{
            starRatingOfInstitutions.setListDetail(1);
        }
        if (starRatingOfInstitutionsService.updateByPrimaryKeySelective(starRatingOfInstitutions)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }


        return result;
    }

    /**
     * 评估人员更新机构服务质量星级评分(安全部分)
     */
    @RequestMapping(value = "updateAssess", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新机构服务质量星级评分")
    public JsonResult updateAssess(StarRatingOfInstitutions starRatingOfInstitutions) throws Exception {
        JsonResult result = new JsonResult();

        if(starRatingOfInstitutions.getStarClass() == 1){
            starRatingOfInstitutions.setArea("1");
            starRatingOfInstitutions.setProfessionalRequirements("1");
            starRatingOfInstitutions.setProportion("1");
            starRatingOfInstitutions.setRehabilitationAreaRequirements("1");
        } else if(starRatingOfInstitutions.getStarClass() == 3) {
            starRatingOfInstitutions.setArea("1");
        }

        if (starRatingOfInstitutions.getType() == 1) {
                starRatingOfInstitutions.setListDetail(0);
                if(starRatingOfInstitutionsService.updateListDetail(starRatingOfInstitutions.getServiceOrgId())>0){
                    starRatingOfInstitutions.setType(2);
                    starRatingOfInstitutions.setListDetail(1);
                    starRatingOfInstitutions.setAssessmentTime(new Date());
                    if (starRatingOfInstitutionsService.insert(starRatingOfInstitutions)){
                        result.markSuccess("更新成功", null);
                    } else {
                        result.markError("更新失败");
                    }
                }

        } else {
            starRatingOfInstitutions.setAssessmentTime(new Date());
            if (starRatingOfInstitutionsService.updateByPrimaryKeySelective(starRatingOfInstitutions)) {
                result.markSuccess("更新成功", null);
            } else {
                result.markError("更新失败");
            }
        }


        return result;
    }

    /**
     * 更新机构服务质量星级评分(服务部分)
     */
    @RequestMapping(value = "updateStarRateService", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新机构服务质量星级评分")
    public JsonResult updateStarRateService(StarRatingOfInstitutions starRatingOfInstitutions) throws Exception {
        JsonResult result = new JsonResult();

        Integer serviceScore = starRatingOfInstitutionsService.selectTotalScoreByServiceOrgId(starRatingOfInstitutions.getServiceOrgId());

        if(starRatingOfInstitutions.getStarClass() == 1){
            starRatingOfInstitutions.setArea("1");
            starRatingOfInstitutions.setProfessionalRequirements("1");
            starRatingOfInstitutions.setProportion("1");
            starRatingOfInstitutions.setRehabilitationAreaRequirements("1");
        } else if(starRatingOfInstitutions.getStarClass() == 3) {
            starRatingOfInstitutions.setArea("1");
        }

        int total = starRatingOfInstitutions.getTotalScore() + serviceScore;
        starRatingOfInstitutions.setTotalScore(total);
        starRatingOfInstitutions.setAssessmentTime(new Date());
        if (starRatingOfInstitutionsService.updateByPrimaryKeySelective(starRatingOfInstitutions)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 更新机构服务质量星级评分(管理部分)
     */
    @RequestMapping(value = "updateStarRateAdmin", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新机构服务质量星级评分")
    public JsonResult updateStarRateAdmin(StarRatingOfInstitutions starRatingOfInstitutions) throws Exception {
        JsonResult result = new JsonResult();

        Integer serviceScore = starRatingOfInstitutionsService.selectTotalScoreByServiceOrgId(starRatingOfInstitutions.getServiceOrgId());

        if(starRatingOfInstitutions.getStarClass() == 1){
            starRatingOfInstitutions.setArea("1");
            starRatingOfInstitutions.setProfessionalRequirements("1");
            starRatingOfInstitutions.setProportion("1");
            starRatingOfInstitutions.setRehabilitationAreaRequirements("1");
        } else if(starRatingOfInstitutions.getStarClass() == 3) {
            starRatingOfInstitutions.setArea("1");
        }

        int total = starRatingOfInstitutions.getTotalScore() + serviceScore;
        starRatingOfInstitutions.setTotalScore(total);
        starRatingOfInstitutions.setAssessmentTime(new Date());
        if (starRatingOfInstitutionsService.updateByPrimaryKeySelective(starRatingOfInstitutions)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 更新机构服务质量星级评分(设施部分)
     */
    @RequestMapping(value = "updateStarRateFacilities", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新机构服务质量星级评分")
    public JsonResult updateStarRateFacilities(StarRatingOfInstitutions starRatingOfInstitutions) throws Exception {
        JsonResult result = new JsonResult();

        Integer serviceScore = starRatingOfInstitutionsService.selectTotalScoreByServiceOrgId(starRatingOfInstitutions.getServiceOrgId());

        if(starRatingOfInstitutions.getStarClass() == 1){
            starRatingOfInstitutions.setArea("1");
            starRatingOfInstitutions.setProfessionalRequirements("1");
            starRatingOfInstitutions.setProportion("1");
            starRatingOfInstitutions.setRehabilitationAreaRequirements("1");
        } else if(starRatingOfInstitutions.getStarClass() == 3) {
            starRatingOfInstitutions.setArea("1");
        }

        int total = starRatingOfInstitutions.getTotalScore() + serviceScore;
        starRatingOfInstitutions.setTotalScore(total);
        starRatingOfInstitutions.setAssessmentTime(new Date());
        if (starRatingOfInstitutionsService.updateByPrimaryKeySelective(starRatingOfInstitutions)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 添加就业人员信息
     *
     * @param jiuYe
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "addJiuYe", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加就业人员信息")
    public JsonResult addJiuYe(JiuYe jiuYe) throws Exception {
        JsonResult result = new JsonResult();
        if(jiuYeService.selectByCardNo(jiuYe.getCardNo())==null){
            jiuYe.setServiceOrgName(jiuYe.getServiceOrgName());
            jiuYe.setAreaName(jiuYe.getAreaName());
            jiuYe.setName(jiuYe.getName());
            jiuYe.setCardNo(jiuYe.getCardNo());
            jiuYe.setMobile(jiuYe.getMobile());
            jiuYe.setBuTieMoney(jiuYe.getBuTieMoney());
            jiuYe.setRemarks(jiuYe.getRemarks());
            jiuYe.setOverTime(jiuYe.getOverTime());
            if(jiuYeService.isAdd(jiuYe)){
                result.markSuccess("保存成功", jiuYe.getId());
            } else {
                result.markError("新增失败！");
            }
        }else{
            result.markError("改人员已被登记！");
        }
        return result;
    }

    /**
     * 更新老人信息
     *
     * @param elderlyMsg
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新老人信息")
    public JsonResult updateElder(ElderlyMsg elderlyMsg, String deathTimeString, String cremationTimeString) throws Exception {
        JsonResult result = new JsonResult();
        elderlyMsg.setUpdateUserId(currentUser().getUid());
        elderlyMsg.setUpdateTime(new Date());
        if (elderlyMsgService.updateByPrimaryKeySelective(elderlyMsg)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 更新就业人员信息
     *
     * @param jiuYe
     * @return
     */
    @RequestMapping(value = "updateJiuYe", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新就业人员信息")
    public JsonResult updateJiuYe(JiuYe jiuYe) throws Exception {
        JsonResult result = new JsonResult();
        if (jiuYeService.updateByPrimaryKeySelective(jiuYe)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }

    /**
     * 删除老人信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除老人信息")
    public JsonResult deleteElder(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (elderlyMsgService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 删除文娱活动信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteHappy", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除文娱活动信息")
    public JsonResult deleteHappy(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgRecreationalActivitiesService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }
    /**
     * 删除社会捐赠信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCommunityDonation", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除社会捐赠信息")
    public JsonResult deleteCommunityDonation(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgSocialDonationService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 删除居家固定资产信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteFixedAssets", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除居家固定资产信息")
    public JsonResult deleteFixedAssets(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgFixedAssetsService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除居家固定资产信息
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeFixedAssets")
    @ResponseBody
    @SystemControllerLog(description = "批量删除老人信息")
    public JsonResult deleteSomeFixedAssets(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "")
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
            }
            if (serviceOrgFixedAssetsService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 删除社会服务信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCommunityService", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除社会服务信息")
    public JsonResult deleteCommunityService(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (serviceOrgSocialWorkService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 删除就业人员信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteJiuYe", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除就业人员信息")
    public JsonResult deleteJiuYe(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (jiuYeService.deleteByPrimaryKey(id)) {
            b = true;
        }
        if (b) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 批量删除老人
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeMsg")
    @ResponseBody
    @SystemControllerLog(description = "批量删除老人信息")
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "")
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
            }
            if (elderlyMsgService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 批量删除就业人员
     *
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSomeJiuYe")
    @ResponseBody
    @SystemControllerLog(description = "批量删除就业人员信息")
    public JsonResult deleteSomeJiuYe(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "")
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
            }
            if (jiuYeService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 加载老人能力评估信息list
     *
     * @return
     */
    @RequestMapping(value = "getAssessList", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取老人能力评估信息列表")
    public PageResponse<ElderlyMsg> getAssessList(ElderlyMsg elderlyMsg, PageRequest pageRequest, String resultScore1, String resultScore2, String serviceNeedCheckbox, String elderTypeDictIdsCheckbox) {
        pageRequest.setOrderField("a.id");
        pageRequest.setOrderDir("DESC");
        Map map = new HashMap();
        map.put("resultScore1", resultScore1);

        map.put("resultScore2", resultScore2);
        List<Integer> elderTypeList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(elderTypeDictIdsCheckbox)) {
            for (int i = 0; i < elderTypeDictIdsCheckbox.split(",").length; i++) {
                if (elderTypeDictIdsCheckbox.split(",")[i] != null && elderTypeDictIdsCheckbox.split(",")[i] != "")
                    elderTypeList.add(Integer.parseInt(elderTypeDictIdsCheckbox.split(",")[i]));
            }
            elderlyMsg.setElderTypeList(elderTypeList);
        }
        List<Integer> serviceNeedList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(serviceNeedCheckbox)) {
            for (int i = 0; i < serviceNeedCheckbox.split(",").length; i++) {
                if (serviceNeedCheckbox.split(",")[i] != null && serviceNeedCheckbox.split(",")[i] != "") {
                    serviceNeedList.add(Integer.parseInt(serviceNeedCheckbox.split(",")[i]));
                }
            }
            elderlyMsg.setServiceNeedList(serviceNeedList);
        }
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区域管理员
            String areaName = currentUser().getAreaName();
            if (!StringUtils.isEmpty(areaName)) {
                if (areaName.split(",").length >= 2) {
                    areaName = areaName.split(",")[1];
                }
            }
            elderlyMsg.setAreaName(areaName);

        } else if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            //组织管理员
            if (currentUser().getServiceOrgId().indexOf(",") >= 0) {
                elderlyMsg.setServiceOrgIds(currentUser().getServiceOrgId());
            } else {
                elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            }
        }
        PageResponse<ElderlyMsg> dataTable = elderlyMsgService.selectAssePageList(elderlyMsg, pageRequest, map);
        return dataTable;
    }


    /**
     * 统计数据
     *
     * @return
     */
    @RequestMapping(value = "statistics", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Map<String, Integer>> elderMsgStatistics() {
        Map<String, Map<String, Integer>> data = new LinkedHashMap<String, Map<String, Integer>>();
        ElderlyMsg elderlyMsg = new ElderlyMsg();
        ElderlyGovBuy elderlyGovBuy = new ElderlyGovBuy();
        ElderlyAssessment elderlyAssessment = new ElderlyAssessment();
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
            //区域管理员
            String areaName = currentUser().getAreaName();
            if (!StringUtils.isEmpty(areaName)) {
                if (areaName.split(",").length >= 2) {
                    areaName = areaName.split(",")[1];
                }
            }
            elderlyMsg.setAreaName(areaName);
            elderlyGovBuy.setAreaName(areaName);
            elderlyAssessment.setAreaName(areaName);

        } else if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            //组织管理员
            if (currentUser().getServiceOrgId().indexOf(",") >= 0) {
                elderlyMsg.setServiceOrgIds(currentUser().getServiceOrgId());
                elderlyGovBuy.setServiceOrgIds(currentUser().getServiceOrgId());
                elderlyAssessment.setServiceOrgIds(currentUser().getServiceOrgId());

            } else {
                elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
                elderlyGovBuy.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
                elderlyAssessment.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            }
        }
        data.put("老人户籍统计", elderlyMsgService.getStatisticsByArea(elderlyMsg));
        data.put("是否是政府购买统计", elderlyMsgService.getStatisticsByGovBuy(elderlyGovBuy));
        data.put("老人能力评估统计", elderlyMsgService.getStatisticsByAssess(elderlyAssessment));
        return data;
    }

    /**
     * 统计数据
     *
     * @return
     */
    @RequestMapping(value = "statisticsByMonth", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> elderMsgStatisticsByMonth(String startTime, String endTime) throws ParseException {
        ElderlyMsg elderlyMsg = new ElderlyMsg();
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())) {
            //区域管理员
            String areaName = currentUser().getAreaName();
            if (!StringUtils.isEmpty(areaName)) {
                if (areaName.split(",").length >= 2) {
                    areaName = areaName.split(",")[1];
                }
            }
            elderlyMsg.setAreaName(areaName);
        } else if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            //组织管理员
            if (currentUser().getServiceOrgId().indexOf(",") >= 0) {
                elderlyMsg.setServiceOrgIds(currentUser().getServiceOrgId());
            } else {
                elderlyMsg.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
            }

        }
        return elderlyMsgService.getStatisticsByDate(elderlyMsg, startTime, endTime);
    }


    /**
     * 加载老人评估结果列表
     *
     * @return
     */
    @RequestMapping(value = "getAssessAllList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<ElderlyMsg> getAssessAllList(ElderlyMsg elderlyMsg, PageRequest pageRequest) {
        pageRequest.setOrderField("a.id");
        pageRequest.setOrderDir("DESC");
        PageResponse<ElderlyMsg> dataTable = elderlyMsgService.selectAsseAllPageList(elderlyMsg, pageRequest);
        return dataTable;
    }

    /**
     * 上传相关证件
     *
     * @param request
     * @param excel
     * @return
     */
    @RequestMapping("fileUpload")
    @ResponseBody
    public JsonResult fileUpload(HttpServletRequest request, MultipartFile excel) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult fileResult = new JsonResult();
        fileResult = util.saveFile(request, excel, "/file/excel/upload/", false);
        if (fileResult.isSuccess()) {
            result.markSuccess("上传成功！", null);
        } else {
            result.markError("上传失败！");
        }
        return result;
    }


    /**
     * 上传老人头像
     *
     * @param request
     * @param file
     * @return
     */
    @RequestMapping("uploadPhoto")
    @ResponseBody
    public JsonResult uploadPhoto(HttpServletRequest request, MultipartFile file) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        JsonResult fileResult = new JsonResult();
        fileResult = util.saveFile(request, file, "/file/img/elderlyMsg/", false);
        if (fileResult.isSuccess()) {
            result.markSuccess("上传成功！", fileResult.getData().toString());
        } else {
            result.markError("上传失败！");
        }
        return result;
    }

    @RequestMapping(value = "import", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ElderlyMsg> elderlyMsgs = new ArrayList<ElderlyMsg>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            }/*else if("xlsx".equals(suffix)){
                wb = new XSSFWorkbook(is);
            }*/ else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ElderlyMsg elderlyMsg = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                elderlyMsg = new ElderlyMsg();
                // 所属区域
                // 所属区域
                try {
                    String areaName = row.getCell(0).toString();
                    if (!StringUtils.isEmpty(areaName)) {
                        Area area = areaService.getAreaByNameFromCache(areaName);
                        if (ObjectUtils.isNotNull(area)) {
                            elderlyMsg.setAreaId(area.getId());
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行区域有误，请检查后重新添加", i + 1));
                            continue;
                        }
                    } else {
                        b = false;
                        errorReasons.add(String.format("第%d行区域为空，请检查后重新添加", i + 1));
                        continue;
                    }
                } catch (NullPointerException e) {
                    b = false;
                    errorReasons.add(String.format("第%d行区域为空，请检查后重新添加", i + 1));
                    continue;
                }

                try {
                    //所属街道
                    String streetName = row.getCell(1).toString(); //街道
                    if (!StringUtils.isEmpty(streetName)) {
                        Area area = areaService.getAreaByNameFromCache(streetName);
                        if (ObjectUtils.isNotNull(area)) {
                            elderlyMsg.setAreaId(area.getId());
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行街道有误，请检查后重新添加", i + 1));
                            continue;
                        }
                    }
                } catch (NullPointerException e) {

                }

                try {
                    //社区
                    String country = row.getCell(2).toString();
                    if (!StringUtils.isEmpty(country)) {
                        Area area = areaService.getAreaByNameFromCache(country);
                        if (ObjectUtils.isNotNull(area)) {
                            elderlyMsg.setAreaId(area.getId());
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行社区有误，请检查后重新添加", i + 1));
                            continue;
                        }
                    }
                } catch (NullPointerException e) {

                }

                // 姓名
                String elderName = getCellValue(row.getCell(3));
                if (!StringUtils.isEmpty(elderName)) {

                    elderlyMsg.setElderName(elderName);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行老人姓名为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 身份证号
                String idcardno = getCellValue(row.getCell(4));
                if (!StringUtils.isEmpty(idcardno)) {
                    ElderlyMsg elderlyMsg1 = elderlyMsgService.selectByCardNo(idcardno);
                    if (elderlyMsg1 != null) {
                        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
                            elderlyMsg1.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
                            elderlyMsgService.updateByPrimaryKeySelective(elderlyMsg1);
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行身份证号已存在，请检查后重新添加该用户", i + 1));
                        }
                        continue;
                    } else {
                        JsonResult validateResult = myValidateApiController.IDCardValidate(idcardno, "elder");
                        if (validateResult.getMessage().equals("身份证正确")) {
                            ElderlyMsg elderlyMsg2 = (ElderlyMsg) validateResult.getData();
                            elderlyMsg.setIdcardno(idcardno);
                            if(elderlyMsg2.getAge() < 60){
                                b = false;
                                errorReasons.add(String.format("第(%d-1)位老人年龄没有达到60周岁，请检查后重新添加该用户", i + 1));
                                continue;
                            }else{
                                elderlyMsg.setAge(elderlyMsg2.getAge());
                                elderlyMsg.setBirthday(elderlyMsg2.getBirthday());
                                elderlyMsg.setSexDictId(elderlyMsg2.getSexDictId());
                            }
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加该用户", i + 1));
                            continue;
                        }
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 人员类别
                elderlyMsg.setElderTypeDictIds(getCellValue(row.getCell(5)) == "" ? null : getCellValue(row.getCell(5)));
                // 居住地址
                elderlyMsg.setRealAddress(getCellValue(row.getCell(6)) == "" ? null : getCellValue(row.getCell(6)));
                // 住宅电话
                elderlyMsg.setHomeTel(getCellValue(row.getCell(7)) == "" ? null : getCellValue(row.getCell(7)));
                // 移动电话
                elderlyMsg.setMobile(getCellValue(row.getCell(8)) == "" ? null : getCellValue(row.getCell(8)));
                elderlyMsg.setCreateUserId(currentUser().getUid());
                elderlyMsg.setCreateTime(new Date());
                elderlyMsg.setStatus(1);
                elderlyMsg.setIsDeath(1);
                elderlyMsg.setQrCoder(UUID.randomUUID().toString().replace("-", ""));
                if (b) {
                    elderlyMsgs.add(elderlyMsg);
                }
                if (elderlyMsgs.size() == 500) {
                    if (elderlyMsgService.insertSomeElder(elderlyMsgs) > 0) {
                        elderlyMsgs.removeAll(elderlyMsgs);
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
        if (elderlyMsgs.size() > 0 && elderlyMsgService.insertSomeElder(elderlyMsgs) > 0) {
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }

    public ElderlyMsg getAreaInfo(String areaNames, ElderlyMsg elderlyMsg) {
        String tmp = "";
        if (areaNames.indexOf("九") == 0 && areaNames.indexOf("江") == 1) {
            tmp = areaNames;
        } else {
            tmp = "内蒙古市," + areaNames;
        }// 无南京市添加南京市
        String names = "";
        String deptcode = "";
        String[] areaName = tmp.split(",");
        for (int j = 0; j < areaName.length; j++) {
            HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
            Set<Integer> ids = hash.keySet();
            List<Area> areas = new ArrayList<Area>();
            for (Integer id : ids) {
                Area area = (Area) hash.get(id);
                if (area.getName().equals(areaName[j])) {
                    areas.add(area);
                }
            }
            Area area = new Area();
            // 判断list为存在多少数据
            if (areas.size() == 1) {
                area = areas.get(0);
            } else {// 2个及以上
                for (int i = 0; i < areas.size(); i++) {
                    Integer parentId = areas.get(i).getParentId();// 取父级Id
                    for (Integer id : ids) {
                        Area area1 = (Area) hash.get(id);
                        if (parentId.equals(area1.getId())) {// 通过父级Id取缓存Area数据
                            if (area1.getName().equals(areaName[j - 1])) {// 判断父级名称是否与用户所输父级名称相同
                                area = areas.get(i);
                            }
                        }
                    }
                }
            }
            if (area != null) {
                names += area.getName() + ",";
                deptcode += area.getDistrictId();
            }
            if (j == areaName.length - 1) {
                elderlyMsg.setAreaId(area.getId());
            }
        }
        elderlyMsg.setDeptCode(deptcode);
        elderlyMsg.setAreaName(names.substring(0, names.length() - 1));
        return elderlyMsg;
    }

    public static Integer getAreaOrder(String areaName) {
        Integer areaOrder = 0;
        if (areaName.indexOf("海陵区") >= 0) {
            areaOrder = 1;
        } else if (areaName.indexOf("高港区") >= 0) {
            areaOrder = 2;
        } else if (areaName.indexOf("姜堰区") >= 0) {
            areaOrder = 3;
        } else if (areaName.indexOf("医药高新区") >= 0) {
            areaOrder = 4;
        } else if (areaName.indexOf("兴化市") >= 0) {
            areaOrder = 5;
        } else if (areaName.indexOf("靖江市") >= 0) {
            areaOrder = 6;
        } else if (areaName.indexOf("泰兴市") >= 0) {
            areaOrder = 7;
        }
        return areaOrder;
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

    @RequestMapping(value = "importJiuYe", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importJiuYeExcel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<JiuYe> jiuYes = new ArrayList<>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            }/*else if("xlsx".equals(suffix)){
                wb = new XSSFWorkbook(is);
            }*/ else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            JiuYe jiuYe = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                jiuYe = new JiuYe();
                // 所属区域
                // 所属区域
                jiuYe.setAreaName(getCellValue(row.getCell(0)) == "" ? null : getCellValue(row.getCell(0)));

                // 姓名
                String name = getCellValue(row.getCell(1));
                if (!StringUtils.isEmpty(name)) {

                    jiuYe.setName(name);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行老人姓名为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                jiuYe.setServiceOrgName(getCellValue(row.getCell(2)) == "" ? null : getCellValue(row.getCell(2)));

                // 身份证号
                String cardNo = getCellValue(row.getCell(3));
                if (!StringUtils.isEmpty(cardNo)) {
//                    JiuYe jiuYe1 = jiuYeService.selectByCardNo(cardNo);
//                    if (jiuYe1 != null) {
//                        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
//                            jiuYeService.updateByPrimaryKeySelective(jiuYe1);
//                        } else {
//                            b = false;
//                            errorReasons.add(String.format("第%d行身份证号已存在，请检查后重新添加该用户", i + 1));
//                        }
//                        continue;
//                    } else {
                        JsonResult validateResult = myValidateApiController.IDCardValidate(cardNo, "elder");
                            JiuYe jiuYe2 = (JiuYe) validateResult.getData();
                            jiuYe.setCardNo(cardNo);
//                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 联系电话
                jiuYe.setMobile(getCellValue(row.getCell(4)) == "" ? null : getCellValue(row.getCell(4)));

                jiuYe.setBuTieMoney(getCellValue(row.getCell(5)) == "" ? null : getCellValue(row.getCell(5)));

                jiuYe.setOverTime(getCellValue(row.getCell(6)) == "" ? null : getCellValue(row.getCell(6)));

                jiuYe.setRemarks(getCellValue(row.getCell(7)) == "" ? null : getCellValue(row.getCell(7)));
                if (b) {
                    jiuYes.add(jiuYe);
                }
                if (jiuYes.size() == 500) {
                    if (jiuYeService.insertSomeElder(jiuYes) > 0) {
                        jiuYes.removeAll(jiuYes);
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
        if (jiuYes.size() > 0 && jiuYeService.insertSomeElder(jiuYes) > 0) {
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }

    public JiuYe getAreaInfo(String areaNames, JiuYe jiuYe) {
        String tmp = "";
        if (areaNames.indexOf("九") == 0 && areaNames.indexOf("江") == 1) {
            tmp = areaNames;
        } else {
            tmp = "内蒙古市," + areaNames;
        }// 无南京市添加南京市
        String names = "";
        String deptcode = "";
        String[] areaName = tmp.split(",");
        for (int j = 0; j < areaName.length; j++) {
            HashMap<Integer, Area> hash = redisAreaUtil.getHasMap();
            Set<Integer> ids = hash.keySet();
            List<Area> areas = new ArrayList<Area>();
            for (Integer id : ids) {
                Area area = (Area) hash.get(id);
                if (area.getName().equals(areaName[j])) {
                    areas.add(area);
                }
            }
            Area area = new Area();
            // 判断list为存在多少数据
            if (areas.size() == 1) {
                area = areas.get(0);
            } else {// 2个及以上
                for (int i = 0; i < areas.size(); i++) {
                    Integer parentId = areas.get(i).getParentId();// 取父级Id
                    for (Integer id : ids) {
                        Area area1 = (Area) hash.get(id);
                        if (parentId.equals(area1.getId())) {// 通过父级Id取缓存Area数据
                            if (area1.getName().equals(areaName[j - 1])) {// 判断父级名称是否与用户所输父级名称相同
                                area = areas.get(i);
                            }
                        }
                    }
                }
            }
            if (area != null) {
                names += area.getName() + ",";
                deptcode += area.getDistrictId();
            }
//            if (j == areaName.length - 1) {
//                jiuYe.setAreaId(area.getId());
//            }
        }
//        elderlyMsg.setDeptCode(deptcode);
        jiuYe.setAreaName(names.substring(0, names.length() - 1));
        return jiuYe;
    }

//    public static Integer getAreaOrder(String areaName) {
//        Integer areaOrder = 0;
//        if (areaName.indexOf("海陵区") >= 0) {
//            areaOrder = 1;
//        } else if (areaName.indexOf("高港区") >= 0) {
//            areaOrder = 2;
//        } else if (areaName.indexOf("姜堰区") >= 0) {
//            areaOrder = 3;
//        } else if (areaName.indexOf("医药高新区") >= 0) {
//            areaOrder = 4;
//        } else if (areaName.indexOf("兴化市") >= 0) {
//            areaOrder = 5;
//        } else if (areaName.indexOf("靖江市") >= 0) {
//            areaOrder = 6;
//        } else if (areaName.indexOf("泰兴市") >= 0) {
//            areaOrder = 7;
//        }
//        return areaOrder;
//    }


    @RequestMapping(value = "importDeath", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importDeathExcel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ElderlyMsg> updateElderlyMsgs = new ArrayList<ElderlyMsg>();
        List<ElderlyMsg> addElderlyMsgs = new ArrayList<ElderlyMsg>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            }/*else if("xlsx".equals(suffix)){
                wb = new XSSFWorkbook(is);
            }*/ else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ElderlyMsg updateElderlyMsg = null;
            ElderlyMsg addElderlyMsg = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                updateElderlyMsg = new ElderlyMsg();
                addElderlyMsg = new ElderlyMsg();
                // 所属区域
                String areaNames = getCellValue(row.getCell(0));
                if (!StringUtils.isEmpty(areaNames)) {
                    ElderlyMsg eld = getAreaInfo(areaNames, addElderlyMsg);
                    addElderlyMsg.setAreaId(eld.getAreaId());
                    addElderlyMsg.setAreaName(eld.getAreaName());
                    addElderlyMsg.setDeptCode(eld.getDeptCode());
                    addElderlyMsg.setAreaOrder(getAreaOrder(eld.getAreaName()));
                    if (areaNames.equals("非南京户籍")) {
                        addElderlyMsg.setAreaId(2000);
                        addElderlyMsg.setDeptCode("3202");
                        addElderlyMsg.setAreaName(areaNames);
                        addElderlyMsg.setAreaOrder(getAreaOrder(areaNames));
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行所属区域为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 姓名
                String elderName = getCellValue(row.getCell(1));
                if (!StringUtils.isEmpty(elderName)) {
                    addElderlyMsg.setElderName(elderName);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行老人姓名为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                // 身份证号
                String idcardno = getCellValue(row.getCell(2));
                // 居住地址
                String realAddress = getCellValue(row.getCell(3));
                addElderlyMsg.setRealAddress(realAddress);
                // 去世时间
                if (getCellValue(row.getCell(4)) != null && getCellValue(row.getCell(4)) != "") {
                    Date deathTime = df.parse(getCellValue(row.getCell(4)));
                    updateElderlyMsg.setDeathTime(deathTime);
                    addElderlyMsg.setDeathTime(deathTime);
                }
                // 火化时间
                if (getCellValue(row.getCell(5)) != null && getCellValue(row.getCell(5)) != "") {
                    Date cremationTime = df.parse(getCellValue(row.getCell(5)));
                    updateElderlyMsg.setCremationTime(cremationTime);
                    addElderlyMsg.setCremationTime(cremationTime);
                }
                if (!StringUtils.isEmpty(idcardno)) {
                    ElderlyMsg elderlyMsg1 = elderlyMsgService.selectByCardNo(idcardno);
                    if (elderlyMsg1 != null) {
                        updateElderlyMsg.setId(elderlyMsg1.getId());
                    } else {
                        JsonResult validateResult = myValidateApiController.IDCardValidate(idcardno, "elder");
                        if (validateResult.getMessage().equals("身份证正确")) {
                            ElderlyMsg elderlyMsg2 = (ElderlyMsg) validateResult.getData();
                            addElderlyMsg.setIdcardno(idcardno);
                            addElderlyMsg.setAge(elderlyMsg2.getAge());
                            addElderlyMsg.setBirthday(elderlyMsg2.getBirthday());
                            addElderlyMsg.setSexDictId(elderlyMsg2.getSexDictId());
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加该用户", i + 1));
                            continue;
                        }
                        addElderlyMsg.setIsDeath(0);
                        addElderlyMsg.setStatus(1);
                        if (b) {
                            addElderlyMsgs.add(addElderlyMsg);
                            continue;
                        }
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                updateElderlyMsg.setIsDeath(0);
                updateElderlyMsg.setStatus(1);
                if (b) {
                    updateElderlyMsgs.add(updateElderlyMsg);
                }
                if (addElderlyMsgs.size() == 500) {
                    if (elderlyMsgService.insertSomeElder(addElderlyMsgs) > 0) {
                        addElderlyMsgs.removeAll(addElderlyMsgs);
                        result.markSuccess("导入成功", null);
                        result.setData(errorReasons);
                    } else {
                        result.markError("导入失败");
                        result.setData(errorReasons);
                    }
                }
                if (updateElderlyMsgs.size() == 500) {
                    if (elderlyMsgService.updateSomeElder(updateElderlyMsgs) > 0) {
                        updateElderlyMsgs.removeAll(updateElderlyMsgs);
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
        if (!addElderlyMsgs.isEmpty()) {
            if (addElderlyMsgs.size() > 0 && elderlyMsgService.insertSomeElder(addElderlyMsgs) > 0) {
                result.markSuccess("导入成功", null);
                result.setData(errorReasons);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
        }

        if (!updateElderlyMsgs.isEmpty()) {
            if (updateElderlyMsgs.size() > 0 && elderlyMsgService.updateSomeElder(updateElderlyMsgs) > 0) {
                result.markSuccess("导入成功", null);
                result.setData(errorReasons);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
        }

        return result;
    }

    @RequestMapping(value = "importDeath1", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importDeath1Excel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ElderlyMsg> updateElderlyMsgs = new ArrayList<ElderlyMsg>();
        List<ElderlyMsg> addElderlyMsgs = new ArrayList<ElderlyMsg>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            }/*else if("xlsx".equals(suffix)){
                wb = new XSSFWorkbook(is);
            }*/ else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ElderlyMsg updateElderlyMsg = null;
            ElderlyMsg addElderlyMsg = null;
            for (int i = 5; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                updateElderlyMsg = new ElderlyMsg();
                addElderlyMsg = new ElderlyMsg();

                // 所属区域
                String areaNames = getCellValue(row.getCell(20));
                if (!StringUtils.isEmpty(areaNames)) {
                    ElderlyMsg eld = getAreaInfo(areaNames, addElderlyMsg);
                    addElderlyMsg.setAreaId(eld.getAreaId());
                    addElderlyMsg.setAreaName(eld.getAreaName());
                    addElderlyMsg.setDeptCode(eld.getDeptCode());
                    addElderlyMsg.setAreaOrder(getAreaOrder(eld.getAreaName()));
                    if (areaNames.equals("非鞍山户籍")) {
                        addElderlyMsg.setAreaId(2000);
                        addElderlyMsg.setDeptCode("3202");
                        addElderlyMsg.setAreaName(areaNames);
                        addElderlyMsg.setAreaOrder(getAreaOrder(areaNames));
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行所属区域为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 姓名
                String elderName = getCellValue(row.getCell(6)) == "" ? null : getCellValue(row.getCell(6));
                addElderlyMsg.setElderName(elderName);

                // 身份证号
                String idcardno = getCellValue(row.getCell(5));
                // 居住地址
                String realAddress = getCellValue(row.getCell(10));
                addElderlyMsg.setRealAddress(realAddress);
                /*// 去世时间
                if (getCellValue(row.getCell(4)) != null && getCellValue(row.getCell(4)) != "") {
                    Date deathTime = df.parse(getCellValue(row.getCell(4)));
                    updateElderlyMsg.setDeathTime(deathTime);
                    addElderlyMsg.setDeathTime(deathTime);
                }*/
                // 火化时间
                Date cremationTime = new Date();
                if (getCellValue(row.getCell(1)) != null && getCellValue(row.getCell(1)) != "") {
                    cremationTime = df.parse(getCellValue(row.getCell(1)));
                    updateElderlyMsg.setCremationTime(cremationTime);
                    addElderlyMsg.setCremationTime(cremationTime);
                }

                // 火化单位
                String cremationUnit = getCellValue(row.getCell(16)) == "" ? null : getCellValue(row.getCell(16));
                updateElderlyMsg.setCremationUnit(cremationUnit);
                addElderlyMsg.setCremationUnit(cremationUnit);

                if (!StringUtils.isEmpty(idcardno)) {
                    ElderlyMsg elderlyMsg1 = elderlyMsgService.selectByCardNo(idcardno);
                    if (elderlyMsg1 != null) {
                        updateElderlyMsg.setId(elderlyMsg1.getId());
                        // 卒年
                        SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
                        String birthday = idcardno.substring(6, 10) + "-" + idcardno.substring(10, 12) + "-" + idcardno.substring(12, 14);
                        int nAge = getAge(sFormat.parse(birthday), cremationTime);
                        updateElderlyMsg.setAge(nAge);
                    } else {
                        JsonResult validateResult = myValidateApiController.IDCardValidate(idcardno, "elder");
                        if (validateResult.getMessage().equals("身份证正确")) {
                            ElderlyMsg elderlyMsg2 = (ElderlyMsg) validateResult.getData();
                            addElderlyMsg.setIdcardno(idcardno);
                            addElderlyMsg.setBirthday(elderlyMsg2.getBirthday());
                            addElderlyMsg.setSexDictId(elderlyMsg2.getSexDictId());
                            // 卒年
                            SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
                            String birthday = idcardno.substring(6, 10) + "-" + idcardno.substring(10, 12) + "-" + idcardno.substring(12, 14);
                            int nAge = getAge(sFormat.parse(birthday), cremationTime);
                            addElderlyMsg.setAge(nAge);
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加该用户", i + 1));
                            continue;
                        }
                        addElderlyMsg.setIsDeath(0);
                        addElderlyMsg.setStatus(1);
                        if (b) {
                            addElderlyMsgs.add(addElderlyMsg);
                            continue;
                        }
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                updateElderlyMsg.setIsDeath(0);
                updateElderlyMsg.setStatus(1);
                if (b) {
                    updateElderlyMsgs.add(updateElderlyMsg);
                }
                if (addElderlyMsgs.size() == 500) {
                    if (elderlyMsgService.insertSomeElder(addElderlyMsgs) > 0) {
                        addElderlyMsgs.removeAll(addElderlyMsgs);
                        result.markSuccess("导入成功", null);
                        result.setData(errorReasons);
                    } else {
                        result.markError("导入失败");
                        result.setData(errorReasons);
                    }
                }
                if (updateElderlyMsgs.size() == 500) {
                    if (elderlyMsgService.updateSomeElder(updateElderlyMsgs) > 0) {
                        updateElderlyMsgs.removeAll(updateElderlyMsgs);
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
        if (!addElderlyMsgs.isEmpty()) {
            if (addElderlyMsgs.size() > 0 && elderlyMsgService.insertSomeElder(addElderlyMsgs) > 0) {
                result.markSuccess("导入成功", null);
                result.setData(errorReasons);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
        }

        if (!updateElderlyMsgs.isEmpty()) {
            if (updateElderlyMsgs.size() > 0 && elderlyMsgService.updateSomeElder(updateElderlyMsgs) > 0) {
                result.markSuccess("导入成功", null);
                result.setData(errorReasons);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
        }

        return result;
    }

    @RequestMapping(value = "importDeath2", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importDeath2Excel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ElderlyMsg> updateElderlyMsgs = new ArrayList<ElderlyMsg>();
        List<ElderlyMsg> addElderlyMsgs = new ArrayList<ElderlyMsg>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            }/*else if("xlsx".equals(suffix)){
                wb = new XSSFWorkbook(is);
            }*/ else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            ElderlyMsg updateElderlyMsg = null;
            ElderlyMsg addElderlyMsg = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                updateElderlyMsg = new ElderlyMsg();
                addElderlyMsg = new ElderlyMsg();
                // 所属区域
                String areaNames = getCellValue(row.getCell(0));
                if (!StringUtils.isEmpty(areaNames)) {
                    ElderlyMsg eld = getAreaInfo(areaNames, addElderlyMsg);
                    addElderlyMsg.setAreaId(eld.getAreaId());
                    addElderlyMsg.setAreaName(eld.getAreaName());
                    addElderlyMsg.setDeptCode(eld.getDeptCode());
                    addElderlyMsg.setAreaOrder(getAreaOrder(eld.getAreaName()));
                    if (areaNames.equals("非鞍山户籍")) {
                        addElderlyMsg.setAreaId(2000);
                        addElderlyMsg.setDeptCode("3202");
                        addElderlyMsg.setAreaName(areaNames);
                        addElderlyMsg.setAreaOrder(getAreaOrder(areaNames));
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行所属区域为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 姓名
                String elderName = getCellValue(row.getCell(1)) == "" ? null : getCellValue(row.getCell(1));
                addElderlyMsg.setElderName(elderName);
                // 身份证号
                String idcardno = getCellValue(row.getCell(2));
                // 居住地址
                String realAddress = getCellValue(row.getCell(3));
                addElderlyMsg.setRealAddress(realAddress);
                // 去世时间
                if (getCellValue(row.getCell(4)) != null && getCellValue(row.getCell(4)) != "") {
                    Date deathTime = df.parse(getCellValue(row.getCell(4)));
                    updateElderlyMsg.setDeathTime(deathTime);
                    addElderlyMsg.setDeathTime(deathTime);
                }
                // 火化时间
                if (getCellValue(row.getCell(5)) != null && getCellValue(row.getCell(5)) != "") {
                    Date cremationTime = df.parse(getCellValue(row.getCell(5)));
                    updateElderlyMsg.setCremationTime(cremationTime);
                    addElderlyMsg.setCremationTime(cremationTime);
                }
                // 卒年
                int age = getCellValue(row.getCell(6)) == "" ? null : Integer.parseInt(getCellValue(row.getCell(6)));
                addElderlyMsg.setAge(age);
                updateElderlyMsg.setAge(age);

                // 殡葬单位
                String cremationUnit = getCellValue(row.getCell(7)) == "" ? null : getCellValue(row.getCell(7));
                updateElderlyMsg.setCremationUnit(cremationUnit);
                addElderlyMsg.setCremationUnit(cremationUnit);
                // 殡葬方式
                String funeralmode = getCellValue(row.getCell(8)) == "" ? null : getCellValue(row.getCell(7));
                updateElderlyMsg.setFuneralmode(funeralmode);
                addElderlyMsg.setFuneralmode(funeralmode);

                if (!StringUtils.isEmpty(idcardno)) {
                    ElderlyMsg elderlyMsg1 = elderlyMsgService.selectByCardNo(idcardno);
                    if (elderlyMsg1 != null) {
                        updateElderlyMsg.setId(elderlyMsg1.getId());
                    } else {
                        JsonResult validateResult = myValidateApiController.IDCardValidate(idcardno, "elder");
                        if (validateResult.getMessage().equals("身份证正确")) {
                            ElderlyMsg elderlyMsg2 = (ElderlyMsg) validateResult.getData();
                            addElderlyMsg.setIdcardno(idcardno);
                            addElderlyMsg.setBirthday(elderlyMsg2.getBirthday());
                            addElderlyMsg.setSexDictId(elderlyMsg2.getSexDictId());
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加该用户", i + 1));
                            continue;
                        }
                        addElderlyMsg.setIsDeath(0);
                        addElderlyMsg.setStatus(1);
                        if (b) {
                            addElderlyMsgs.add(addElderlyMsg);
                            continue;
                        }
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                updateElderlyMsg.setIsDeath(0);
                updateElderlyMsg.setStatus(1);
                if (b) {
                    updateElderlyMsgs.add(updateElderlyMsg);
                }
                if (addElderlyMsgs.size() == 500) {
                    if (elderlyMsgService.insertSomeElder(addElderlyMsgs) > 0) {
                        addElderlyMsgs.removeAll(addElderlyMsgs);
                        result.markSuccess("导入成功", null);
                        result.setData(errorReasons);
                    } else {
                        result.markError("导入失败");
                        result.setData(errorReasons);
                    }
                }
                if (updateElderlyMsgs.size() == 500) {
                    if (elderlyMsgService.updateSomeElder(updateElderlyMsgs) > 0) {
                        updateElderlyMsgs.removeAll(updateElderlyMsgs);
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
        if (!addElderlyMsgs.isEmpty()) {
            if (addElderlyMsgs.size() > 0 && elderlyMsgService.insertSomeElder(addElderlyMsgs) > 0) {
                result.markSuccess("导入成功", null);
                result.setData(errorReasons);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
        }

        if (!updateElderlyMsgs.isEmpty()) {
            if (updateElderlyMsgs.size() > 0 && elderlyMsgService.updateSomeElder(updateElderlyMsgs) > 0) {
                result.markSuccess("导入成功", null);
                result.setData(errorReasons);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
        }

        return result;
    }

    /**
     * 公安数据导入
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "import2", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel2(@RequestParam("file") MultipartFile file) throws Exception {
        JsonResult result = new JsonResult();
        if (elderlyMsgService.importElderMes(file.getInputStream())) {
            result.markSuccess("导入成功", null);
        } else {
            result.markError("导入失败");
        }
        return result;
    }


    /**
     * 各类老人数量
     *
     * @return
     */
    @RequestMapping(value = "getCountByElderTypeDictIds", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, List<Long>> getCountByElderTypeDictIds() {
        ElderlyMsg elderlyMsg = new ElderlyMsg();
        Area area = areaService.selectByPrimaryKey(currentUser().getAreaId());
        HashMap<String, List<Long>> map = new HashMap<>();
        if (area.getLevel() == 1) {
            map = elderlyMsgService.getCountByAreaAndelderTypeDictIdsFromCache(elderlyMsg);
        } else {
            map = elderlyMsgService.getCountByAreaAndelderTypeDictIds(area.getId());
        }
        return map;
    }

    /**
     * 发送提示信息给老人
     *
     * @return
     */
    @RequestMapping(value = "sendElderTipByMobile", method = RequestMethod.POST)
    @ResponseBody
    public AppResult sendElderTipByMobile(HttpServletRequest request, String ids) {
        AppResult result = new AppResult();
        List<Integer> elderIds = new ArrayList<>();
        String[] idStr = ids.split(",");
        for (String s : idStr) {
            elderIds.add(Integer.parseInt(s));
        }
        List<ElderlyMsg> elderlyMsgs = elderlyMsgService.selectBySomeId(elderIds);
        if (elderlyMsgService.sendMessageToElders(elderlyMsgs, "", request.getRemoteHost())) {
            result.markSuccess("提醒成功", null);
        } else {
            result.markError();
        }
        return result;
    }


    /**
     * 获取新增和提档老人（79到80,89到90，99到100）
     *
     * @return
     */
    @RequestMapping(value = "getAddAndUpElder", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject getAddAndUpElder(ElderlyMsg filter) {
        JSONObject result = new JSONObject();
        List<ElderlyMsg> elderlyMsgs = elderlyMsgService.getAddAndUpElder(filter);
        result.put("draw", 0);
        result.put("error", "");
        result.put("recordsFiltered", elderlyMsgs.size());
        result.put("recordsTotal", elderlyMsgs.size());
        JSONArray ja = new JSONArray();
        JSONObject data = null;
        for (ElderlyMsg e : elderlyMsgs) {
            data = new JSONObject();
            data.put("id", e.getId());
            data.put("region1", e.getAreaName());
            data.put("elderName", e.getElderName());
            data.put("idcardno", e.getIdcardno());
            data.put("age", e.getAge());
            data.put("sexDictId", e.getSexDictId());
            data.put("elderTypeDictIds", e.getElderTypeDictIds());
            data.put("realAddress", e.getRealAddress());
            data.put("mobile", e.getMobile());
            ja.add(data);
        }
        result.put("data", ja);
        return result;
    }


    @RequestMapping(value = "getAddAndUpElderInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, List<Integer>> getAddAndUpElderInfo() {
//        return (Map<String, List<Integer>>) EHCacheUtil.getStatisticData(StatisticDataQuantity.STATISTIC_AREA_ADDANDUPZLYELDER);
        return null;

    }


    /**
     * 导出还有一月快到80岁的老人
     *
     * @param filter
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("exportNeedNoticeElder")
    @SystemControllerLog(description = "导出还有一月快到80岁的老人")
    public void export(ElderlyMsg filter, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        List<ElderlyMsg> elderlyMsgs = elderlyMsgService.getAddAndUpElder(filter);
        response.setContentType("octets/stream");
        String fileName = "快到" + (filter.getAge() + 1) + "岁的老人.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<ElderlyMsg> ex = new ExportExcel<>();
        String[] headers = {"所在区域", "姓名", "身份证号", "年龄", "性别", "人员类别", "居住地址", "移动电话"};
        String[] fieldNames = {"areaName", "elderName", "idcardno", "age", "sexDictId", "elderTypeDictIds", "realAddress", "mobile"};
        ex.exportExcel(fileName, headers, fieldNames, elderlyMsgs, out, "yyyy-MM-dd");
        out.close();
    }


    public static int getAge(Date birthDate, Date creationTime) {

        int age = 0;

        SimpleDateFormat format_y = new
                SimpleDateFormat("yyyy");
        SimpleDateFormat format_M = new
                SimpleDateFormat("MM");
        SimpleDateFormat format_d = new
                SimpleDateFormat("dd");

        String birth_year =
                format_y.format(birthDate);
        String creation_year =
                format_y.format(creationTime);

        String birth_month =
                format_M.format(birthDate);
        String creation_month =
                format_M.format(creationTime);

        String birth_day =
                format_d.format(birthDate);
        String creation_day =
                format_d.format(creationTime);

        // 初步，估算
        age = Integer.parseInt(creation_year) - Integer.parseInt(birth_year);

        // 如果未到出生月份，则age - 1
        if (birth_month.compareTo(creation_month) >= 0) {
            // 如果到出生月份，未到出生日期 ，则age-1
            if (birth_month.compareTo(creation_month) == 0) {
                if (birth_day.compareTo(creation_day) > 0) {
                    age -= 1;
                }
            } else {
                age -= 1;
            }
        }

        if (age < 0) {
            age = 0;
        }
        return age;
    }


    /**
     * 添加老人评价信息
     *
     * @param elderlyAssessment
     * @return
     */
    @RequestMapping(value = "addAssess", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "加老人评价信息")
    public JsonResult AddAssess(ElderlyAssessment elderlyAssessment) {
        JsonResult result = new JsonResult();
        elderlyAssessment.setCreateDate(new Date());
        elderlyAssessment.setStatus(1);
        if (elderlyAssessmentService.insertAss(elderlyAssessment)) {
            result.markSuccess("保存成功", null);
        } else {
            result.markError("保存失败");
        }
        return result;
    }

    /**
     * 获取评估检查列表
     *
     * @param assessCheck
     * @return
     */
    @RequestMapping(value = "assessCheck/List", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取评估检查列表")
    public JSONObject getAssessCheckList(ElderAssessCheck assessCheck) {
        JSONObject jo = new JSONObject();
        List<ElderAssessCheck> assessChecks = elderAssessCheckService.getAllRecode(assessCheck);
        JSONArray ja = new JSONArray();
        for (ElderAssessCheck e : assessChecks) {
            JSONObject object = new JSONObject();
            object.put("id", e.getId());
            object.put("checkContent", e.getCheckContent());
            object.put("checkResult", e.getCheckResult());
            object.put("checkTime", e.getCheckTime());
            ja.add(object);
        }
        jo.put("data", ja);
        return jo;
    }

    @RequestMapping(value = "assessCheck/add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加评估检查")
    public JsonResult AddAssessCheckList(ElderAssessCheck assessCheck, String time) {
        JsonResult result = new JsonResult();
        if (!StringUtils.isEmpty(time)) {
            try {
                assessCheck.setCheckTime(df.parse(time));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (elderAssessCheckService.insert(assessCheck)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }

        return result;
    }

    @RequestMapping(value = "ggimport", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public JsonResult ggimportExcel(@RequestParam("ggfile") MultipartFile file) throws Exception {
        JsonResult result = new JsonResult();
        List<ElderlyMsg> elderlyMsgs = new ArrayList<ElderlyMsg>();
        List<ElderLinkMan> elderLinkManList = new ArrayList<ElderLinkMan>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            } else if ("xlsx".equals(suffix)) {
                wb = new XSSFWorkbook(is);
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            for (int i = 0; i < sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                String idCard = row.getCell(0).toString().trim();
                String machCard = row.getCell(1).toString().trim();
                String phone = row.getCell(2).toString().trim();
                //根据id查询人员编号
                ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idCard);
                ServiceOrgNurseElderly serviceOrgNurseElderly = new ServiceOrgNurseElderly();
                serviceOrgNurseElderly.setDeviceName("手环");
                serviceOrgNurseElderly.setDeviceNumber(machCard);
                List<ServiceOrgNurseElderly> lists = serviceOrgNurseElderlyService.selectPageList(serviceOrgNurseElderly, new PageRequest()).getData();
                if (lists != null && elderlyMsg != null) {
                    ServiceOrgNurseElderly service = lists.get(0);
                    service.setElderId(elderlyMsg.getId());
                    serviceOrgNurseElderlyService.updateByPrimaryKeySelective(service);
                }
            }
            result.markSuccess("关系表插入成功", null);
            return result;
        }
        return result;
    }
    @RequestMapping(value = "getElderByPhone", method = RequestMethod.POST)
    @ResponseBody
    public ElderlyMsg getElderByPhone(String phone) {
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPhone(phone);
        return elderlyMsg;
    }
}

