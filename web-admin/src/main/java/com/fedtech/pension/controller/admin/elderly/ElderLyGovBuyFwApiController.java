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
import com.fedtech.pension.power.entity.Enroll;
import com.fedtech.pension.power.service.EnrollService;
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

import javax.annotation.Resource;
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
@RequestMapping("/admin/api/elderly/govbuyfw/")
public class ElderLyGovBuyFwApiController extends BaseController {


    @Reference(version = "1.0.0")
    private ElderlyGovBuyFwService elderlyGovBuyFwService;
    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;
    @Reference(version = "1.0.0")
    private EnrollService enrollService;

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
    public PageResponse<ElderlyGovBuyFw> getElerInfo(ElderlyGovBuyFw govBuy, PageRequest pageRequest) {
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
        PageResponse<ElderlyGovBuyFw> dataTable = elderlyGovBuyFwService.selectPageList(govBuy, pageRequest);
        return dataTable;
    }

    /**
     * 获取健康数据信息列表
     *
     * @return
     */
    @RequestMapping(value = "healthList", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "获取健康数据信息列表")
    public PageResponse<Enroll> getElerInfo(Enroll enroll, PageRequest pageRequest) {
        //限制区域
//        Subject currentUser = SecurityUtils.getSubject();
//        if (currentUser.hasRole(RoleType.ReAdmin.getValue())) {
//            //区域管理员
//            String areaName = currentUser().getAreaName();
//            if (!StringUtils.isEmpty(areaName)) {
//                if (areaName.split(",").length >= 2) {
//                    areaName = areaName.split(",")[1];
//                }
//            }
//            govBuy.setAreaName(areaName);
//
//        } else if (currentUser.hasRole(RoleType.ZuAdmin.getValue())) {
//            //组织管理员
//            govBuy.setServiceOrgId(Integer.parseInt(currentUser().getServiceOrgId()));
//        }
        PageResponse<Enroll> dataTable = enrollService.selectPageList(enroll, pageRequest);
        return dataTable;
    }



     /**
     * 添加政府购买老人
     *
     * @param govBuy
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加政府购买老人")
    public JsonResult addElderGovBuyFw(ElderlyGovBuyFw govBuy) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(govBuy.getElderId())) {
            result.markError("该老人不存在");
            return result;
        }
        if (ObjectUtils.isNotNull(elderlyGovBuyFwService.selectByElderId(govBuy.getElderId()))) {
            result.markError("该老人已存在");
            return result;
        }
        if (elderlyGovBuyFwService.insert(govBuy)) {
            result.markSuccess("添加政府购买老人成功", null);
        } else {
            result.markError("添加政府购买老人失败");
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
    public JsonResult updateElderGovBuyFw(ElderlyGovBuyFw govBuy) {
        JsonResult result = new JsonResult();
        if (!ObjectUtils.isNotNull(govBuy.getElderId())) {
            result.markError("该老人不存在");
            return result;
        }
        if (elderlyGovBuyFwService.updateByElderId(govBuy)) {
            result.markSuccess("更新政府购买老人成功", null);
        } else {
            result.markError("更新政府购买老人失败");
        }
        return result;
    }

    /**
     * 删除政府购买老人
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除政府购买老人")
    public JsonResult deleteElderGovBuyFw(Integer id) {
        JsonResult result = new JsonResult();
        if(id>0){
            if (elderlyGovBuyFwService.deleteByPrimaryKey(id)) {
                result.markSuccess("删除成功", null);
            } else {

            }
        }else{
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 审核
     *
     * @param elderlyGovBuyFw
     * @return
     */
    @RequestMapping(value = "verify", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "审核政府购买老人")
    public JsonResult verifyElderGovBuyFw(ElderlyGovBuyFw elderlyGovBuyFw) {
        int status = elderlyGovBuyFw.getStatus();
        elderlyGovBuyFw=elderlyGovBuyFwService.selectByPrimaryKey(elderlyGovBuyFw.getId());
        elderlyGovBuyFw.setStatus(status);
        JsonResult result = new JsonResult();
        if (elderlyGovBuyFwService.updateByPrimaryKeySelective(elderlyGovBuyFw)) {
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
        List<ElderlyGovBuyFw> elderlyGovBuys = new ArrayList<ElderlyGovBuyFw>();
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
            ElderlyGovBuyFw elderlyGovBuy = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                num++;
                Row row = sheet.getRow(i);
                try {
                    elderlyGovBuy = new ElderlyGovBuyFw();
                    // 身份证号
                    String idCardNo = getCellValue(row.getCell(0));
                    if (!StringUtils.isEmpty(idCardNo)) {
                        ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idCardNo);
                        if (elderlyMsg != null) {
                            elderlyGovBuy.setElderId(elderlyMsg.getId());
                            elderlyGovBuy.setServiceOrgId(elderlyMsg.getServiceOrgId());
                            elderlyGovBuy.setArea(elderlyMsg.getAreaId());
                            elderlyGovBuy.setIdcardno(idCardNo);
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
                    // 人员类别
                    elderlyGovBuy.setElderType(getCellValue(row.getCell(2)) == "" ? "0" : getCellValue(row.getCell(2)));
                    // 服务项目
                    elderlyGovBuy.setServiceItems(getCellValue(row.getCell(3)) == "" ? "" : getCellValue(row.getCell(3)));
                    elderlyGovBuy.setStatus(1);
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
            if (elderlyGovBuys.size() > 0 && elderlyGovBuyFwService.insertSomeElderGovBuyFw(elderlyGovBuys) > 0) {
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
