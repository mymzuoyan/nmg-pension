package com.fedtech.pension.controller.admin.elderly;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.*;
import com.fedtech.pension.elderly.quantity.GovBuyApplyStepQuantity;
import com.fedtech.pension.elderly.service.*;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.entity.ServiceOrgSocialDonation;
import com.fedtech.pension.org.entity.ServiceOrgSocialWork;
import com.fedtech.pension.org.service.ServiceOrgRecreationalActivitiesService;
import com.fedtech.pension.org.service.ServiceOrgSocialDonationService;
import com.fedtech.pension.org.service.ServiceOrgSocialWorkService;
import com.fedtech.pension.redis.RedisAreaUtil;
import com.fedtech.pension.sys.entity.Area;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/11
 */
@Controller
@RequestMapping("/admin/api/elderly/govbuy/")
public class ElderLyGovBuyApiController extends BaseController {


    @Reference(version = "1.0.0")
    private ElderlyGovBuyService elderlyGovBuyService;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyService elderlyGovbuyApplyService;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyDocService elderlyGovbuyApplyDocService;

    @Reference(version = "1.0.0")
    private ElderlyGovbuyApplyHandleService elderlyGovbuyApplyHandleService;

    @Reference(version = "1.0.0")
    private ServiceOrgRecreationalActivitiesService serviceOrgRecreationalActivitiesService;

    @Reference(version = "1.0.0")
    private ServiceOrgSocialWorkService serviceOrgSocialWorkService;

    @Reference(version = "1.0.0")
    private ServiceOrgSocialDonationService serviceOrgSocialDonationService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Autowired
    private RedisAreaUtil redisAreaUtil;

    /**
     * 获取政府购买信息列表
     *
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取政府购买信息列表")
    public PageResponse<ElderlyGovBuy> getElerInfo(ElderlyGovBuy govBuy, PageRequest pageRequest) {
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
            govBuy.setAreaName(areaName);

        } else if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            //组织管理员
            govBuy.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        PageResponse<ElderlyGovBuy> dataTable = elderlyGovBuyService.selectPageList(govBuy, pageRequest);
        return dataTable;
    }
    /**
     * 获取政府购买信息列表
     *
     * @return
     */
    @RequestMapping(value = "listHandle", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取政府购买信息待审列表")
    public PageResponse<ElderlyGovBuy> getElerInfoHandle(ElderlyGovBuy govBuy, PageRequest pageRequest) {
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
            govBuy.setAreaName(areaName);

        } else if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
            //组织管理员
            govBuy.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
        }
        PageResponse<ElderlyGovBuy> dataTable = elderlyGovBuyService.selectHandlePageList(govBuy, pageRequest);
        return dataTable;
    }

    /**
     * 加载老人基础字段信息list
     *
     * @return
     */
    @RequestMapping(value = "export")
    @SystemControllerLog(description = "导出政府购买信息列表")
    public void export(ElderlyGovBuy govBuy, PageRequest pageRequest, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        PageResponse<ElderlyGovBuy> dataTable = getElerInfo(govBuy, pageRequest);
        response.setContentType("octets/stream");
        String fileName = "政府购买老人列表.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<ElderlyGovBuy> ex = new ExportExcel<>();
        String[] headers = {"所在区域", "所在组织", "姓名", "年龄", "性别", "子女状况",
                "居住状况", "居住地址", "移动电话", "终端服务商", "状态", "安装费",
                "终端类型", "市", "区", "街道", "社区（村）", "合计", "状态"};
        String[] fieldNames = {"areaName", "serviceOrgName", "elderName", "age", "sexDictId", "childrenDictId",
                "residenceDictId", "realAddress", "homeTel", "callerlabel", "callerstatus", "callerinitfee",
                "callertype", "city", "area", "street", "village", "subsidy", "status"};
        ex.exportExcel(fileName, headers, fieldNames, dataTable.getData(), out, "yyyy-MM-dd");
        out.close();
    }

    /************************************** 政府购买服务申请流程 start*********************************／
     /**
     * 政府购买服务申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "apply/add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "政府购买服务申请")
    public JsonResult addElderGovBuyApply(ElderlyGovbuyApply apply) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(apply.getIdcardno())) {
            result.markError("身份证号码不能为空");
            return result;
        }
        apply.setCreatorId(currentUser().getUid());
        apply.setCreateTime(new Date());
        if (elderlyGovbuyApplyService.insert(apply)) {
            result.markSuccess("政府购买服务申请成功", null);
        } else {
            result.markError("政府购买服务申请失败");
        }
        return result;
    }


    /**
     * 政府购买服务申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "apply/update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "政府购买服务申请")
    public JsonResult updateElderGovBuyApply(ElderlyGovbuyApply apply) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(apply.getIdcardno())) {
            result.markError("身份证号码不能为空");
            return result;
        }
        if (elderlyGovbuyApplyService.updateByPrimaryKeySelective(apply)) {
            result.markSuccess("政府购买服务更新成功", null);
        } else {
            result.markError("政府购买服务更新失败");
        }
        return result;
    }

    /**
     * 政府购买服务列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "apply/list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "政府购买服务列表")
    public PageResponse<ElderlyGovbuyApply> showElderGovBuyApplyList(ElderlyGovbuyApply filter, PageRequest pageRequest) {
        Subject subject = getCurrentUser();
        Area a = (Area) redisAreaUtil.getArea(currentUser().getAreaId());
        if (subject.hasRole(RoleType.StAdmin.getValue())) {
            filter.setRegion2(a.getName());
        } else if (subject.hasRole(RoleType.ReAdmin.getValue())) {
            filter.setRegion1(a.getName());
        } else if (subject.hasRole(RoleType.AssessAdmin.getValue())) {
            filter.setRegion1(a.getName());
        }
        return elderlyGovbuyApplyService.selectPageList(filter, pageRequest);
    }

    /**
     * 政府购买服务待办列表
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "apply/handle/list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "政府购买服务待办列表")
    public PageResponse<ElderlyGovbuyApply> showElderGovBuyHandleList(ElderlyGovbuyApply filter, PageRequest pageRequest) {
        Subject subject = getCurrentUser();
        Area a = (Area) redisAreaUtil.getArea(currentUser().getAreaId());
        if (subject.hasRole(RoleType.StAdmin.getValue())) {
            String selectStatus = StringUtils.join(GovBuyApplyStepQuantity.JDNEEDHANDLEAPPLYSTATUS, ",");

            filter.setSelectStatus(selectStatus);
            filter.setRegion2(a.getName());
        } else if (subject.hasRole(RoleType.ReAdmin.getValue())) {
            String selectStatus = StringUtils.join(GovBuyApplyStepQuantity.QUNEEDHANDLEAPPLYSTATUS, ",");
            filter.setSelectStatus(selectStatus);
            filter.setRegion1(a.getName());
        } else if (subject.hasRole(RoleType.AssessAdmin.getValue())) {
            String selectStatus = GovBuyApplyStepQuantity.QUSHENHETONGGUO + "";
            filter.setSelectStatus(selectStatus);
            filter.setAssessOrgId(currentUser().getAssessOrgId());
        } else {
            return null;
        }
        return elderlyGovbuyApplyService.selectPageList(filter, pageRequest);
    }

    /**
     * 处理政府购买服务申请
     *
     * @param apply
     * @param doc
     * @return
     */
    @RequestMapping(value = "apply/handleGovBuyApply", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "处理政府购买服务申请")
    public JsonResult handleGovBuyApply(ElderlyGovbuyApply apply, ElderlyGovbuyApplyDoc doc) {
        JsonResult result = new JsonResult();
        doc.setCreateTime(new Date());
        if (elderlyGovbuyApplyService.handleGovBuyApply(apply, doc, currentUser())) {
            result.markSuccess("处理政府购买服务申请成功", null);
        } else {
            result.markError("处理政府购买服务申请失败");
        }
        return result;
    }

    /**
     * 获取相关文书
     *
     * @param applyId
     * @return
     */
    @RequestMapping(value = "apply/getDocsByApplyId", method = RequestMethod.POST)
    @ResponseBody
    public List<ElderlyGovbuyApplyDoc> getDocsByApplyId(Integer applyId) {
        ElderlyGovbuyApplyDoc doc = new ElderlyGovbuyApplyDoc();
        doc.setApplyId(applyId);
        return elderlyGovbuyApplyDocService.getAllRecode(doc);
    }


    /**
     * 获取相关处理流程
     *
     * @param applyId
     * @return
     */
    @RequestMapping(value = "apply/getHandlesByApplyId", method = RequestMethod.POST)
    @ResponseBody
    public List<ElderlyGovbuyApplyHandle> getHandlesByApplyId(Integer applyId) {
        ElderlyGovbuyApplyHandle handle = new ElderlyGovbuyApplyHandle();
        handle.setApplyId(applyId);
        return elderlyGovbuyApplyHandleService.getAllRecode(handle);
    }


    /************************************** 政府购买服务申请流程 end*********************************／



     /**
     * 添加政府购买老人
     *
     * @param govBuy
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加政府购买老人")
    public JsonResult addElderGovBuy(ElderlyGovBuy govBuy) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(govBuy.getElderId())) {
            result.markError("该老人不存在");
            return result;
        }
        if (ObjectUtils.isNotNull(elderlyGovBuyService.selectByElderId(govBuy.getElderId()))) {
            result.markError("该老人已存在");
            return result;
        }
        if (elderlyGovBuyService.insert(govBuy)) {
            result.markSuccess("添加政府购买老人成功", null);
        } else {
            result.markError("添加政府购买老人失败");
        }
        return result;
    }

    /**
     * 添加文娱活动
     * @return
     */
    @RequestMapping(value = "addHappy", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加文娱活动")
    public JsonResult addHappy(ServiceOrgRecreationalActivities serviceOrgRecreationalActivities) {
        JsonResult result = new JsonResult();
        if (serviceOrgRecreationalActivitiesService.insert(serviceOrgRecreationalActivities)) {
            result.markSuccess("添加文娱活动成功", null);
        } else {
            result.markError("添加文娱活动失败");
        }
        return result;
    }

    /**
     * 添加社会捐赠信息
     * @return
     */
    @RequestMapping(value = "addCommunityDonation", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加社会捐赠信息")
    public JsonResult addCommunityDonation(ServiceOrgSocialDonation serviceOrgSocialDonation) {
        JsonResult result = new JsonResult();
        if (serviceOrgSocialDonationService.insert(serviceOrgSocialDonation)) {
            result.markSuccess("添加社会捐赠信息成功", null);
        } else {
            result.markError("添加社会捐赠信息失败");
        }
        return result;
    }

    /**
     * 添加社会服务信息
     * @return
     */
    @RequestMapping(value = "addCommunityService", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加社会服务信息")
    public JsonResult addCommunityService(ServiceOrgSocialWork serviceOrgSocialWork) {
        JsonResult result = new JsonResult();
        if (serviceOrgSocialWorkService.insert(serviceOrgSocialWork)) {
            result.markSuccess("添加社会服务信息成功", null);
        } else {
            result.markError("添加社会服务信息失败");
        }
        return result;
    }
    /**
     * 更新政府购买老人
     *
     * @param govBuy
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新政府购买老人")
    public JsonResult updateElderGovBuy(ElderlyGovBuy govBuy) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(govBuy.getElderId())) {
            result.markError("该老人不存在");
            return result;
        }
        if (elderlyGovBuyService.updateByElderId(govBuy)) {
            result.markSuccess("更新政府购买老人成功", null);
        } else {
            result.markError("更新政府购买老人失败");
        }
        return result;
    }

    /**
     * 删除政府购买老人
     *
     * @param selectIds
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除政府购买老人")
    public JsonResult deleteElderGovBuy(String selectIds) {
        JsonResult result = new JsonResult();
        String[] ids = selectIds.split(",");
        List<Integer> deleteIds = new ArrayList<Integer>();
        for (String s : ids) {
            if (!StringUtils.isEmpty(s))
                deleteIds.add(Integer.parseInt(s));
        }
        if (elderlyGovBuyService.deleteSome(deleteIds)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }


    //    verify

    /**
     * 审核
     *
     * @param elderlyGovBuy
     * @return
     */
    @RequestMapping(value = "verify", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "审核政府购买老人")
    public JsonResult deleteElderGovBuy(ElderlyGovBuy elderlyGovBuy) {
        JsonResult result = new JsonResult();
        if (elderlyGovBuyService.updateByPrimaryKeySelective(elderlyGovBuy)) {
            result.markSuccess("审核成功", null);
        } else {
            result.markError("审核失败");
        }
        return result;
    }

    @RequestMapping(value = "import", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "导入政府购买老人")
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) throws Exception {
        boolean b = true;
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ElderlyGovBuy> elderlyGovBuys = new ArrayList<ElderlyGovBuy>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
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
            ElderlyGovBuy elderlyGovBuy = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                num++;
                Row row = sheet.getRow(i);
                try {
                    elderlyGovBuy = new ElderlyGovBuy();
                    // 身份证号
                    String idCardNo = getCellValue(row.getCell(0));
                    if (!StringUtils.isEmpty(idCardNo)) {
                        ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idCardNo);
                        if (elderlyMsg != null) {
                            elderlyGovBuy.setElderId(elderlyMsg.getId());
                            elderlyGovBuy.setServiceOrgId(elderlyMsg.getServiceOrgId());
                        } else {
                            errorReasons.add(String.format("第%d行老人不存在,请检查后重新添加该用户", i));
                            result.markError("导入失败");
                            result.setData(errorReasons);
                            continue;
                        }
                    } else {
                        errorReasons.add(String.format("第%d行所属区域为空，请检查后重新添加该用户", i));
                        result.markError("导入失败");
                        result.setData(errorReasons);
                        continue;
                    }
                    // 补贴金额
                    elderlyGovBuy.setSubsidy(getCellValue(row.getCell(1)) == "" ? 0 : Integer.parseInt(getCellValue(row.getCell(1))));
                    // 呼叫器类型
                    String callerType = getCellValue(row.getCell(2));
                    if (callerType.contains("固定") || callerType.contains("固话")) {
                        elderlyGovBuy.setCallertype(1);
                    } else if (callerType.contains("移动") || callerType.contains("手机")) {
                        elderlyGovBuy.setCallertype(2);
                    } else {
                        //其他
                        elderlyGovBuy.setCallertype(3);
                    }
                    // 呼叫器厂商
                    elderlyGovBuy.setCallerlabel(getCellValue(row.getCell(3)) == "" ? null : Integer.parseInt(getCellValue(row.getCell(3))));
                    // 呼叫器安装费
                    elderlyGovBuy.setCallerinitfee(getCellValue(row.getCell(4)) == "" ? null : Double.parseDouble(getCellValue(row.getCell(4))));
                    // 呼叫器月租费
                    elderlyGovBuy.setCallermonthfee(getCellValue(row.getCell(5)) == "" ? 0.00 : Double.parseDouble(getCellValue(row.getCell(5))));
                    // 呼叫器号码
                    elderlyGovBuy.setCallerno(getCellValue(row.getCell(6)) == "" ? null : getCellValue(row.getCell(6)));
                    // 安装状态
                    elderlyGovBuy.setCallerstatus(getCellValue(row.getCell(7)) == "" ? null : Integer.parseInt(getCellValue(row.getCell(7))));
                    // 呼叫器服务人员
                    elderlyGovBuy.setCallerstaff(getCellValue(row.getCell(8)) == "" ? null : getCellValue(row.getCell(8)));
                    // 呼叫器服务人员电话
                    elderlyGovBuy.setCallerstafftel(getCellValue(row.getCell(9)) == "" ? null : getCellValue(row.getCell(9)));
                    // 市民卡号
                    String cardno = getCellValue(row.getCell(10));
                    if (cardno.length() == 12) {
                        cardno = "0000" + cardno;
                    }
                    elderlyGovBuy.setCardno(cardno == "" ? null : cardno);
                    elderlyGovBuys.add(elderlyGovBuy);
                } catch (Exception e) {
                    errorReasons.add(String.format("第%d行人员信息有错，请检查后重新添加该用户", i));
                    b = false;
                    continue;
                }
            }
        } else {
            result.markError("文件内容为空！");
        }

        if (!b) {
            result.markError("导入失败");
            result.setData(errorReasons);
        } else {
            if (elderlyGovBuys.size() > 0 && elderlyGovBuyService.insertSomeElderGovBuy(elderlyGovBuys) > 0) {
                result.markSuccess("导入成功", null);
            } else {
                result.markError("导入失败");
                result.setData(errorReasons);
            }
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

}
