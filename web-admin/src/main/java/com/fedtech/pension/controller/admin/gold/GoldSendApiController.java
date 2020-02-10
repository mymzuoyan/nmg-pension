package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DateUtils;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.gold.entity.GoldElderly;
import com.fedtech.pension.gold.entity.GoldSend;
import com.fedtech.pension.gold.service.GoldElderlyService;
import com.fedtech.pension.gold.service.GoldSendService;
import com.fedtech.pension.gold.vo.GoldSendVo;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * @author csn
 * @date 2018/1/11
 */
@Controller
@RequestMapping("admin/api/gold/goldSend/")
public class GoldSendApiController extends BaseController{
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");

    @Reference(version ="1.0.0")
    private GoldSendService goldSendService;

    @Reference(version ="1.0.0")
    private GoldElderlyService goldElderlyService;

    @Reference(version ="1.0.0")
    private ElderlyMsgService elderlyMsgService;

    /**
     * 发放列表
     * @param filter
     * @param pageRequest
     * @param fafangTimeString
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public PageResponse<GoldSend> list(GoldSend filter, PageRequest pageRequest,String fafangTimeString){
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) ||
                currentUser.hasRole(RoleType.StAdmin.getValue())|| currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue())){
            String areaName = filter.getAreaName();
            if (StringUtils.isEmpty(areaName)){
                areaName = currentUser().getAreaName();
            }
            filter.setAreaName(areaName);
        }
        if(!StringUtils.isEmpty(fafangTimeString)) {
            try {
                filter.setFafangTime(df.parse(fafangTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return goldSendService.selectPageList(filter,pageRequest);
    }

    /**
     * 银行发放列表
     * @param filter
     * @param pageRequest
     * @param fafangTimeString
     * @return
     */
    @RequestMapping("sendBankList")
    @ResponseBody
    public PageResponse<GoldSend> sendBankList(GoldSend filter, PageRequest pageRequest,String fafangTimeString){
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) ||
                currentUser.hasRole(RoleType.StAdmin.getValue())|| currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue()) ){
            String areaName = filter.getAreaName();
            if (StringUtils.isEmpty(areaName)){
                areaName = currentUser().getAreaName();
            }
            filter.setAreaName(areaName);
        }
        if(!StringUtils.isEmpty(fafangTimeString)) {
            try {
                filter.setFafangTime(df.parse(fafangTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return goldSendService.selectPageList2(filter,pageRequest);
    }

    /**
     * 银行补发列表
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("sendBankBufaList")
    @ResponseBody
    public PageResponse<GoldSend> sendBankBufaList(GoldSend filter, PageRequest pageRequest){
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) ||
                currentUser.hasRole(RoleType.StAdmin.getValue())|| currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue()) ){
            String areaName = filter.getAreaName();
            if (StringUtils.isEmpty(areaName)){
                areaName = currentUser().getAreaName();
            }
            filter.setAreaName(areaName);
        }
        return goldSendService.selectBankBufaList(filter,pageRequest);
    }

    /**
     * 补发列表
     * @param filter
     * @param pageRequest
     * @return
     */
    @RequestMapping("goldReissueList")
    @ResponseBody
    public PageResponse<GoldSend> goldReissueList(GoldSend filter,PageRequest pageRequest){
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) || currentUser.hasRole(RoleType.StAdmin.getValue())
                || currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue()) ){
            String areaName = filter.getAreaName();
            if (StringUtils.isEmpty(areaName)){
                areaName = currentUser().getAreaName();
            }
            filter.setAreaName(areaName);
        }
        return goldSendService.goldReissueList(filter,pageRequest);
    }

    /**
     * 补发
     *
     * */
    @RequestMapping(value = "goldReissue" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add(GoldSend goldSend,String startTimeString,String endTimeString,String idcardno) {
        JsonResult result = new JsonResult();
        Calendar cal = Calendar.getInstance();
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        Date startTimeDate =new Date();
        Date endTimeDate =new Date();
        try {
            startTimeDate  =df.parse(startTimeString);
            endTimeDate  =df.parse(endTimeString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //获取开始时间，结束时间的年月
        int sYear = cal.get(Calendar.YEAR);
        int eYear = cal1.get(Calendar.YEAR);
        int sMonth = startTimeDate.getMonth()+1;
        int eMonth = endTimeDate.getMonth()+1;
        //获取发放时间
        List<GoldSend> goldSendList =goldSendService.selectByIdCard(idcardno);
        //size =0 没有发放过 // size > 0 发放过，要判断发放时间
        if (goldSendList.size() > 0) {
            for (GoldSend g : goldSendList) {
                Date fafangTimeDate = g.getFafangTime();
                int fYear = cal2.get(Calendar.YEAR);
                if (sYear > fYear || fYear > eYear) {
                    goldSend.setStartTime(startTimeDate);
                    goldSend.setEndTime(endTimeDate);
                    ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
                    goldSend.setElderId(elderlyMsg.getId());
                    if (goldSendService.buFaMoney(goldSend)) {
                        result.markSuccess("添加成功", null);
                    } else {
                        result.markError("添加失败");
                    }
                } else if (fYear == sYear && sYear == eYear) {
                    int fMonth = fafangTimeDate.getMonth() + 1;
                    if (sMonth > fMonth || fMonth > eMonth) {
                        goldSend.setStartTime(startTimeDate);
                        goldSend.setEndTime(endTimeDate);
                        ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
                        goldSend.setElderId(elderlyMsg.getId());
                        if (goldSendService.buFaMoney(goldSend)) {
                            result.markSuccess("添加成功", null);
                        } else {
                            result.markError("添加失败");
                        }
                    } else {
                        result.markError("该时间段已经发放");
                    }
                } else {
                    result.markError("该时间段已经发放");
                }
            }
        }else{
            goldSend.setStartTime(startTimeDate);
            goldSend.setEndTime(endTimeDate);
            ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
            goldSend.setElderId(elderlyMsg.getId());
            if (goldSendService.buFaMoney(goldSend)) {
                result.markSuccess("添加成功", null);
            } else {
                result.markError("添加失败");
            }
        }
        return result;
    }

    /**
     * 获取老人信息
     *
     * @return
     */
    @RequestMapping(value = "getElderByCardNoForGoldSend", method = RequestMethod.POST)
    @ResponseBody
    public GoldElderly getElderByCardNo(String idcardno) {
        GoldElderly goldElderly = null;
        if (org.springframework.util.StringUtils.isEmpty(idcardno)) {
            return null;
        } else {
            goldElderly = goldElderlyService.selectByCardNoForGoldSend(idcardno);
        }
        return goldElderly;
    }
    /**
     * 导出excel
     *
     * @param request
     * @param response
     * @param filter
     * @param fafangTimeString
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/exportExcel")
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, GoldSend filter,String fafangTimeString) throws Exception {
        if(!StringUtils.isEmpty(fafangTimeString)) {
            try {
                filter.setFafangTime(df.parse(fafangTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<GoldSend> lists = goldSendService.getAllRecode(filter);
        response.setContentType("octets/stream");
        String title="高龄补贴发放查询列表";
        String fileName =title+".xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<GoldSend> ex = new ExportExcel<>();
        String[] headers = {"所属地区", "发放年月", "姓名", "身份证号","申请类别","发放金额(元)","开户银行","银行卡号","登记日期"};
        String[] fieldNames = {"areaName","fafangTime", "elderName", "idcardno","applyType","money","fafangWay","bankCardno","registerTime"};
        ex.exportExcel(title, headers, fieldNames, lists, out, "yyyy-MM");
        out.close();
    }

    /**
     * 导出excel
     *
     * @param request
     * @param response
     * @param filter
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/exportExcel2")
    public void exportExcel2(HttpServletRequest request, HttpServletResponse response, GoldSend filter) throws Exception {
        List<GoldSend> lists = goldSendService.getAllRecode2(filter);
        response.setContentType("octets/stream");
        String title="高龄补贴补发查询列表";
        String fileName =title+".xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<GoldSend> ex = new ExportExcel<>();
        String[] headers = {"姓名","身份证号","所属地区", "开始时间","结束时间","申请类别","标准","月数","补发总金额","开户银行","银行卡号"};
        String[] fieldNames = { "elderName","idcardno","areaName","startTime", "endTime","applyType","moneyStandard","monthCount","totalMoney","fafangWay","bankCardno"};
        ex.exportExcel(title, headers, fieldNames, lists, out, "yyyy-MM-dd");
        out.close();
    }

    /**
     * 导出excel
     *
     * @param request
     * @param response
     * @param filter
     * @param fafangTimeString
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/exportExcel3")
    public void exportExcel3(HttpServletRequest request, HttpServletResponse response, GoldSend filter,String fafangTimeString) throws Exception {
        if(!StringUtils.isEmpty(fafangTimeString)) {
            try {
                filter.setFafangTime(df.parse(fafangTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<GoldSend> lists = goldSendService.getAllRecode3(filter);
        response.setContentType("octets/stream");
        String title="高龄补贴银行发放详表";
        String fileName =title+".xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<GoldSend> ex = new ExportExcel<>();
        String[] headers = {"所属地区", "姓名","申请类别","发放金额(元)","身份证号","开户银行","卡主","银行卡号","备注"};
        String[] fieldNames = { "areaName","elderName","applyType","money", "idcardno","fafangWay","bankCardOwner","bankCardno","remark"};
        ex.exportExcel(title, headers, fieldNames, lists, out, "yyyy-MM-dd");
        out.close();
    }

    /**
     * 导出excel
     *  高龄补贴银行补发
     * @param request
     * @param response
     * @param filter
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/exportExcel4")
    public void exportExcel4(HttpServletRequest request, HttpServletResponse response, GoldSend filter) throws Exception {
        List<GoldSend> lists = goldSendService.getAllRecode4(filter);
        response.setContentType("octets/stream");
        String title="高龄补贴银补发详表";
        String fileName =title+".xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<GoldSend> ex = new ExportExcel<>();
        String[] headers = {"所属地区", "姓名","身份证号","开始时间","结束时间","80岁段月数","80岁段标准","90岁段月数","90岁段标准"
                ,"95岁段月数","95岁段标准","100岁段月数","100岁段标准","补发金额","开户银行","卡主","银行卡号"};
        String[] fieldNames = {"areaName","elderName","idcardno","startTime", "endTime","monthCount1","moneyStandard1",
                "monthCount2","moneyStandard2","monthCount3","moneyStandard3","monthCount4","moneyStandard4","bufaMoney",
                "fafangWay","bankCardOwner","bankCardno"};
        ex.exportExcel(title, headers, fieldNames, lists, out, "yyyy-MM-dd");
        out.close();
    }

    /**
     * 导出表格
     */
    @RequestMapping("export")
    public void export(HttpServletRequest request, HttpServletResponse response,Integer areaId ,GoldSendVo filter ,String fafangTimeString) throws IOException {
        response.setContentType("octets/stream");
        String fileName = "高龄补贴银行发放详表.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        String[] headers = {"区域", "80-90岁","90-94岁","95-99岁","100岁及以上","其中","合计"};
        String[] headers1 = {"","人次数", "金额","人次数", "金额","人次数", "金额","人次数", "金额","省财政" ,"市财政", "区县财政","镇财政	","人次数","金额"};
        OutputStream out = response.getOutputStream();
        // 声明一个工作薄
        SXSSFWorkbook workbook = new SXSSFWorkbook(5000);
        // 生成一个表格
        Sheet sheet = workbook.createSheet();

        workbook.setSheetName(0, "高龄补贴银行发放详表");

        CellStyle cellStyle = workbook.createCellStyle();
        // 居中
        cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
        // 居中
        cellStyle.setAlignment(CellStyle.VERTICAL_CENTER);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
        sheet.setDefaultColumnStyle(0,cellStyle);

        // first row
        // last row
        // first column
        // last column
        CellRangeAddress region = new CellRangeAddress(0,0,1,2);
        sheet.addMergedRegion(region);

        CellRangeAddress region1 = new CellRangeAddress(0,0,3,4);
        sheet.addMergedRegion(region1);

        CellRangeAddress region2 = new CellRangeAddress(0,0,5,6);
        sheet.addMergedRegion(region2);

        CellRangeAddress region3 = new CellRangeAddress(0,0,7,8);
        sheet.addMergedRegion(region3);

        CellRangeAddress region4 = new CellRangeAddress(0,0,9,12);
        sheet.addMergedRegion(region4);

        CellRangeAddress region5 = new CellRangeAddress(0,0,13,14);
        sheet.addMergedRegion(region5);

        //第一行
        Row row = sheet.createRow(0);
        Cell cell = row.createCell(0);
        HSSFRichTextString text = new HSSFRichTextString(headers[0]);
        cell.setCellValue(text);
        cell = row.createCell(1);
        text = new HSSFRichTextString(headers[1]);
        cell.setCellValue(text);
        cell = row.createCell(3);
        text = new HSSFRichTextString(headers[2]);
        cell.setCellValue(text);
        cell = row.createCell(5);
        text = new HSSFRichTextString(headers[3]);
        cell.setCellValue(text);
        cell = row.createCell(7);
        text = new HSSFRichTextString(headers[4]);
        cell.setCellValue(text);
        cell = row.createCell(9);
        text = new HSSFRichTextString(headers[5]);
        cell.setCellValue(text);
        cell = row.createCell(13);
        text = new HSSFRichTextString(headers[6]);
        cell.setCellValue(text);

        //合并的第二行
        row =sheet.createRow(1);
        for (short i = 0; i < headers1.length; i++) {
            if (i == 0) {
                i++;
            }
            cell = row.createCell(i);
            HSSFRichTextString text1 = new HSSFRichTextString(headers1[i]);
            cell.setCellValue(text1);
        }
        List<GoldSendVo> result =statistics(areaId,filter,fafangTimeString);

        int flag =2;
        for(GoldSendVo g : result){
            row = sheet.createRow(flag);
            cell = row.createCell(0);
            text = new HSSFRichTextString(g.getAreaName());
            cell.setCellValue(text);
            cell = row.createCell(1);
            text = new HSSFRichTextString(g.getCountPer1().toString());
            cell.setCellValue(text);
            cell = row.createCell(2);
            text = new HSSFRichTextString(g.getCountMoney1().toString());
            cell.setCellValue(text);
            cell = row.createCell(3);
            text = new HSSFRichTextString(g.getCountPer2().toString());
            cell.setCellValue(text);
            cell = row.createCell(4);
            text = new HSSFRichTextString(g.getCountMoney2().toString());
            cell.setCellValue(text);
            cell = row.createCell(5);
            text = new HSSFRichTextString(g.getCountPer3().toString());
            cell.setCellValue(text);
            cell = row.createCell(6);
            text = new HSSFRichTextString(g.getCountMoney3().toString());
            cell.setCellValue(text);
            cell = row.createCell(7);
            text = new HSSFRichTextString(g.getCountPer4().toString());
            cell.setCellValue(text);
            cell = row.createCell(8);
            text = new HSSFRichTextString(g.getCountMoney4().toString());
            cell.setCellValue(text);
            cell = row.createCell(9);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(10);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(11);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(12);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(13);
            text = new HSSFRichTextString(g.getAllCount().toString());
            cell.setCellValue(text);
            cell = row.createCell(14);
            text = new HSSFRichTextString(g.getAllMoney().toString());
            cell.setCellValue(text);
            flag++;
        }
        if (out != null) {
            try {
                workbook.write(out);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    /**
     * 导出表格
     */
    @RequestMapping("export2")
    public void export2(HttpServletRequest request, HttpServletResponse response,Integer areaId ,GoldSendVo filter ,String endTimeString ,String startTimeString) throws IOException {
        response.setContentType("octets/stream");
        String fileName = "高龄补贴银行补发详表.xls";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        String[] headers = {"区域", "80-90岁","90-94岁","95-99岁","100岁及以上","其中","合计"};
        String[] headers1 = {"","人次数", "金额","人次数", "金额","人次数", "金额","人次数", "金额","省财政" ,"市财政", "区县财政","镇财政	","人次数","金额"};
        OutputStream out = response.getOutputStream();
        // 声明一个工作薄
        SXSSFWorkbook workbook = new SXSSFWorkbook(5000);
        // 生成一个表格
        Sheet sheet = workbook.createSheet();

        workbook.setSheetName(0, "高龄补贴银行补发详表");

        CellStyle cellStyle = workbook.createCellStyle();
        // 居中
        cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
        // 居中
        cellStyle.setAlignment(CellStyle.VERTICAL_CENTER);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 15);
        sheet.setDefaultColumnStyle(0,cellStyle);

        // first row
        // last row
        // first column
        // last column
        CellRangeAddress region = new CellRangeAddress(0,0,1,2);
        sheet.addMergedRegion(region);

        CellRangeAddress region1 = new CellRangeAddress(0,0,3,4);
        sheet.addMergedRegion(region1);

        CellRangeAddress region2 = new CellRangeAddress(0,0,5,6);
        sheet.addMergedRegion(region2);

        CellRangeAddress region3 = new CellRangeAddress(0,0,7,8);
        sheet.addMergedRegion(region3);

        CellRangeAddress region4 = new CellRangeAddress(0,0,9,12);
        sheet.addMergedRegion(region4);

        CellRangeAddress region5 = new CellRangeAddress(0,0,13,14);
        sheet.addMergedRegion(region5);

        //第一行
        Row row = sheet.createRow(0);
        Cell cell = row.createCell(0);
        HSSFRichTextString text = new HSSFRichTextString(headers[0]);
        cell.setCellValue(text);
        cell = row.createCell(1);
        text = new HSSFRichTextString(headers[1]);
        cell.setCellValue(text);
        cell = row.createCell(3);
        text = new HSSFRichTextString(headers[2]);
        cell.setCellValue(text);
        cell = row.createCell(5);
        text = new HSSFRichTextString(headers[3]);
        cell.setCellValue(text);
        cell = row.createCell(7);
        text = new HSSFRichTextString(headers[4]);
        cell.setCellValue(text);
        cell = row.createCell(9);
        text = new HSSFRichTextString(headers[5]);
        cell.setCellValue(text);
        cell = row.createCell(13);
        text = new HSSFRichTextString(headers[6]);
        cell.setCellValue(text);

        //合并的第二行
        row =sheet.createRow(1);
        for (short i = 0; i < headers1.length; i++) {
            if (i == 0) {
                i++;
            }
            cell = row.createCell(i);
            HSSFRichTextString text1 = new HSSFRichTextString(headers1[i]);
            cell.setCellValue(text1);
        }
        List<GoldSendVo> result =bufaStatistics(areaId,filter,startTimeString,endTimeString);

        int flag =2;
        for(GoldSendVo g : result){
            row = sheet.createRow(flag);
            cell = row.createCell(0);
            text = new HSSFRichTextString(g.getAreaName());
            cell.setCellValue(text);
            cell = row.createCell(1);
            text = new HSSFRichTextString(g.getCountPer1().toString());
            cell.setCellValue(text);
            cell = row.createCell(2);
            text = new HSSFRichTextString(g.getCountMoney1().toString());
            cell.setCellValue(text);
            cell = row.createCell(3);
            text = new HSSFRichTextString(g.getCountPer2().toString());
            cell.setCellValue(text);
            cell = row.createCell(4);
            text = new HSSFRichTextString(g.getCountMoney2().toString());
            cell.setCellValue(text);
            cell = row.createCell(5);
            text = new HSSFRichTextString(g.getCountPer3().toString());
            cell.setCellValue(text);
            cell = row.createCell(6);
            text = new HSSFRichTextString(g.getCountMoney3().toString());
            cell.setCellValue(text);
            cell = row.createCell(7);
            text = new HSSFRichTextString(g.getCountPer4().toString());
            cell.setCellValue(text);
            cell = row.createCell(8);
            text = new HSSFRichTextString(g.getCountMoney4().toString());
            cell.setCellValue(text);
            cell = row.createCell(9);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(10);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(11);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(12);
            text = new HSSFRichTextString("0");
            cell.setCellValue(text);
            cell = row.createCell(13);
            text = new HSSFRichTextString(g.getAllCount().toString());
            cell.setCellValue(text);
            cell = row.createCell(14);
            text = new HSSFRichTextString(g.getAllMoney().toString());
            cell.setCellValue(text);
            flag++;
        }
        if (out != null) {
            try {
                workbook.write(out);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "getStatistic", method = RequestMethod.POST)
    @ResponseBody
    public List<GoldSendVo> statistics(Integer areaId ,GoldSendVo filter ,String fafangTimeString) {
        if(!StringUtils.isEmpty(fafangTimeString)){
            try {
                filter.setFafangTime(df.parse(fafangTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<GoldSendVo> result = goldSendService.statistics(areaId ,filter);
        return result;
    }

    @RequestMapping(value = "getBufaStatistic", method = RequestMethod.POST)
    @ResponseBody
    public List<GoldSendVo> bufaStatistics(Integer areaId , GoldSendVo filter ,String endTimeString ,String startTimeString) {
        if (!StringUtils.isEmpty(endTimeString)){
            try {
                filter.setEndTime(df.parse(endTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (!StringUtils.isEmpty(startTimeString)){
            try {
                filter.setStartTime(df.parse(startTimeString));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        List<GoldSendVo> result = goldSendService.buFaStatistics(areaId ,filter);
        return result;
    }
}
