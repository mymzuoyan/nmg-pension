package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseService;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgWareHouse;
import com.fedtech.pension.org.mapper.ServiceOrgWareHouseMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2019/6/27
 */
@Service(interfaceClass = ServiceOrgWareHouseService.class, version = "1.0.0")
public class ServiceOrgWareHouseServiceImpl extends BaseServiceImpl<ServiceOrgWareHouse> implements ServiceOrgWareHouseService {

    @Autowired
    private ServiceOrgWareHouseMapper mapper;


    @Override
    public BaseMapper<ServiceOrgWareHouse> getMapper() {
        return mapper;
    }
}
