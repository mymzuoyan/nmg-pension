package com.fedtech.pension.controller.admin.org;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.org.entity.HealthRecords;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.entity.UserFuWu;
import com.fedtech.pension.org.service.HealthRecordsService;
import com.fedtech.pension.org.service.ServiceOrgRecreationalActivitiesService;
import com.fedtech.pension.org.service.UserFuwuService;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author gxy
 * @date 2019/9/17 - 20:59
 */


@Controller
@RequestMapping("/admin/org/healthRecords/")
@EnableScheduling
public class HealthRecordsController extends BaseController {

    @Reference(version = "1.0.0")
    private HealthRecordsService healthRecordsService;

    @Reference(version = "1.0.0")
    private UserFuwuService userFuwuService;
    public final String ADMIN_PREFIX = "/admin/serviceSource/";

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");



    /**
     * 从业人员健康记录列表
     * @return
     */
    @RequestMapping("List")
    public  String  showHealthRecordsList(){
        return ADMIN_PREFIX + "health_records_list";
    }

    /**
     * 从业人员健康信息记录列表
     * @param filter
     * @param pageRequest
     * @return
     * @throws Exception
     */
    @RequestMapping("getHealthRecordsList")
    @ResponseBody
    public PageResponse<HealthRecords> getHealthRecordsList(HealthRecords filter, PageRequest pageRequest,String signCheckbox) throws Exception{

        List<Integer> elderTypeList = new ArrayList<Integer>();
        if (!StringUtils.isEmpty(signCheckbox)) {
            for (int i = 0; i < signCheckbox.split(",").length; i++) {
                if (signCheckbox.split(",")[i] != null && signCheckbox.split(",")[i] != "") {
                    elderTypeList.add(Integer.parseInt(signCheckbox.split(",")[i]));
                }
            }
            filter.setElderTypeList(elderTypeList);
        }

        return healthRecordsService.selectPageList(filter,pageRequest);
    }



    /**
     * 删除从业人员健康记录信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteHealthRecords", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除从业人员健康记录信息")
    public JsonResult deleteHealthRecords(Integer id) {
        JsonResult result = new JsonResult();
        boolean b = false;
        if (healthRecordsService.deleteByPrimaryKey(id)) {
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
     * 从业人员健康记录信息列表批量删除
     * @param deleteIds
     * @return
     */
    @RequestMapping("deleteSome")
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
        if (healthRecordsService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    /**
     * 从业人员健康记录新增列表
     *
     * @return
     */
    @RequestMapping("healthRecordsAdd")
    public String healthRecordsAdd() {
        return ADMIN_PREFIX + "health_records_add";
    }


    /**
     * 从业人员健康记录新增
     * @return
     */
    @RequestMapping(value = "healthRecordsAdd", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "从业人员健康记录新增")
    public JsonResult healthRecordsAdd(HealthRecords healthRecords) {
        JsonResult result = new JsonResult();
        if (healthRecordsService.insert(healthRecords)) {
            result.markSuccess("添加从业人员健康记录成功", null);
        } else {
            result.markError("添加从业人员健康记录失败");
        }
        return result;
    }

    /**
     * 从业人员健康记录详情
     *
     * @return
     */
    @RequestMapping("healthRecordsDetail")
    public String happyDetail(Model model, HealthRecords filter) {
        filter=healthRecordsService.selectByPrimaryKey(filter.getId());
        HashMap<String, String> time = new HashMap<>();
        if(filter.getHepatitis() != null){
            time.put("hepatitis",df.format(filter.getHepatitis()));
        }else{
            time.put("hepatitis",null);
        }
        if(filter.getDysentery() != null){
            time.put("dysentery",df.format(filter.getDysentery()));
        }else{
            time.put("dysentery",null);
        }
        if(filter.getTyphia() != null){
            time.put("typhia",df.format(filter.getTyphia()));
        }else{
            time.put("typhia",null);
        }
        if(filter.getTuberculosis() != null){
            time.put("tuberculosis",df.format(filter.getTuberculosis()));
        }else{
            time.put("tuberculosis",null);
        }
        if(filter.getTetter() != null){
            time.put("tetter",df.format(filter.getTetter()));
        }else{
            time.put("tetter",null);
        }
        if(filter.getClock() != null){
            time.put("clock",df.format(filter.getClock()));
        }else{
            time.put("clock",null);
        }
        model.addAttribute("m",filter);
        model.addAttribute("time",time);
        return ADMIN_PREFIX + "health_records_detail";
    }

    /**
     * 更新从业人员健康记录详情
     *
     * @param
     * @return
     */
    @RequestMapping(value = "updateHealthRecords", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新从业人员健康记录详情")
    public JsonResult updateHealthRecords(HealthRecords healthRecords) {
        JsonResult result = new JsonResult();
        if (healthRecordsService.updateByPrimaryKeySelective(healthRecords)) {
            result.markSuccess("更新从业人员健康记录详情成功", null);
        } else {
            result.markError("更新从业人员健康记录详情失败");
        }
        return result;
    }


    /**
     * 获取从业人员信息
     *
     * @return
     */
    @RequestMapping(value = "getEmployeeByCardNo", method = RequestMethod.POST)
    @ResponseBody
    public UserFuWu getElderByCardNo(String cardNo) {
        UserFuWu userFuWu = null;
        if (StringUtils.isEmpty(cardNo)) {
            return null;
        } else {
            userFuWu = userFuwuService.selectByCardNo(cardNo);
        }
        return userFuWu;
    }
}
