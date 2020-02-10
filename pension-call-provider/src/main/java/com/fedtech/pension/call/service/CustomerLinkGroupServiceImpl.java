package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.CustomerLinkGroup;
import com.fedtech.pension.call.mapper.CustomerLinkGroupMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/29
 */
@Service(interfaceClass = CustomerLinkGroupService.class, version = "1.0.0")
public class CustomerLinkGroupServiceImpl extends BaseServiceImpl<CustomerLinkGroup> implements CustomerLinkGroupService {

    @Autowired
    private CustomerLinkGroupMapper mapper;

    @Override
    public BaseMapper<CustomerLinkGroup> getMapper() {
        return mapper;
    }

    @Override
    public List<CustomerLinkGroup> selectByCustomerId(Integer customerId) {
        return mapper.selectByCustomerId(customerId);
    }

    @Override
    public boolean deleteByCustomerId(Integer customerId) {
        return mapper.deleteByCustomerId(customerId);
    }
}
