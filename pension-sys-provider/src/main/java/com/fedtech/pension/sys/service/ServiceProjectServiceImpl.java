package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.ServiceProject;
import com.fedtech.pension.sys.mapper.ServiceProjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/9/27
 */
@Service(interfaceClass = ServiceProjectService.class, version = "1.0.0")
public class ServiceProjectServiceImpl extends BaseServiceImpl<ServiceProject> implements ServiceProjectService {

    @Autowired
    private ServiceProjectMapper serviceProjectMapper;

    @Override
    public BaseMapper<ServiceProject> getMapper() {
        return serviceProjectMapper;
    }

    @Override
    public List<ServiceProject> getServiceProjectsByType(String types) {
        return serviceProjectMapper.getServiceProjectsByType(types);
    }

    @Override
    public List<ServiceProject> selectByTypeAndServiceOrgId(String types, Integer serviceOrgId) {
        return serviceProjectMapper.selectByTypeAndServiceOrgId(types, serviceOrgId);
    }
}
