package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgRoutineCheck;
import com.fedtech.pension.org.mapper.ServiceOrgRoutineCheckMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author yisuqin
 * @date 2019/10/24
 */
@Service(interfaceClass = ServiceOrgRoutineCheckService.class,version = "1.0.0")
public class ServiceOrgRoutineCheckServiceImpl extends BaseServiceImpl<ServiceOrgRoutineCheck> implements ServiceOrgRoutineCheckService {

    @Autowired
    private ServiceOrgRoutineCheckMapper mapper;

    @Override
    public BaseMapper<ServiceOrgRoutineCheck> getMapper() {
        return mapper;
    }

}
