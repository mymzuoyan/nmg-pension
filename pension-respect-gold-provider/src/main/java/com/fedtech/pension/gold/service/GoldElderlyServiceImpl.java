package com.fedtech.pension.gold.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.utils.ExportExcelUtil;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.gold.entity.GoldElderly;
import com.fedtech.pension.gold.mapper.GoldElderlyMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author csn
 * @date 2018/1/5
 */
@Service(interfaceClass = GoldElderlyService.class,version = "1.0.0")
@org.springframework.stereotype.Service
@Component
public class GoldElderlyServiceImpl extends BaseServiceImpl<GoldElderly> implements GoldElderlyService{

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version ="1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Autowired
    private GoldElderlyMapper goldElderlyMapper;

    @Override
    public BaseMapper<GoldElderly> getMapper() {
        return goldElderlyMapper;
    }

    @Override
    public boolean deleteSome(List<Integer> ids) {
        if (null != ids) {
            return 0 != goldElderlyMapper.deleteSome(ids);
        }
        return false;
    }

    @Override
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
                if (!StringUtils.isEmpty(cardNo)){
                     msg = elderlyMsgService.selectByCardNo(cardNo);
                }else {
                    b=false;
                    errorReasons.add(String.format("第%d行身份证为空，请检查后重新添加", i + 1));
                    continue;
                }
                if(ObjectUtils.isNotNull(msg)){
                    goldElderly.setId(msg.getId());
                }else {
                    b=false;
                    errorReasons.add(String.format("身份证有误"));
                    continue;
                }

                String sapplyType =ExportExcelUtil.getCellValue(row.getCell(1));
                Integer applyType =Integer.valueOf(sapplyType);
                if (!StringUtils.isEmpty(applyType)){
                    goldElderly.setApplyType(applyType);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String linkMan =ExportExcelUtil.getCellValue(row.getCell(2));
                if (!StringUtils.isEmpty(linkMan)){
                    goldElderly.setLinkMan(linkMan);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String linkManTel =ExportExcelUtil.getCellValue(row.getCell(3));
                if (!StringUtils.isEmpty(linkManTel)){
                    goldElderly.setLinkManTel(linkManTel);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String bankCardno =ExportExcelUtil.getCellValue(row.getCell(4));
                if (!StringUtils.isEmpty(bankCardno)){
                    goldElderly.setBankCardno(bankCardno);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String bankCardOwner =ExportExcelUtil.getCellValue(row.getCell(5));
                if (!StringUtils.isEmpty(bankCardOwner)){
                    goldElderly.setBankCardOwner(bankCardOwner);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String srelationElderly =ExportExcelUtil.getCellValue(row.getCell(6));
                Integer relationElderly =Integer.valueOf(srelationElderly);
                if (!StringUtils.isEmpty(relationElderly)){
                    goldElderly.setRelationElderly(relationElderly);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String sfafangWay =ExportExcelUtil.getCellValue(row.getCell(7));
                Integer fafangWay =Integer.valueOf(sfafangWay);
                if (!StringUtils.isEmpty(fafangWay)){
                    goldElderly.setFafangWay(fafangWay);
                }else{
                    b=false;
                    errorReasons.add(String.format("第%d行内容为空，请检查后重新添加", i + 1));
                    continue;
                }

                String remark =ExportExcelUtil.getCellValue(row.getCell(8));
                if (!StringUtils.isEmpty(remark)){
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
                    if (this.insertSome(goldElderlies)){
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
        if (goldElderlies.size()>0 && this.insertSome(goldElderlies)){
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }

    @Override
    public GoldElderly selectByCardNoForGoldSend(@Param("cardNo") String cardNo) {
        return goldElderlyMapper.selectByCardNoForGoldSend(cardNo);
    }

    @Override
    public List<GoldElderly> selectAllId() {
        return goldElderlyMapper.selectAllId();
    }

    @Override
    public boolean insertSomeGoldElderly(@Param("goldElderlies") List<GoldElderly> goldElderlies) {
        if (goldElderlyMapper.insertSomeGoldElderly(goldElderlies) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int updateByIds(@Param("ids") List<Integer> ids,@Param("applyType") Integer applyType) {
        return goldElderlyMapper.updateByIds(ids,applyType);
    }


    /**
     * 每天0点更新，到达80岁的老人添加到高龄补贴库
     * 年龄到：
     * 89-90
     * 94-95
     * 99-100
     * 提档
     * */
    @Scheduled(cron = "0 0 0 * * ?")
    public JsonResult addElderly(){
        JsonResult result = new JsonResult();
        Calendar c = Calendar.getInstance();
        c.add(Calendar.YEAR , -80);
        c.add(Calendar.MONTH ,0);
        c.add(Calendar.DATE ,0);
        Date resultDate =c.getTime();
        String birthDay ="";
        //当日0时正好到80岁的老人
        birthDay =df.format(resultDate);
        List<ElderlyMsg> elderlyMsgList =elderlyMsgService.getAllBirth(birthDay);
        List<GoldElderly> goldElderlies =new ArrayList<>();
        for(ElderlyMsg e: elderlyMsgList){
           Integer id = e.getId();
            GoldElderly goldElderly =new GoldElderly();
            //为成为高龄补贴的老人赋值
            goldElderly.setId(id);
            goldElderly.setApplyType(0);
            goldElderly.setRegisterTime(new Date());

            goldElderlies.add(goldElderly);
        }
        if (insertSomeGoldElderly(goldElderlies)) {
            result.markSuccess("添加成功", null);
        } else {
            result.markError("添加失败");
        }
        //今天0点正好到90岁
        Calendar c1 = Calendar.getInstance();
        c1.add(Calendar.YEAR , -90);
        c1.add(Calendar.MONTH ,0);
        c1.add(Calendar.DATE ,0);
        Date resultDate1 =c1.getTime();
        birthDay =df.format(resultDate1);
        List<ElderlyMsg> elderlyMsgList1 =elderlyMsgService.getAllBirth(birthDay);
        List<Integer> ids =new ArrayList<>();
        Integer applyType =0 ;
        for(ElderlyMsg e1: elderlyMsgList1){
            ids.add(e1.getId());
            applyType =1;
        }
        if(updateByIds(ids,applyType)>0){
            result.markSuccess("修改成功", null);
        }else {
            result.markError("修改失败");
        }
        //今天0点正好到95岁
        Calendar c2 = Calendar.getInstance();
        c2.add(Calendar.YEAR , -95);
        c2.add(Calendar.MONTH ,0);
        c2.add(Calendar.DATE ,0);
        Date resultDate2 =c2.getTime();
        birthDay =df.format(resultDate2);
        List<ElderlyMsg> elderlyMsgList2 =elderlyMsgService.getAllBirth(birthDay);
        for(ElderlyMsg e2: elderlyMsgList2){
            ids.add(e2.getId());
            applyType =2;
        }
        if(updateByIds(ids,applyType)>0){
            result.markSuccess("修改成功", null);
        }else {
            result.markError("修改失败");
        }
        //今天0点正好到100岁
        Calendar c3 = Calendar.getInstance();
        c3.add(Calendar.YEAR , -100);
        c3.add(Calendar.MONTH ,0);
        c3.add(Calendar.DATE ,0);
        Date resultDate3 =c3.getTime();
        birthDay =df.format(resultDate3);
        List<ElderlyMsg> elderlyMsgList3 =elderlyMsgService.getAllBirth(birthDay);
        for(ElderlyMsg e3: elderlyMsgList3){
            ids.add(e3.getId());
            applyType=3;
        }
        if(updateByIds(ids,applyType)>0){
            result.markSuccess("修改成功", null);
        }else {
            result.markError("修改失败");
        }
        return result;
    }
}
