package com.fedtech.pension.controller.admin.power;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderLinkManService;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import com.fedtech.pension.power.entity.*;
import com.fedtech.pension.power.service.*;
import com.fedtech.pension.sys.service.AreaService;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.fedtech.web.utils.Servlets.getRequest;

@Controller
@RequestMapping("/admin/api/power/wcdfzsz/")
@EnableScheduling
public class OldManPowerController extends BaseController {

    @Reference(version = "1.0.0")
    public WcdfzszService wcdfzszService;

    public final String ADMIN_PREFIX = "/admin/lrnlpg/";
    @Reference(version = "1.0.0")
    public ElderCapacityService elderCapacityService;

    @Reference(version = "1.0.0")
    private ElderLinkManService elderLinkManService;

    @Reference(version = "1.0.0")
    private AbilityService abilityService;

    @Reference(version = "1.0.0")
    private DemandService demandService;
    @Reference(version = "1.0.0")
    public MoneyflowService moneyflowService;
    @Reference(version = "1.0.0")
    public AreaService areaService;
    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;


    /**
     * 能力评估列表
     *
     * @return
     */
    @RequestMapping("catacityList")
    public  String   showCapacityList(){
        return ADMIN_PREFIX + "CapacityList";
    }


    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "老人能力评估完成度分值设置")
    public JsonResult addOrUpdateWcdfzsz(Wcdfzsz wcdfzsz) throws Exception{
        JsonResult result = new JsonResult();
        boolean blean = false;
        if(wcdfzsz.getId()!=null){
            blean = wcdfzszService.updateWcdfzsz(wcdfzsz);
            if(blean){
                result.markSuccess("老人能力评估完成度分值设置更新成功", null);
            }else{
                result.markError("老人能力评估完成度分值设置更新失败");
            }
        }else {
            blean = wcdfzszService.updateWcdfzsz(wcdfzsz);
            if(blean){
                result.markSuccess("老人能力评估完成度分值设置成功", null);
            }else{
                result.markError("老人能力评估完成度分值设置失败");
            }
        }
        return result;
    }


    /**
     * 老人能力评估完成度分值设置信息查看或修改
     *
     * @return
     */
    @RequestMapping("detail")
    public String wcdfsszDetail( Model model) {
        Wcdfzsz wcdfzsz = wcdfzszService.selectWcdfzsz();
        model.addAttribute("m", wcdfzsz);
        return ADMIN_PREFIX + "wcdsz";
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



    @RequestMapping("elderCapacityList")
    @ResponseBody
    public PageResponse<ElderCapacity> getElderCapacityList(ElderCapacity elderCapacity, PageRequest pageRequest) {
        //限制区域
        if (getCurrentUser().hasRole(RoleType.ReAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.StAdmin.getValue())
                || getCurrentUser().hasRole(RoleType.CoAdmin.getValue())) {
            elderCapacity.setAreaName(currentUser().getAreaName());
        }
        //默认查询未注销人员
        if(elderCapacity.getIsFlag() == null){
            elderCapacity.setIsFlag(1);
        }
        PageResponse<ElderCapacity> dataTable = elderCapacityService.selectPageList(elderCapacity, pageRequest);
        return dataTable;
    }


    /**
     * 能力信息新增
     *
     * @return
     */
    @RequestMapping("capacityAdd")
    public String addInstitution(Model model) {
        Wcdfzsz wcdfzsz= wcdfzszService.selectWcdfzsz();
        model.addAttribute("m1", wcdfzsz);
        Ability ability= abilityService.selectAbility();
        model.addAttribute("m2", ability);
        Demand demand= demandService.selectDemand();
        model.addAttribute("m3",demand);
        return ADMIN_PREFIX + "capacityAdd";
    }

    /**
     * 新增能力信息
     *
     * @param elderCapacity
     * @return
     */
    @RequestMapping("ElderCapacityAdd")
    @ResponseBody
    public JsonResult addElderCapacity(ElderCapacity elderCapacity, ElderLinkMan elderLinkMan) throws ParseException {
        JsonResult result = new JsonResult();
        boolean flag1 = false;
        elderLinkMan.setId(null);
        //设置图片上传方向标识 2标识从后台上传
        elderCapacity.setPhotoFlag(2);
        flag1 = elderCapacityService.update(elderCapacity);
        if(flag1){
            //同步评估信息到老人基础信息表里
       /*     ElderlyMsg elderlyMsg = new ElderlyMsg();
            elderlyMsg.setId(elderLinkMan.getElderId());
            elderlyMsg.setAbilityAssess("1");*/
            ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(elderLinkMan.getElderId());
            elderlyMsg.setAbilityAssess("1");
            //常住时间
            if(!StringUtils.isEmpty(elderCapacity.getConservationTime())){
                elderlyMsg.setLiveYearDictId(elderCapacity.getConservationTime());
            }
            //文化程度
            if(!StringUtils.isEmpty(elderCapacity.getDegreeOfEducation())){
                elderlyMsg.setEducationDictId(elderCapacity.getDegreeOfEducation());
            }
            //优待证号
            if(!StringUtils.isEmpty(elderCapacity.getOldmanPreferentialCard())){
                elderlyMsg.setSerialNumber(elderCapacity.getOldmanPreferentialCard());
            }
            //收入来源
            if(!StringUtils.isEmpty(elderCapacity.getSourcesOfIncome())){
                elderlyMsg.setIncomeSource(elderCapacity.getSourcesOfIncome());
            }
            //子女状况
            if(!StringUtils.isEmpty(elderCapacity.getStatusOfChildren())){
                elderlyMsg.setChildrenDictId(elderCapacity.getStatusOfChildren());
            }
            //社会活动类型
            if(!StringUtils.isEmpty(elderCapacity.getSocialActivitiesType())){
                elderlyMsg.setSaTypeDictIds(elderCapacity.getSocialActivitiesType());
            }
            //社会活动情况
            if(!StringUtils.isEmpty(elderCapacity.getSocialActivities())){
                elderlyMsg.setSocialActiDictId(elderCapacity.getSocialActivities());
            }
            //健康状况
            if(!StringUtils.isEmpty(elderCapacity.getPhysiclalHealthStatus())){
                elderlyMsg.setHealthStatus(elderCapacity.getPhysiclalHealthStatus());
            }
            //心理状况
            if(!StringUtils.isEmpty(elderCapacity.getPsychologicStatus())){
                elderlyMsg.setPsychologicDictId(elderCapacity.getPsychologicStatus());
            }
            //特殊对象
            if(!StringUtils.isEmpty(elderCapacity.getSpecialObject())){
                elderlyMsg.setSpecialDictIds(elderCapacity.getSpecialObject());
            }
            //住房性质
            if(!StringUtils.isEmpty(elderCapacity.getHousingNature())){
                elderlyMsg.setHouseTypeDictId(elderCapacity.getHousingNature());
            }
            //居室
            if(!StringUtils.isEmpty(elderCapacity.getHabitableRoom())){
                elderlyMsg.setRoomTypeDictId(elderCapacity.getHabitableRoom());
            }
            //楼层电梯
            if(!StringUtils.isEmpty(elderCapacity.getFloorLift())){
                elderlyMsg.setHasElevator(elderCapacity.getFloorLift());
            }
            //居住楼层
            if(!StringUtils.isEmpty(elderCapacity.getResidentialFloor())){
                elderlyMsg.setFloor(elderCapacity.getResidentialFloor());
            }
            //室内厕所
            if(!StringUtils.isEmpty(elderCapacity.getIndoorToilet())){
                elderlyMsg.setHasToilet(elderCapacity.getIndoorToilet());
            }
            //室内洗浴设备
            if(!StringUtils.isEmpty(elderCapacity.getIndoorBathEquipment())){
                elderlyMsg.setHasBath(elderCapacity.getIndoorBathEquipment());
            }
            elderlyMsgService.updateByPrimaryKeySelective(elderlyMsg);
            //根据elderId查询是否存在该老人信息  来做insert还是update操作
            List<ElderLinkMan> elderLink = elderLinkManService.selectByElderId(elderLinkMan.getElderId());
            if(elderCapacity.getEmergencyContact1() != null && elderCapacity.getEmergencyContact1() != ""){
                elderLinkMan.setLinkName(elderCapacity.getEmergencyContact1());
                elderLinkMan.setRelationship(elderCapacity.getEmergencyContact1Relatives());
                elderLinkMan.setLinkTel(elderCapacity.getEmergencyContact1Tel());
                if(elderCapacity.getIsKey1()==1){
                    elderLinkMan.setHaveKey("是");
                }else if(elderCapacity.getIsKey1()==2){
                    elderLinkMan.setHaveKey("否");
                }
                if(elderLink.size()>0&&elderLink.get(0) != null){
                    elderLinkMan.setId(elderLink.get(0).getId());
                    elderLinkManService.updateByPrimaryKeySelective(elderLinkMan);
                }else {
                    elderLinkManService.insert(elderLinkMan);
                }

            }
            if(elderCapacity.getEmergencyContact2() != null && elderCapacity.getEmergencyContact2() != ""){
                //elderLinkMan.setElderId(elderCapacity.getId());
                elderLinkMan.setLinkName(elderCapacity.getEmergencyContact2());
                elderLinkMan.setRelationship(elderCapacity.getEmergencyContact2Relatives());
                elderLinkMan.setLinkTel(elderCapacity.getEmergencyContact2Tel());
                if(elderCapacity.getIsKey2()==1){
                    elderLinkMan.setHaveKey("是");
                }else if(elderCapacity.getIsKey2()==2){
                    elderLinkMan.setHaveKey("否");
                }
                if(elderLink.size()>1&&elderLink.get(1) != null){
                    elderLinkMan.setId(elderLink.get(1).getId());
                    elderLinkManService.updateByPrimaryKeySelective(elderLinkMan);
                }else{
                    elderLinkManService.insert(elderLinkMan);
                }
            }
            if(elderCapacity.getEmergencyContact3() != null && elderCapacity.getEmergencyContact3() != ""){
                elderLinkMan.setLinkName(elderCapacity.getEmergencyContact3());
                elderLinkMan.setRelationship(elderCapacity.getEmergencyContact3Relatives());
                elderLinkMan.setLinkTel(elderCapacity.getEmergencyContact3Tel());
                if(elderCapacity.getIsKey3()==1){
                    elderLinkMan.setHaveKey("是");
                }else if(elderCapacity.getIsKey3()==2){
                    elderLinkMan.setHaveKey("否");
                }
                if(elderLink.size()>2&&elderLink.get(2) != null){
                    elderLinkMan.setId(elderLink.get(2).getId());
                    elderLinkManService.updateByPrimaryKeySelective(elderLinkMan);
                }else {
                    elderLinkManService.insert(elderLinkMan);
                }
            }
            result.markSuccess("能力信息更新成功", null);
        }else{
            result.markError("能力信息更新失败");
        }
        return result;
    }

    /**
     * 能力评估查看
     *
     * @return
     */
    @RequestMapping("catacityDetail/{id}")
    public  String   showCapacityDetail(@PathVariable("id") Integer id, Model model){
        ElderCapacity elderCapacity =  elderCapacityService.selectByPrimaryKey(id);
        if(elderCapacity.getPhotoFlag() == 2){
            if(elderCapacity.getOldmanPhoto() != null && !elderCapacity.getOldmanPhoto().equals("")){
                imageList(elderCapacity.getOldmanPhoto(),model,"oldManPhoto");
            }
        }
        HttpServletRequest request = getRequest();
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        String url = scheme+"://"+serverName+":"+"8088";
        model.addAttribute("url", url);
        model.addAttribute("m", elderCapacity);
        return ADMIN_PREFIX + "capacityDetail";
    }

    /**
     * 老人照片缩略
     * @param imageUrls
     * @param model
     * @param imageName
     */
    public void imageList(String imageUrls, Model model, String imageName) {
        List<String> imageList = new ArrayList<String>();
        List<String> thumbnailsList = new ArrayList<String>();
        String[] imageUrl = imageUrls.split(",");
        if (!StringUtils.isEmpty(imageUrls)) {
            for (int i = 0; i < imageUrl.length; i++) {
                if (imageUrl[i] != null && imageUrl[i] != "") {
                    imageList.add(imageUrl[i]);
                    //原图
                    String str = imageUrl[i].substring(0,imageUrl[i].lastIndexOf(".") - 6)+ imageUrl[i].substring(imageUrl[i].lastIndexOf("."));
                    thumbnailsList.add(str);
                }
            }
        }
        model.addAttribute(imageName + "s", imageList);
        model.addAttribute(imageName + "thumbnails", thumbnailsList);

    }

    @RequestMapping("deleteSomeMsg")
    @ResponseBody
    @SystemControllerLog(description = "批量删除能力信息")
    public JsonResult deleteSomeMsg(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (elderCapacityService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 导入
     *
     * @return
     */
    @RequestMapping(value = "import", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) throws Exception {
        List<String> errorReasons = new ArrayList<>();
        JsonResult result = new JsonResult();
        List<ElderCapacity> elderCapacitys = new ArrayList<ElderCapacity>();
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
            ElderCapacity elderlyCapacity = null;
            for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
                boolean b = true;
                num++;
                Row row = sheet.getRow(i);
                elderlyCapacity = new ElderCapacity();
                // 姓名
                String elderName = getCellValue(row.getCell(0));
                if (!StringUtils.isEmpty(elderName)) {
                    elderlyCapacity.setOldmanName(elderName);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行老人姓名为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 身份证号
                String idcardno = getCellValue(row.getCell(1));
                if (!StringUtils.isEmpty(idcardno)) {
                    //             ElderlyMsg elderlyMsg1 = elderlyMsgService.selectByCardNo(idcardno);
      /*              if (elderlyMsg1 != null) {
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
                            elderlyMsg.setAge(elderlyMsg2.getAge());
                            elderlyMsg.setBirthday(elderlyMsg2.getBirthday());
                            elderlyMsg.setSexDictId(elderlyMsg2.getSexDictId());
                        } else {
                            b = false;
                            errorReasons.add(String.format("第%d行身份证号有误，请检查后重新添加该用户", i + 1));
                            continue;
                        }
                    }*/
                    ElderCapacity elCapacity =elderCapacityService.findByIdcard(idcardno);
                    if(elCapacity != null){
                        b = false;
                        errorReasons.add(String.format("第%d行老人身份证已存在，请检查后重新添加该用户", i + 1));
                    }else{
                        elderlyCapacity.setIdCard(idcardno);
                    }
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行身份证号为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                //性别
                String sex = getCellValue(row.getCell(2));
                if (!StringUtils.isEmpty(sex)) {
                    elderlyCapacity.setSex(sex);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行老人性别为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                //户籍类型
                String householdType = getCellValue(row.getCell(3));
                if (!StringUtils.isEmpty(householdType)) {
                    elderlyCapacity.setHouseholdType(householdType);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行老人户籍类型为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                // 户籍区
                try {
                    String household = row.getCell(4).toString();
                    if (!StringUtils.isEmpty(household)) {
                        elderlyCapacity.setHousehold(household);
                    } else {
                        b = false;
                        errorReasons.add(String.format("第%d行户籍区为空，请检查后重新添加", i + 1));
                        continue;
                    }
                } catch (NullPointerException e) {
                    b = false;
                    errorReasons.add(String.format("第%d行户籍区为空，请检查后重新添加", i + 1));
                    continue;
                }
                //户籍乡镇
                try {
                    String domicile = row.getCell(5).toString(); //街道
                    if (!StringUtils.isEmpty(domicile)) {
                        elderlyCapacity.setDomicile(domicile);
                    }else {
                        b = false;
                        errorReasons.add(String.format("第%d行户籍乡镇为空，请检查后重新添加", i + 1));
                        continue;
                    }
                } catch (NullPointerException e) {

                }
                //户籍村
                try {
                    String village = row.getCell(6).toString();
                    if (!StringUtils.isEmpty(village)) {
                        elderlyCapacity.setVillage(village);
                    }else {
                        b = false;
                        errorReasons.add(String.format("第%d行户籍村为空，请检查后重新添加", i + 1));
                        continue;
                    }
                } catch (NullPointerException e) {

                }
                //紧急联系人
                String emergencyContact = getCellValue(row.getCell(7));
                if (!StringUtils.isEmpty(emergencyContact)) {
                    elderlyCapacity.setEmergencyContact(emergencyContact);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行紧急联系人为空，请检查后重新添加该用户", i + 1));
                    continue;
                }
                //紧急联系方式
                String emergencyContactMode = getCellValue(row.getCell(8));
                if (!StringUtils.isEmpty(emergencyContactMode)) {
                    elderlyCapacity.setEmergencyContactMode(emergencyContactMode);
                } else {
                    b = false;
                    errorReasons.add(String.format("第%d行紧急联系方式为空，请检查后重新添加该用户", i + 1));
                    continue;
                }

                // 行为能力
                elderlyCapacity.setCapacity(getCellValue(row.getCell(9)) == "" ? null : getCellValue(row.getCell(9)));
                // 经济条件
                elderlyCapacity.setEconomic(getCellValue(row.getCell(10)) == "" ? null : getCellValue(row.getCell(10)));
                //居住状况
                elderlyCapacity.setLivingConditions(getCellValue(row.getCell(11)) == "" ? null : getCellValue(row.getCell(11)));
                // 年龄
                elderlyCapacity.setAge(getCellValue(row.getCell(12)) == "" ? null : getCellValue(row.getCell(12)));
                // 特殊贡献
                elderlyCapacity.setSpecialContribution(getCellValue(row.getCell(12)) == "" ? null : getCellValue(row.getCell(12)));

                // 计划生育特困家庭
                elderlyCapacity.setFamilyPlan(getCellValue(row.getCell(14)) == "" ? null : getCellValue(row.getCell(14)));
                // 残疾情况
                elderlyCapacity.setDisability(getCellValue(row.getCell(15)) == "" ? null : getCellValue(row.getCell(15)));
                // 补贴等级
                elderlyCapacity.setSubsidyLevel(getCellValue(row.getCell(16)) == "" ? null : getCellValue(row.getCell(16)));

                if (b) {
                    elderCapacitys.add(elderlyCapacity);
                }
                if (elderCapacitys.size() == 500) {
                    if (elderCapacityService.insertSomeElderCapacity(elderCapacitys) > 0) {
                        elderCapacitys.removeAll(elderCapacitys);
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
        if (elderCapacitys.size() > 0 && elderCapacityService.insertSomeElderCapacity(elderCapacitys) > 0) {
            result.markSuccess("导入成功", null);
            result.setData(errorReasons);
        } else {
            result.markError("导入失败");
            result.setData(errorReasons);
        }
        return result;
    }


    @RequestMapping("deleteOneMsg")
    @ResponseBody
    @SystemControllerLog(description = "单个删除")
    public JsonResult deleteOneMsg(Integer  id) {
        JsonResult result = new JsonResult();
        if (id != null) {
            if (elderCapacityService.deleteByPrimaryKey(id)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }

    /**
     * 注销
     * @param elderCapacity
     * @return
     */
    @RequestMapping("cancel")
    @ResponseBody
    @SystemControllerLog(description = "注销")
    public JsonResult cancelElder(ElderCapacity  elderCapacity) {
        JsonResult result = new JsonResult();
        if(elderCapacity != null){
            if(elderCapacityService.updateByPrimaryKeySelective(elderCapacity)){
                result.markSuccess("注销成功", null);
            }else{
                result.markError("注销失败");
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

    @RequestMapping(value = "checkAbility", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "能力分值查询")
    public JsonResult checkAbility() throws Exception{
        JsonResult result = new JsonResult();
        Ability ability= abilityService.selectAbility();
        result.markSuccess("success", ability);
        return result;
    }

    @RequestMapping(value = "checkFull", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "完善值查询")
    public JsonResult checkFull() throws Exception{
        JsonResult result = new JsonResult();
        Wcdfzsz wcdfzsz= wcdfzszService.selectWcdfzsz();
        result.markSuccess("success", wcdfzsz);
        return result;
    }


    /**
     * 老人需求评估完成度分值设置信息查看或修改
     *
     * @return
     */
    @RequestMapping("insertOrUpdate")
    public String abilityDetail( Model model) {
        Demand demand= demandService.selectDemand();
        model.addAttribute("m",demand);
        return ADMIN_PREFIX + "xqpgfzpz";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "老人需求评估分值设置")
    public JsonResult insertOrUpdate(Demand demand) throws Exception{
        JsonResult result = new JsonResult();
        boolean flag = false;
        if(demand.getId()!=null){
            flag = demandService.update(demand);
            if(flag){
                result.markSuccess("老人需求评估分值设置更新成功", null);
            }else{
                result.markError("老人需求评估分值设置更新失败");
            }
        }else {
            flag = demandService.update(demand);
            if(flag){
                result.markSuccess("老人需求评估分值设置成功", null);
            }else{
                result.markError("老人需求评估分值设置失败");
            }
        }
        return result;
    }

    /**
     * 能力评估修改
     *
     * @return
     */
    @RequestMapping("catacityEdit/{id}")
    public  String   showCapacityEdit(@PathVariable("id") Integer id, Model model){
        ElderCapacity elderCapacity =  elderCapacityService.selectByPrimaryKey(id);
        if(elderCapacity.getPhotoFlag() == 2){
            if(elderCapacity.getOldmanPhoto() != null && !elderCapacity.getOldmanPhoto().equals("")){
                imageList(elderCapacity.getOldmanPhoto(),model,"oldmanPhoto");
                elderCapacity.setOldmanPhoto(elderCapacity.getOldmanPhoto());
            }
        }
        HttpServletRequest request = getRequest();
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        String url = scheme+"://"+serverName+":"+"8088";
        model.addAttribute("url", url);
        model.addAttribute("m", elderCapacity);
        ElderlyMsg elderlyMsg =  elderlyMsgService.selectByCardNo(elderCapacity.getIdCard());
        model.addAttribute("elderlyMsg", elderlyMsg);
        Wcdfzsz wcdfzsz= wcdfzszService.selectWcdfzsz();
        model.addAttribute("m1", wcdfzsz);
        Ability ability= abilityService.selectAbility();
        model.addAttribute("m2", ability);
        Demand demand= demandService.selectDemand();
        model.addAttribute("m3",demand);
        return ADMIN_PREFIX + "capacityEditLevelUp";
    }


    /**
     * 资金流水列表
     * @return
     */
    @RequestMapping("moneyflowList")
    @ResponseBody
    public PageResponse<MoneyFlow> getMoneyFlowList(MoneyFlow moneyflow, PageRequest pageRequest) {
        if(moneyflow.getAreaId()!=null && moneyflow.getAreaId()>0){
            String areaName =areaService.getAreaName(moneyflow.getAreaId());
            moneyflow.setAreaName(areaName);
        }
        List<Integer> elderTypeList = new ArrayList<Integer>();
        String elderTypeDictIds = moneyflow.getElderTypeDictIds();
        if (!StringUtils.isEmpty(elderTypeDictIds)) {
            for (int i = 0; i < elderTypeDictIds.split(",").length; i++) {
                if (elderTypeDictIds.split(",")[i] != null && elderTypeDictIds.split(",")[i] != "") {
                    elderTypeList.add(Integer.parseInt(elderTypeDictIds.split(",")[i]));
                }
            }
            moneyflow.setElderTypeList(elderTypeList);
        }
        PageResponse<MoneyFlow> dataTable = moneyflowService.selectPageList(moneyflow, pageRequest);
        return dataTable;
    }

    /**
     * 跳转资金流水列表
     * @return
     */
    @RequestMapping("tomoneyflowList")
    public  String   showMoneyFlowList(){
        return ADMIN_PREFIX + "moneyFlowList";
    }

}
