package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgCashRegister;
import com.fedtech.pension.org.mapper.ServiceOrgCashRegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/8/4
 */
@Service(interfaceClass = ServiceOrgCashRegisterService.class, version = "1.0.0")
public class ServiceOrgCashRegisterServiceImpl extends BaseServiceImpl<ServiceOrgCashRegister> implements ServiceOrgCashRegisterService {

    @Autowired
    private ServiceOrgCashRegisterMapper mapper;

    @Override
    public BaseMapper<ServiceOrgCashRegister> getMapper() {
        return mapper;
    }
}
