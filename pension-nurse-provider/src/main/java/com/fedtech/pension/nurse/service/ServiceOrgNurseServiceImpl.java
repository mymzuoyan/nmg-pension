package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.ServiceOrgNurse;
import com.fedtech.pension.nurse.mapper.ServiceOrgNurseMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/8/21
 */
@Service(version = "1.0.0", interfaceClass = ServiceOrgNurseService.class)
public class ServiceOrgNurseServiceImpl extends BaseServiceImpl<ServiceOrgNurse> implements ServiceOrgNurseService {

    @Autowired
    private ServiceOrgNurseMapper mapper;

    @Override
    public BaseMapper<ServiceOrgNurse> getMapper() {
        return mapper;
    }
}
