package com.fedtech.pension.controller.admin.gold;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.ExportExcel;
import com.fedtech.commons.utils.ExportExcelUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.gold.entity.GoldElderly;
import com.fedtech.pension.gold.service.GoldElderlyService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.shiro.SecurityUtils;
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
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author csn
 * @date 2018/1/4
 */
@Controller
@RequestMapping("admin/api/gold/forGoldInfo/")
public class GoldElderlyApiController extends BaseController {

    @Reference(version ="1.0.0")
    private GoldElderlyService goldElderlyService;

    @Reference(version ="1.0.0")
    private ElderlyMsgService elderlyMsgService;

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping("list")
    @ResponseBody
    public PageResponse<GoldElderly> list(GoldElderly filter, PageRequest pageRequest) {
        //限制区域
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(RoleType.MuAdmin.getValue()) ||currentUser.hasRole(RoleType.ReAdmin.getValue()) || currentUser.hasRole(RoleType.StAdmin.getValue())|| currentUser.hasRole(RoleType.CoAdmin.getValue()) || currentUser.hasRole(RoleType.ZuAdmin.getValue()) ){
            //区域管理员
            String areaName = filter.getAreaName();
            if (StringUtils.isEmpty(areaName)) {
                areaName = currentUser().getAreaName();
            }
            filter.setAreaName(areaName);
        }
        return goldElderlyService.selectPageList(filter, pageRequest);
    }

   /*
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除登记人员信息")
    public JsonResult deleteElderGovBuy(String selectIds) {
        JsonResult result = new JsonResult();
        String[] ids = selectIds.split(",");
        List<Integer> deleteIds = new ArrayList<Integer>();
        for (String s : ids) {
            if (!StringUtils.isEmpty(s)){
                deleteIds.add(Integer.parseInt(s));
            }
        }
        if (goldElderlyService.deleteSome(deleteIds)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }*/

    @RequestMapping(value = "add" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add(GoldElderly goldElderly,String idcardno) {
        JsonResult result = new JsonResult();
        goldElderly.setRegisterTime(new Date());
        ElderlyMsg elderlyMsg =elderlyMsgService.selectByCardNo(idcardno);
        Integer id =elderlyMsg.getId();
        goldElderly.setId(id);
        if (goldElderlyService.insert(goldElderly)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        return result;
    }

    @RequestMapping(value = "elderCancel" , method = RequestMethod.POST)
    @ResponseBody
    public JsonResult elderCancel(GoldElderly goldElderly) {
        JsonResult result = new JsonResult();
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByCardNo(goldElderly.getIdcardno());
        goldElderly.setId(elderlyMsg.getId());
        goldElderly.setStatus("1");
        if (goldElderlyService.updateByPrimaryKeySelective(goldElderly)) {
            result.markSuccess("注销成功", null);
        } else {
            result.markError("注销失败");
        }
        return result;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult update(GoldElderly goldElderly) {
        JsonResult result = new JsonResult();
        if (goldElderlyService.updateByPrimaryKeySelective(goldElderly)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
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
        if (org.springframework.util.StringUtils.isEmpty(idcardno)) {
            return null;
        } else {
            elderlyMsg = elderlyMsgService.selectByCardNo(idcardno);
        }
        return elderlyMsg;
    }

    @RequestMapping(value = "getElderByCardNoForGold", method = RequestMethod.POST)
    @ResponseBody
    public ElderlyMsg getElderByCardNoForGold(String idcardno) {
        ElderlyMsg elderlyMsg = null;
        if (idcardno != null && idcardno !=""){
            elderlyMsg = elderlyMsgService.selectByCardNoForGold(idcardno);
        }
        return elderlyMsg;
    }

    @RequestMapping(value = "import", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) throws IOException {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<GoldElderly> goldElderlies =new ArrayList<GoldElderly>();
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        //一共多少数据
        int num = 0;
        if (!file.isEmpty()) {
            InputStream is = file.getInputStream();
            Workbook wb = null;
            if ("xls".equals(suffix)||"xlsx".equals(suffix)) {
                try {
                    wb = WorkbookFactory.create(is);
                } catch (InvalidFormatException e) {
                    e.printStackTrace();
                }
            }else {
                result.markError("excel文件格式不正确！");
                return result;
            }
            Sheet sheet = wb.getSheetAt(0);
            GoldElderly goldElderly =null;
            for (int i=1;i<sheet.getLastRowNum()+1; i++){
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                goldElderly =new GoldElderly();

                //通过身份证获取老人id
                String cardNo = ExportExcelUtil.getCellValue(row.getCell(0));
                ElderlyMsg msg = null;
                if (!org.springframework.util.StringUtils.isEmpty(cardNo)){
                    msg = elderlyMsgService.selectByCardNo(cardNo);
                }else {
                    b=false;
                    errorReasons.add(String.format("第%d行身份证为空，请检查后重新添加", i + 1));
                    continue;
                }
                if(ObjectUtils.isNotNull(msg)){
                    //通过id检查老人是否已经登记
                    GoldElderly a =goldElderlyService.selectByPrimaryKey(msg.getId());
                    if (ObjectUtils.isNotNull(a)){
                        b=false;
                        errorReasons.add(String.format("第%d行老人已经登记，请检查后重新添加", i + 1));
                        continue;
                    }else {
                        goldElderly.setId(msg.getId());
                        Integer age = msg.getAge();
                        if (age != null) {
                            if (age < 80) {
                                b = false;
                                errorReasons.add(String.format("第%d行老人未满80岁，请检查后重新添加", i + 1));
                                continue;
                            } else {
                                if (80 <= age && age <= 89) {
                                    goldElderly.setApplyType(0);
                                } else if (age >= 90 && age <= 94) {
                                    goldElderly.setApplyType(1);
                                } else if (age >= 95 && age <= 99) {
                                    goldElderly.setApplyType(2);
                                } else if (age >= 100) {
                                    goldElderly.setApplyType(3);
                                }
                            }
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行申请类别有误，请检查后重新添加", i + 1));
                            continue;
                        }
                    }
                }else {
                    b=false;
                    errorReasons.add(String.format("第%d行身份证有误，请检查后重新添加", i + 1));
                    continue;
                }

                //联系人
                String linkMan =ExportExcelUtil.getCellValue(row.getCell(1));
                if (!org.springframework.util.StringUtils.isEmpty(linkMan)){
                    goldElderly.setLinkMan(linkMan);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                //联系人电话
                String linkManTel =ExportExcelUtil.getCellValue(row.getCell(2));
                if (!org.springframework.util.StringUtils.isEmpty(linkManTel)){
                    goldElderly.setLinkManTel(linkManTel);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                //银行卡号
                String bankCardno =ExportExcelUtil.getCellValue(row.getCell(3));
                if (!org.springframework.util.StringUtils.isEmpty(bankCardno)){
                    goldElderly.setBankCardno(bankCardno);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                //银行卡主
                String bankCardOwner =ExportExcelUtil.getCellValue(row.getCell(4));
                if (!org.springframework.util.StringUtils.isEmpty(bankCardOwner)){
                    goldElderly.setBankCardOwner(bankCardOwner);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                //和老人的关系
                String srelationElderly =ExportExcelUtil.getCellValue(row.getCell(5));
                Integer relationElderly =Integer.valueOf(srelationElderly);
                if (!org.springframework.util.StringUtils.isEmpty(relationElderly)){
                    goldElderly.setRelationElderly(relationElderly);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                //发放方式
                String sfafangWay =ExportExcelUtil.getCellValue(row.getCell(6));
                Integer fafangWay =Integer.valueOf(sfafangWay);
                if (!org.springframework.util.StringUtils.isEmpty(fafangWay)){
                    goldElderly.setFafangWay(fafangWay);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String remark =ExportExcelUtil.getCellValue(row.getCell(7));
                if (!org.springframework.util.StringUtils.isEmpty(remark)){
                    goldElderly.setRemark(remark);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                goldElderly.setRegisterTime(new Date());

                if (b){
                    goldElderlies.add(goldElderly);
                }
                if (goldElderlies.size() == 500){
                    if (goldElderlyService.insertSome(goldElderlies)){
                        goldElderlies.removeAll(goldElderlies);
                        result.markSuccess("导入成功", null);
                        result.setData(errorReasons);
                    }
                    else {
                        result.markError("导入失败");
                        result.setData(errorReasons);
                    }
                }
            }
        }else{
            result.markError("文件内容为空！");
        }
        if (goldElderlies.size()>0 && goldElderlyService.insertSome(goldElderlies)){
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
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
    @RequestMapping(value = "/exportExcel")
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, GoldElderly filter) throws Exception {
        List<GoldElderly> lists = goldElderlyService.getAllRecode(filter);
        response.setContentType("octets/stream");
        String title="人员信息登记列表";
        String fileName =title+".xlsx";
        fileName = URLEncoder.encode(fileName, "UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        OutputStream out = response.getOutputStream();
        ExportExcel<GoldElderly> ex = new ExportExcel<>();
        String[] headers = {"编号", "姓名", "性别", "申请类别","所在区域","现居住地址","身份证","登记日期","注销日期"};
        String[] fieldNames = {"id", "elderName","sexDictId", "applyType", "areaName","realAddress","idcardno","registerTime","cancelTime"};
        ex.exportExcel(title, headers, fieldNames, lists, out, "yyyy-MM-dd");
        out.close();
    }
}
