package com.fedtech.pension.call.mapper;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.pension.call.entity.CustomerLinkGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/29
 */
public interface CustomerLinkGroupMapper extends BaseMapper<CustomerLinkGroup> {

    /**
     * 获取客户相关联系人
     *
     * @param customerId
     * @return
     */
    List<CustomerLinkGroup> selectByCustomerId(@Param("customerId") Integer customerId);

    /**
     * 删除
     *
     * @param customerId
     * @return
     */
    boolean deleteByCustomerId(@Param("customerId") Integer customerId);
}
