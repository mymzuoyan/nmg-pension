package com.fedtech.pension.call.service;

import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.commons.data.PageResponse;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.vo.CustomerVisitVo;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2016/9/12.
 */
public interface CustomerService extends BaseService<Customer> {

    /**
     * 分页获取
     *
     * @param groupId
     * @param pageRequest
     * @return
     */
    PageResponse<Customer> selectCustomerPageList(Integer groupId, PageRequest pageRequest);

    /**
     * 根据老人id老获取客户
     *
     * @param elderId
     * @return
     */
    Customer selectByElderId(Integer elderId);

    /**
     * 根据呼叫号码来获取客户
     *
     * @param callNum
     * @return
     */
    Customer selectByCallNum(String callNum);

    /**
     * 批量获取
     *
     * @param callNums
     * @return
     */
    List<Customer> selectByCallNums(List<String> callNums);

    /**
     * 需要回访的老人分页查询
     *
     * @param filter
     * @param pageRequest
     * @return
     */
    PageResponse<CustomerVisitVo> selectVisitPageList(CustomerVisitVo filter, PageRequest pageRequest);

    /**
     * 导入
     *
     * @param file
     * @param uid
     * @return
     * @throws IOException
     * @throws InvalidFormatException
     */
    JsonResult importExcel(MultipartFile file, Integer uid) throws IOException, InvalidFormatException;

}
