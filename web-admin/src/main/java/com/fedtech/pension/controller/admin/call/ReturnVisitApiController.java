package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.call.entity.ReturnVisit;
import com.fedtech.pension.call.service.CustomerService;
import com.fedtech.pension.call.service.ReturnVisitService;
import com.fedtech.pension.call.vo.CustomerVisitVo;
import com.fedtech.pension.call.vo.ElderlyGovBuyVisitVo;
import com.fedtech.pension.call.vo.ServiceOrgVisitVo;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyGovBuy;
import com.fedtech.pension.elderly.service.ElderlyGovBuyService;
import com.fedtech.pension.org.entity.ServiceOrg;
import com.fedtech.pension.org.service.ServiceOrgService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CoderQiang
 * @date 2017/2/9
 */
@Controller
@RequestMapping("/admin/call/api//visit/")
public class ReturnVisitApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(ReturnVisitApiController.class);


    @Reference(version = "1.0.0")
    private ServiceOrgService serviceOrgService;

    @Reference(version = "1.0.0")
    private ElderlyGovBuyService elderlyGovBuyService;

    @Reference(version = "1.0.0")
    private ReturnVisitService returnVisitService;

    @Reference(version = "1.0.0")
    private CustomerService customerService;

    /**
     * 需要回访的组织列表
     *
     * @param serviceOrg
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getServiceOrgVisitList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<ServiceOrgVisitVo> getServiceOrgVisitList(ServiceOrg serviceOrg, PageRequest pageRequest) {
        return serviceOrgService.selectVisitPageList(serviceOrg, pageRequest);
    }

    /**
     * 需要回访的老人列表
     *
     * @param elderlyGovBuy
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getElderGovBuyVisitList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<ElderlyGovBuyVisitVo> getElderGovBuyVisitList(ElderlyGovBuy elderlyGovBuy, PageRequest pageRequest) {
        return elderlyGovBuyService.selectVisitPageList(elderlyGovBuy, pageRequest);
    }


    /**
     * 需要呼叫客户列表
     *
     * @param customerVisitVo
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "getCustomerVisitList", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<CustomerVisitVo> getCustomerVisitList(CustomerVisitVo customerVisitVo, PageRequest pageRequest) {
        return customerService.selectVisitPageList(customerVisitVo, pageRequest);
    }


    /**
     * 获取回访数量统计
     *
     * @return
     */
    @RequestMapping(value = "getReturnVisitStatistics", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, List<Integer>> getReturnVisitStatistics() {
        List<Integer> counts = null;
        Map<String, List<Integer>> result = new LinkedHashMap<>();
        ReturnVisit returnVisit = new ReturnVisit();
        //2A组织回访：
        ServiceOrg serviceOrg = new ServiceOrg();
        serviceOrg.setGradeDictId(1);//AA
        returnVisit.setVisitorType(2);
        int serviceOrg_aaCount = serviceOrgService.count(serviceOrg);
        int serviceOrg_upaaCount = serviceOrgService.countVisit(null);
        int servieOrgVisit_aaCount = returnVisitService.count(returnVisit);
        counts = new ArrayList<>();
        counts.add(servieOrgVisit_aaCount);
        counts.add(serviceOrg_aaCount - servieOrgVisit_aaCount);
        result.put("2A组织回访", counts);

        //3A以上组织回访
        returnVisit.setVisitorType(3);
        int servieOrgVisit_upaaaCount = returnVisitService.count(returnVisit);
        counts = new ArrayList<>();
        counts.add(servieOrgVisit_upaaaCount);
        counts.add(serviceOrg_upaaCount - serviceOrg_aaCount - servieOrgVisit_upaaaCount);
        result.put("AAA以上组织回访", counts);

        //政府购买老人：
        int elderGovBuyCount = elderlyGovBuyService.count(null);
        returnVisit.setVisitorType(1);
        int elderGovBuyVisitCount = returnVisitService.count(returnVisit);
        counts = new ArrayList<>();
        counts.add(elderGovBuyVisitCount);
        counts.add(elderGovBuyCount - elderGovBuyVisitCount);
        result.put("政府购买老人回访", counts);
        return result;
    }
}
