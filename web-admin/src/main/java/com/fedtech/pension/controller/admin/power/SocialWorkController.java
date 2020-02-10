package com.fedtech.pension.controller.admin.power;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.enums.RoleType;
import com.fedtech.commons.utils.DateUtil;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.entity.ServiceOrgSocialWork;
import com.fedtech.pension.org.service.ServiceOrgRecreationalActivitiesService;
import com.fedtech.pension.org.service.ServiceOrgSocialDonationService;
import com.fedtech.pension.org.service.ServiceOrgSocialWorkService;
import com.fedtech.pension.power.entity.*;
import com.fedtech.pension.power.service.BillService;
import com.fedtech.pension.power.service.MoneyflowService;
import com.fedtech.pension.power.service.OldManCardService;
import com.fedtech.pension.power.service.OrderService;
import com.fedtech.pension.sys.entity.User;
import com.fedtech.pension.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/admin/api/power/socialWork/")
@EnableScheduling
public class SocialWorkController extends BaseController {

    @Reference(version = "1.0.0")
    public BillService billService;
    @Reference(version = "1.0.0")
    public OrderService orderService;
    @Reference(version = "1.0.0")
    public OldManCardService oldManCardService;
    @Reference(version = "1.0.0")
    public UserService userService ;
    @Reference(version = "1.0.0")
    private MoneyflowService moneyflowService;
    @Reference(version = "1.0.0")
    private ServiceOrgSocialWorkService serviceOrgSocialWorkService;
    public final String ADMIN_PREFIX = "/admin/lrnlpg/";
    /**
     * 账单列表
     * @return
     */
    @RequestMapping("billList")
    public  String  showBillList(){
        return ADMIN_PREFIX + "billList";
    }

    /**
     * 社会服务信息管理列表
     * @return
     */
    @RequestMapping("communityServiceList")
    public  String  communityServiceList(){
        return ADMIN_PREFIX + "communityServiceList";
    }



    /**
     * 社会服务信息管理列表批量删除
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
        if (serviceOrgSocialWorkService.deleteSomeMsg(idList)) {
            result.markSuccess("删除成功", null);
        } else {
            result.markError("删除失败");
        }
        return result;
    }

    @RequestMapping("getSocialWorkList")
    @ResponseBody
    public PageResponse<ServiceOrgSocialWork> getSocialWorkList(ServiceOrgSocialWork filter, PageRequest pageRequest) throws Exception{


        if (getCurrentUser().hasRole(RoleType.ZuAdmin.getValue())) {
            filter.setOrganizationName(currentUser().getServiceOrgName());
        }
        return serviceOrgSocialWorkService.selectPageList(filter,pageRequest);



    }

    @RequestMapping("getBillList")
    @ResponseBody
    public PageResponse<Bill> getBillList(Bill filter, PageRequest pageRequest) throws Exception{
        if(RoleType.SuAdmin.getId()== getRoleId()){
            filter.setOrgId("");
        }else{
            User user = userService.selectByPrimaryKey(currentUser().getUid());
            filter.setOrgId(user.getServiceOrgId());
        }

        return  billService.selectPageList(filter, pageRequest);
    }
    /**
     * 账单信息新增
     *
     * @return
     */
    @RequestMapping("billAdd")
    public String billAdd(Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        User user = userService.selectByPrimaryKey(currentUser().getUid());
        model.addAttribute("user", user);
        Bill bill = new Bill();
        String  flowNumber=DateUtil.getOrderNum()+new Random().nextInt(10000)+"";
        bill.setFlowNumber(flowNumber);
        model.addAttribute("m",bill);

//        model.addAttribute("zuzhiRoleId", RoleType.ZuAdmin.getId());
        return ADMIN_PREFIX + "billAdd";
    }

    /**
     * 社会服务信息新增
     *
     * @return
     */
    @RequestMapping("communityServiceListAdd")
    public String communityServiceListAdd() {
        return ADMIN_PREFIX + "communityServiceListAdd";
    }

    /**
     * 账单信息详情
     *
     * @return
     */
    @RequestMapping("billDetail")
    public String billDetail(Model model,Bill filter) {
        filter=billService.selectByPrimaryKey(filter.getId());
        List<Order> orders=orderService.selectByBillId(filter.getId());
        model.addAttribute("m",filter);
        model.addAttribute("orders",orders);
        return ADMIN_PREFIX + "billDetail";
    }

    /**
     * 社会服务详情
     *
     * @return
     */
    @RequestMapping("communityServiceDetail")
    public String happyDetail(Model model,ServiceOrgSocialWork filter) {
        filter=serviceOrgSocialWorkService.selectByPrimaryKey(filter.getId());
        model.addAttribute("m",filter);
        return ADMIN_PREFIX + "communityServiceDetail";
    }

    /**
     * 账单信息结算
     *
     * @return
     */
    @RequestMapping(value = "settlement", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "账单信息结算")
    public JsonResult settlement(Bill filter, GetOrders getOrders) {
        JsonResult result = new JsonResult();
        filter=billService.insertBackId(filter);
        OldManCard oldManCard=new OldManCard();
        oldManCard.setId(filter.getOldManCardId());
        oldManCard.setMoney(filter.getUltimateBalance());
        oldManCardService.updateOldManCard(oldManCard);
        for (Order order:getOrders.getOrders()) {
            order.setBillId(filter.getId());
            orderService.insert(order);
        }
        MoneyFlow moneyFlow=new MoneyFlow();
        moneyFlow.setCardId(filter.getCardNumber());
        moneyFlow.setAmount(-filter.getPrice());
//        moneyFlow.setArea(filter.getOrgName());
        moneyFlow.setServiceOrgId(filter.getOrgId());
        moneyFlow.setServiceOrgName(filter.getOrgName());
        moneyFlow.setOldmanId(filter.getElderlyId());
        moneyFlow.setServerNum(filter.getFlowNumber());
        if(moneyflowService.insertMoneyFlow(moneyFlow)){
            result.markSuccess("助老卡充值流水添加", null);
        }else{
            result.markError("助老卡充值流水添加失败");
        }
        result.markSuccess("结算成功",null);
        return result;
    }

    /**
     * 账单信息作废
     *
     * @return
     */
    @RequestMapping(value = "invalid", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "账单信息作废")
    public JsonResult invalid(Bill filter) {
        JsonResult result = new JsonResult();
        billService.invalidBill(filter);
        result.markSuccess("作废成功",null);
        return result;
    }

    /**
     * 删除
     *
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    @SystemControllerLog(description = "批量删除")
    public JsonResult delete(String deleteIds) {
        JsonResult result = new JsonResult();
        List<Integer> idList = new ArrayList<Integer>();
        if (deleteIds != null) {
            for (int i = 0; i < deleteIds.split(",").length; i++) {
                if (deleteIds.split(",")[i] != null && deleteIds.split(",")[i] != "") {
                    idList.add(Integer.parseInt(deleteIds.split(",")[i]));
                }
            }
            if (billService.deleteSomeMsg(idList)) {
                result.markSuccess("删除成功", null);
            } else {
                result.markError("删除失败");
            }
        }
        return result;
    }
}
