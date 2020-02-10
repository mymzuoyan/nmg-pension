package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgRecreationalActivities;
import com.fedtech.pension.org.mapper.ServiceOrgRecreationalActivitiesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;

import java.util.List;

@Service(interfaceClass = ServiceOrgRecreationalActivitiesService.class, version = "1.0.0")
public class ServiceOrgRecreationalActivitiesServiceImpl extends BaseServiceImpl<ServiceOrgRecreationalActivities> implements ServiceOrgRecreationalActivitiesService{

    @Autowired
    private ServiceOrgRecreationalActivitiesMapper mapper;

    @Override
    public BaseMapper<ServiceOrgRecreationalActivities> getMapper() {
        return mapper;
    }

}
