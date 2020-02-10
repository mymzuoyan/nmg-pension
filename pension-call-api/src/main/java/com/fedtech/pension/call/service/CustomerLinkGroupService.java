package com.fedtech.pension.call.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.call.entity.CustomerLinkGroup;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/29
 */
public interface CustomerLinkGroupService extends BaseService<CustomerLinkGroup> {

    /**
     * 获取客户相关联系人
     *
     * @param customerId
     * @return
     */
    List<CustomerLinkGroup> selectByCustomerId(Integer customerId);

    /**
     * 删除客户相关联系人
     *
     * @param customerId
     * @return
     */
    boolean deleteByCustomerId(Integer customerId);
}
