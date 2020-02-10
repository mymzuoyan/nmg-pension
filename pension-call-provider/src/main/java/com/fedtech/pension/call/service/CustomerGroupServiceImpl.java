package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.CustomerGroup;
import com.fedtech.pension.call.mapper.CustomerGroupMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Administrator
 * @date 2016/9/12
 */
@Service(interfaceClass = CustomerGroupService.class, version = "1.0.0")
public class CustomerGroupServiceImpl extends BaseServiceImpl<CustomerGroup> implements CustomerGroupService {

    @Autowired
    private CustomerGroupMapper mapper;

    @Override
    public BaseMapper<CustomerGroup> getMapper() {
        return mapper;
    }

    @Override
    public CustomerGroup selectByName(String name) {
        return mapper.selectByName(name);
    }
}
