package com.fedtech.pension.controller.admin.call;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.commons.utils.ObjectUtils;
import com.fedtech.pension.annotation.SystemControllerLog;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.entity.CustomerGroup;
import com.fedtech.pension.call.entity.CustomerLinkGroup;
import com.fedtech.pension.call.entity.CustomerRelate;
import com.fedtech.pension.call.service.CustomerGroupService;
import com.fedtech.pension.call.service.CustomerLinkGroupService;
import com.fedtech.pension.call.service.CustomerRelateService;
import com.fedtech.pension.call.service.CustomerService;
import com.fedtech.pension.controller.BaseController;
import com.google.common.base.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/14
 */
@Controller
@RequestMapping("/admin/call/api/customer/")
public class CustomerApiController extends BaseController {

    protected Logger logger = LoggerFactory.getLogger(CustomerApiController.class);

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Reference(version = "1.0.0")
    private CustomerService customerService;

    @Reference(version = "1.0.0")
    private CustomerGroupService customerGroupService;

    @Reference(version = "1.0.0")
    private CustomerLinkGroupService customerLinkGroupService;

    @Reference(version = "1.0.0")
    private CustomerRelateService customerRelateService;

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加呼叫客户")
    public JsonResult addCustomer(Customer customer, String timeStr, String groupIds) throws ParseException {
        JsonResult result = new JsonResult();
        if (!StringUtils.isEmpty(timeStr)) {
            customer.setBeeperTime(df.parse(timeStr));
        }
        if (StringUtils.isEmpty(customer.getElderId())) {
            result.markError("客户姓名是必须的");
            return result;
        } else if (ObjectUtils.isNotNull(customerService.selectByElderId(customer.getElderId()))) {
            result.markError("呼叫客户已存在");
            return result;
        }
        if (customerService.insert(customer)) {
            if (!StringUtils.isEmpty(groupIds)) {
                String[] groupId = groupIds.split(",");
                for (int i = 0; i < groupId.length; i++) {
                    try {
                        if (Integer.parseInt(groupId[i]) > 0) {
                            CustomerLinkGroup customerLinkGroup = new CustomerLinkGroup();
                            customerLinkGroup.setGroupId(Integer.parseInt(groupId[i]));
                            customerLinkGroup.setCustomerId(customer.getId());
                            if (!customerLinkGroupService.insert(customerLinkGroup)) {
                                result.markError("创建客户失败");
                                return result;
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            result.markSuccess("创建客户成功", null);
        } else {
            result.markError("创建客户失败");
        }
        return result;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新呼叫客户")
    public JsonResult updateCustomer(Customer customer) {
        JsonResult result = new JsonResult();
        if (customerService.updateByPrimaryKeySelective(customer)) {
            result.markSuccess("更新成功", null);
        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 获取客户列表
     *
     * @param customer
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "查看呼叫客户列表")
    public PageResponse<Customer> getCustomerList(Customer customer, PageRequest pageRequest) {
        if (StringUtils.isEmpty(customer.getBeeperAddress())) {
            customer.setBeeperAddress(currentUser().getAreaName());
        }
        pageRequest.setOrderField("a.id");
        pageRequest.setOrderDir("DESC");
        PageResponse<Customer> customers = customerService.selectPageList(customer, pageRequest);
        return customers;
    }

    /**
     * 导入
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "import", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importExcel(@RequestParam("file") MultipartFile file) {
        JsonResult result = new JsonResult();
        try {
            result = customerService.importExcel(file, currentUser().getUid());
        } catch (Exception e) {
            e.printStackTrace();
            result.markError("导入失败");
        }
        return result;
    }


    @RequestMapping(value = "/group/add", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加呼叫客户群组")
    public JsonResult addMonitorGroup(CustomerGroup customerGroup) throws ParseException {
        JsonResult result = new JsonResult();
        if (StringUtils.isEmpty(customerGroup.getName())) {
            result.markError("呼叫客户群组不能为空");
            return result;
        } else if (ObjectUtils.isNotNull(customerGroupService.selectByName(customerGroup.getName()))) {
            result.markError("呼叫客户群组已存在");
            return result;
        }
        if (customerGroupService.insert(customerGroup)) {

            result.markSuccess("创建客户群组成功", null);
        } else {
            result.markError("创建客户群组失败");
        }
        return result;
    }

    @RequestMapping(value = "/group/update", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "更新组织机构")
    public JsonResult updateCustomerGroup(CustomerGroup customerGroup) {
        JsonResult result = new JsonResult();
        if (customerGroupService.updateByPrimaryKeySelective(customerGroup)) {
            result.markSuccess("更新成功", null);

        } else {
            result.markError("更新失败");
        }
        return result;
    }


    /**
     * 获取客户群组列表
     *
     * @param customerGroup
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "/group/list", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<CustomerGroup> getCustomerGroupList(CustomerGroup customerGroup, PageRequest pageRequest) {
        PageResponse<CustomerGroup> groups = customerGroupService.selectPageList(customerGroup, pageRequest);
        return groups;
    }


    /**
     * 获取群组客户列表
     *
     * @param groupId
     * @param pageRequest
     * @return
     */
    @RequestMapping(value = "/group/getListByGroupId", method = RequestMethod.POST)
    @ResponseBody
    public PageResponse<Customer> getCustomerListByGroupId(Integer groupId, PageRequest pageRequest) {
        PageResponse<Customer> customers = customerService.selectCustomerPageList(groupId, pageRequest);
        return customers;
    }

    /**
     * 获取相关联系人
     *
     * @param customerRelate
     * @return
     */
    @RequestMapping(value = "getCustomerRelate", method = RequestMethod.POST)
    @ResponseBody
    public List<CustomerRelate> getCustomerRelateList(CustomerRelate customerRelate) {
        List<CustomerRelate> customerRelates = customerRelateService.getAllRecode(customerRelate);
        return customerRelates;
    }

    /**
     * 获取特定联系人信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "getCustomerRelateById", method = RequestMethod.POST)
    @ResponseBody
    public CustomerRelate getCustomerRelateById(Integer id) {
        CustomerRelate customerRelate = customerRelateService.selectByPrimaryKey(id);
        return customerRelate;
    }

    /**
     * 添加相关联系人
     *
     * @param customerRelate
     * @return
     */
    @RequestMapping(value = "addCustomerRelate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "添加呼叫客户相关联系人")
    public JsonResult addCustomerRelate(CustomerRelate customerRelate, String birth) {
        if (!Strings.isNullOrEmpty(birth)) {
            try {
                customerRelate.setBirthDate(df.parse(birth));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        JsonResult result = new JsonResult();
        if (customerRelateService.insert(customerRelate)) {
            result.markSuccess("添加成功", null);
        } else
            result.markError("添加失败");
        return result;
    }

    /**
     * 删除相关联系人
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCustomerRelate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "删除呼叫客户相关联系人")
    public JsonResult deleteCustomerRelate(Integer id) {
        JsonResult result = new JsonResult();
        if (customerRelateService.deleteByPrimaryKey(id)) {
            result.markSuccess("删除成功", null);
        } else
            result.markError("删除失败");
        return result;
    }

    /**
     * 更新相关联系人
     *
     * @param customerRelate
     * @return
     */
    @RequestMapping(value = "updateCustomerRelate", method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(description = "呼叫客户相关联系人")
    public JsonResult updateCustomerRelate(CustomerRelate customerRelate, String birth) {
        if (!Strings.isNullOrEmpty(birth)) {
            try {
                customerRelate.setBirthDate(df.parse(birth));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        JsonResult result = new JsonResult();
        if (customerRelateService.updateByPrimaryKeySelective(customerRelate)) {
            result.markSuccess("更新成功", null);
        } else
            result.markError("更新失败");
        return result;
    }


}
