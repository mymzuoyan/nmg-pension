package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgEmergencyManagement;
import com.fedtech.pension.org.mapper.ServiceOrgEmergencyManagementMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author fww
 */
@Service(interfaceClass = ServiceOrgEmergencyManagementService.class, version = "1.0.0")
public class ServiceOrgEmergencyManagementServiceImpl extends BaseServiceImpl<ServiceOrgEmergencyManagement> implements ServiceOrgEmergencyManagementService{

    @Autowired
    private ServiceOrgEmergencyManagementMapper mapper;

    @Override
    public BaseMapper<ServiceOrgEmergencyManagement> getMapper() {
        return mapper;
    }
}
