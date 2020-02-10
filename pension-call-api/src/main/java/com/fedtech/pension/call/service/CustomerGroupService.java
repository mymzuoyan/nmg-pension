package com.fedtech.pension.call.service;


import com.fedtech.commons.base.BaseService;
import com.fedtech.pension.call.entity.CustomerGroup;

/**
 * Created by Administrator on 2016/9/12.
 */
public interface CustomerGroupService extends BaseService<CustomerGroup> {

    /**
     * 获取呼叫客户
     * @param name
     * @return
     */
    CustomerGroup selectByName(String name);
}
