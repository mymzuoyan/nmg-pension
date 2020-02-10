package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.entity.CustomerGroup;
import com.fedtech.pension.call.entity.CustomerLinkGroup;
import com.fedtech.pension.call.service.CustomerGroupService;
import com.fedtech.pension.call.service.CustomerLinkGroupService;
import com.fedtech.pension.call.service.CustomerService;
import com.fedtech.pension.controller.BaseController;
import com.fedtech.pension.elderly.entity.ElderlyMsg;
import com.fedtech.pension.elderly.service.ElderlyMsgService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/14
 */
@Controller
@RequestMapping("/admin/call/customer")
public class CustomerController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @Reference(version = "1.0.0")
    private CustomerService customerService;

    @Reference(version = "1.0.0")
    private CustomerGroupService customerGroupService;

    @Reference(version = "1.0.0")
    private ElderlyMsgService elderlyMsgService;

    @Reference(version = "1.0.0")
    private CustomerLinkGroupService customerLinkGroupService;

    /**
     * 创建呼叫客户页面
     *
     * @return
     */
    @RequestMapping("add")
    public String showPage_addCustomer() {
        return ADMIN_CALL_PREFIX + "customer_add";
    }

    /**
     * 客户列表页面
     *
     * @return
     */
    @RequestMapping("list")
    public String showPage_listCustomer() {
        return ADMIN_CALL_PREFIX + "customer_list";
    }

    /**
     * 查看更新
     *
     * @param customerId
     * @param model
     * @return
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateCustomer(@PathVariable("id") Integer customerId, Model model) {
        Customer customer = customerService.selectByPrimaryKey(customerId);
        ElderlyMsg elderlyMsg = elderlyMsgService.selectByPrimaryKey(customer.getElderId());
        List<CustomerLinkGroup> groupList = customerLinkGroupService.selectByCustomerId(customer.getId());
        if (ObjectUtils.isNotNull(groupList)) {
            model.addAttribute("group", groupList.get(0));
        }
        model.addAttribute(customer);
        model.addAttribute(elderlyMsg);
        return ADMIN_CALL_PREFIX + "customer_info";

    }


    /**
     * 创建呼叫客户群组页面
     *
     * @return
     */
    @RequestMapping("/group/add")
    public String showPage_addCustomerGroup() {
        return ADMIN_CALL_PREFIX + "customer_group_add";
    }

    /**
     * 呼叫客户群组列表
     *
     * @return
     */
    @RequestMapping("/group/list")
    public String showPage_CustomerGroups() {
        return ADMIN_CALL_PREFIX + "customer_group_list";
    }

    /**
     * 呼叫客户群组列表
     *
     * @return
     */
    @RequestMapping("/group/update/{id}")
    public String showPage_UpdateCustomerGroups(@PathVariable("id") Integer customerGroupId, Model model) {
        CustomerGroup group = customerGroupService.selectByPrimaryKey(customerGroupId);
        model.addAttribute("group", group);
        return ADMIN_CALL_PREFIX + "customer_group_info";
    }
}
