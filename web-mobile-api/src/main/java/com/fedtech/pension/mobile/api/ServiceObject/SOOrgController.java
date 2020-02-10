package com.fedtech.pension.mobile.api.ServiceObject;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.AppResult;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.entity.ServiceOrgConstructionSubsidyApply;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.service.ServiceOrgConstructionSubApplyService;
import com.fedtech.pension.org.service.ServiceOrgService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import com.fedtech.pension.task.service.TaskReceiveService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/11/23
 */

@Controller
@RequestMapping("/api/service/")
public class SOOrgController {


    @Reference(version = "1.0.0")
    private UserService userService;

    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ServiceOrgConstructionSubApplyService serviceOrgConstructionSubApplyService;






    /**
     * 获取机构名称
     *
     * @return
     */
    @RequestMapping("serviceOrgNickName")
    @ResponseBody
    public AppResult findServiceOrgNickName() {

        try {
            List<ServiceOrgConstructionSubsidyApply> serviceOrgConstructionSubsidyApplies = serviceOrgConstructionSubApplyService.selectAll();
            return AppResult.ok("查询成功",serviceOrgConstructionSubsidyApplies);
        }catch (Exception e){
            e.printStackTrace();
            return AppResult.error("查询异常");
        }
    }



    /**
     * 获取运营补贴详情
     *
     * @return
     */
    @RequestMapping("peratingSubsidiesoInf")
    @ResponseBody
    public AppResult findPeratingSubsidiesoInf(Integer serviceOrgId) {

        HashMap<Object, Object> objectObjectHashMap = new HashMap<>();

        try {
            ServiceOrg serviceOrg = serviceOrgService.selectByPrimaryKey(serviceOrgId);
            ServiceOrgConstructionSubsidyApply serviceOrgConstructionSubsidyApply = serviceOrgConstructionSubApplyService.selectByServiceOrgId(serviceOrgId);
            objectObjectHashMap.put("serviceOrgName",serviceOrgConstructionSubsidyApply.getServiceOrgName());
            objectObjectHashMap.put("applyTime",serviceOrgConstructionSubsidyApply.getApplyTime());
            objectObjectHashMap.put("address",serviceOrg.getAddress());
            objectObjectHashMap.put("applyName",serviceOrg.getApplyName());
            objectObjectHashMap.put("mobile",serviceOrg.getMobile());
            //运营方式1.公办公营2.公办民营3.民办民营  机构类型
            Integer runWay = serviceOrg.getRunWay();
            String runWays=null;
            if(runWay==1){
                runWays="公办公营";
            }
            if(runWay==2){
                runWays="公办民营";
            }
            if(runWay==3){
                runWays="民办民营";
            }
            objectObjectHashMap.put("runWay",runWays);
            Integer instProp = serviceOrg.getInstProp();
            String instProps=null;
            if(instProp==1){
                instProps="民非法人";
            }
            if(instProp==2){
                instProps="事业法人";
            }
            if(instProp==3){
                instProps="工商法人";
            }
            if(instProp==4){
                instProps="未登记";
            }
            objectObjectHashMap.put("instProp",instProps);
            //建筑面积
            objectObjectHashMap.put("landArea",serviceOrg.getLandArea());
            //申请的床位数
            objectObjectHashMap.put("bedNum",serviceOrgConstructionSubsidyApply.getBedNum());
            //补贴金额
            objectObjectHashMap.put("money",serviceOrgConstructionSubsidyApply.getMoney());
            return AppResult.ok("查询成功",objectObjectHashMap);
        }catch (Exception e){
            e.printStackTrace();
            return AppResult.error("查询异常");
        }
    }



}
