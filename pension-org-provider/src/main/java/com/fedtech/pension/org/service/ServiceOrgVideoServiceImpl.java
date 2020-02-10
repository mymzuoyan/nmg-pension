package com.fedtech.pension.org.service;



import com.alibaba.dubbo.config.annotation.Service;

import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgVideo;
import com.fedtech.pension.org.mapper.ServiceOrgVideoMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service(interfaceClass = ServiceOrgVideoService.class, version = "1.0.0")
public class ServiceOrgVideoServiceImpl extends BaseServiceImpl<ServiceOrgVideo> implements ServiceOrgVideoService {

    @Autowired
    private ServiceOrgVideoMapper serviceOrgVideoMapper;

    @Override
    public BaseMapper<ServiceOrgVideo> getMapper() {
        return serviceOrgVideoMapper;
    }

    @Override
    public boolean addServiceOrgVideo(ServiceOrgVideo serviceOrgVideo) {
        return serviceOrgVideoMapper.addServiceOrgVideo(serviceOrgVideo)>=0;
    }

    @Override
    public boolean deleteServiceOrgVideo(ServiceOrgVideo serviceOrgVideo) {
        return serviceOrgVideoMapper.deleteServiceOrgVideo(serviceOrgVideo)>=0;
    }

    @Override
    public List<ServiceOrgVideo> getAllVideoById(Integer orgId) {
        return serviceOrgVideoMapper.getAllVideoById(orgId);
    }
}
