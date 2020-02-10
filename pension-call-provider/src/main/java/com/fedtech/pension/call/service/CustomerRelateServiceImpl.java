package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.CustomerRelate;
import com.fedtech.pension.call.mapper.CustomerRelateMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author CodingQiang
 * @date 2016/10/24
 */
@Service(interfaceClass = CustomerRelateService.class, version = "1.0.0")
public class CustomerRelateServiceImpl extends BaseServiceImpl<CustomerRelate> implements CustomerRelateService {

    @Autowired
    private CustomerRelateMapper mapper;

    @Override
    public BaseMapper<CustomerRelate> getMapper() {
        return mapper;
    }
}
