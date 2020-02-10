package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.data.PageRequest;
import com.fedtech.pension.call.entity.Customer;
import com.fedtech.pension.call.vo.CustomerVisitVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author gengqiang
 */
public interface CustomerMapper extends BaseMapper<Customer> {

    /**
     * 根据老人id获取客户信息
     *
     * @param elderId
     * @return
     */
    Customer selectByElderId(@Param("elderId") Integer elderId);

    /**
     * 根据呼叫号码来获取客户
     *
     * @param callNum
     * @return
     */
    Customer selectByCallNum(@Param("callNum") String callNum);

    /**
     * 统计筛选后的数据
     *
     * @param groupId
     * @return
     */
    int countUser(@Param("groupId") Integer groupId);

    /**
     * 分页查询
     *
     * @param groupId
     * @param pageRequest
     * @return
     */
    List<Customer> selectCustomerPageList(@Param("groupId") Integer groupId, @Param("page") PageRequest pageRequest);


    /**
     * 根据多个电话号码来获取客户信息
     *
     * @param callNums
     * @return
     */
    List<Customer> selectByCallNums(@Param("callNums") List<String> callNums);


    /**
     * 需要回访的老人分页查询
     *
     * @param t
     * @param pageRequest
     * @return
     */
    List<CustomerVisitVo> selectVisitPageList(@Param("filter") CustomerVisitVo t, @Param("page") PageRequest pageRequest);

    /**
     * 统计筛选后的需要回访的老人数据
     *
     * @param filter
     * @return
     */
    int countVisit(CustomerVisitVo filter);
}
