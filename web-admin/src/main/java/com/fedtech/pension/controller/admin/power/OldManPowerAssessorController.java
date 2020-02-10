package com.fedtech.pension.controller.admin.power;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.data.kindeditor.UploadResult;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.FileUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.power.entity.Assessor;
import com.fedtech.pension.power.service.AssessorService;
import com.fedtech.pension.sys.entity.Area;
import com.fedtech.pension.sys.service.AreaService;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/api/power/assessor/")
@EnableScheduling
public class OldManPowerAssessorController {
    @Reference(version = "1.0.0")
    public AssessorService assessorService;
    @Reference(version = "1.0.0")
    public AreaService areaService;
    public final String ADMIN_PREFIX = "/admin/lrnlpg/";

    @RequestMapping(value = "addorupdate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "评估人新增修改")
    public JsonResult addOrUpdateWcdfzsz(Assessor assessor) throws Exception{
        JsonResult result = new JsonResult();
        boolean blean = false;
        if(assessor.getId()!=null){
            blean = assessorService.updateAssessor(assessor);
            if(blean){
                result.markSuccess("评估人信息更新成功", null);
            }else{
                result.markError("评估人信息更新失败");
            }
        }else {
            blean = assessorService.updateAssessor(assessor);
            if(blean){
                result.markSuccess("评估人信息新增成功", null);
            }else{
                result.markError("评估人信息新增失败");
            }
        }
        return result;
    }

    /**
     * 评估人信息修改
     *
     * @return
     */
    @RequestMapping("assessorUpdate")
    public String assessorUpdate( Model model,Integer id) {
        Assessor assessor = assessorService.selectByPrimaryKey(id);
        model.addAttribute("assessor", assessor);
        return ADMIN_PREFIX + "assessor＿add";
    }
    /**
     * 评估人信息修改
     *
     * @return
     */
    @RequestMapping("assessorDetail")
    public String assessorDetail( Model model,Integer id) {
        Assessor assessor = assessorService.selectByPrimaryKey(id);
        model.addAttribute("assessor", assessor);
        return ADMIN_PREFIX + "assessor＿detail";
    }

    /**
     * 评估人列表
     *
     * @return
     */
    @RequestMapping("assessorList")
    public  String   showAssessorList(){
        return ADMIN_PREFIX + "assessor＿list";
    }

    /**
     * 分页获取组织列表
     *
     * @return
     */
    @RequestMapping(value = "serviceAssessorList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Assessor> serviceOrgList(PageRequest pageRequest, Assessor assessor) {
        PageResponse<Assessor> dataTable = assessorService.selectPageList(assessor, pageRequest);
        return dataTable;
    }
    /**
     * 评估人新增
     *
     * @return
     */
    @RequestMapping("assessorAdd")
    public  String   addAssessor(){
        return ADMIN_PREFIX + "assessor＿add";
    }
    /**
     * 评估人删除
     *
     * @return
     */
    @RequestMapping("deleteAssessor")
    @ResponseBody
    @SystemControllerLog(description = "批量删除评估人")
    public JsonResult deleteAssessor(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (assessorService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 导出评估人信息列表
     *
     * @param assessor
     * @return
     */
    @RequestMapping("export")
    @SystemControllerLog(description = "导出评估人信息列表")
    public void export(Assessor assessor, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        assessor.setArea(URLDecoder.decode(assessor.getArea(), "UTF-8"));
        assessor.setName(URLDecoder.decode(assessor.getName(), "UTF-8"));
        List<Assessor> assessores = assessorService.getAllRecode(assessor);
        response.setContentType("octets/stream");
        String fileName = "评估人信息.xls";
        String title = "评估人信息";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<Assessor> ex = new ExportExcel<>();
        String[] headers = {"登录账号 ", "姓名", "所属区域 ", "添加时间", "员工说明", "账号有效期起",
                "账号有效期止", "手机", "现居地"
        };
        String[] fieldNames = {"loginName", "name", "area", "createDate", "express", "beginUseTime",
                "endUseTime", "phone", "lifePlace"};
        ex.exportExcel(title, headers, fieldNames, assessores, out, "yyyy-MM-dd");
        out.close();
    }

    @RequestMapping(value = "import", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<Assessor> assessors = new ArrayList<Assessor>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        int num = 0;//一共多少数据
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)) {
                wb = new HSSFWorkbook(is);
            }else if("xlsx".equals(suffix)){
                wb = new XSSFWorkbook(is);
            } else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            Assessor assessor = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                assessor = new Assessor();
                try {
                    String areaName = row.getCell(2).toString();
                    if (!StringUtils.isEmpty(areaName)) {
                        Area area = areaService.getAreaByNameFromCache(areaName);
                        if (ObjectUtils.isNotNull(area)) {
//                            assessor.setAreaId(area.getId());
                            assessor.setArea(areaName);
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


                // 身份证号
                String idcardno = getCellValue(row.getCell(16));
                if (!StringUtils.isEmpty(idcardno)) {
                    Assessor assessor1 = assessorService.selectByCardNo(idcardno);
                    if (assessor1 != null) {
                        b = false;
                        errorReasons.add(String.format("第%d行身份证号已存在，请检查后重新添加", i + 1));
                        continue;
                    } else {
                        assessor.setIdCard(idcardno);
//                        JsonResult validateResult = myValidateApiController.IDCardValidate(idcardno, "elder");
//                        if (validateResult.getMessage().equals("身份证正确")) {
//                        } else {
//                            b = false;
//                            errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加该用户", i + 1));
//                            continue;
//                        }
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                assessor.setLoginName(getCellValue(row.getCell(0)) == "" ? null : getCellValue(row.getCell(0)));
                assessor.setPassword(getCellValue(row.getCell(1)) == "" ? null : getCellValue(row.getCell(1)));
                assessor.setExpress(getCellValue(row.getCell(3)) == "" ? null : getCellValue(row.getCell(3)));
                assessor.setUseStatus(getCellValue(row.getCell(4)) == "" ? null : getCellValue(row.getCell(4)));
                assessor.setBeginUseTime(getCellValue(row.getCell(5)) == "" ? null : getCellValue(row.getCell(5)));
                assessor.setEndUseTime(getCellValue(row.getCell(6)) == "" ? null : getCellValue(row.getCell(6)));
                assessor.setName(getCellValue(row.getCell(7)) == "" ? null : getCellValue(row.getCell(7)));
                assessor.setSex(getCellValue(row.getCell(8)) == "" ? null : getCellValue(row.getCell(8)));
                assessor.setServerStatus(getCellValue(row.getCell(9)) == "" ? null : getCellValue(row.getCell(9)));
                assessor.setPhone(getCellValue(row.getCell(10)) == "" ? null : getCellValue(row.getCell(10)));
                assessor.setSecondPhone(getCellValue(row.getCell(11)) == "" ? null : getCellValue(row.getCell(11)));
                assessor.setAddressPhone(getCellValue(row.getCell(12)) == "" ? null : getCellValue(row.getCell(12)));
                assessor.setAddress(getCellValue(row.getCell(13)) == "" ? null : getCellValue(row.getCell(13)));
                assessor.setLifePlace(getCellValue(row.getCell(14)) == "" ? null : getCellValue(row.getCell(14)));
                assessor.setBirthday(getCellValue(row.getCell(15)) == "" ? null : getCellValue(row.getCell(15)));
                assessor.setNation(getCellValue(row.getCell(17)) == "" ? null : getCellValue(row.getCell(17)));
                assessor.setParty(getCellValue(row.getCell(18)) == "" ? null : getCellValue(row.getCell(18)));
                assessor.setEducation(getCellValue(row.getCell(19)) == "" ? null : getCellValue(row.getCell(19)));
                assessor.setOnDutyTime(getCellValue(row.getCell(20)) == "" ? null : getCellValue(row.getCell(20)));
                assessor.setLeaveDutyTime(getCellValue(row.getCell(21)) == "" ? null : getCellValue(row.getCell(21)));
                if (b) {
                    assessors.add(assessor);
                }
                if (assessors.size() == 500) {
                    if (assessorService.insertSomeElder(assessors) > 0) {
                        assessors.removeAll(assessors);
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
        if (assessors.size() > 0 && assessorService.insertSomeElder(assessors) > 0) {
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
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
}
