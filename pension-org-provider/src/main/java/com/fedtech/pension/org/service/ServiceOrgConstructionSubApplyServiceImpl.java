package com.fedtech.pension.org.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgConstructionSubsidyApply;
import com.fedtech.pension.org.mapper.ServiceOrgConstructionSubApplyMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


@Service(interfaceClass = ServiceOrgConstructionSubApplyService.class,version = "1.0.0")
public class ServiceOrgConstructionSubApplyServiceImpl extends BaseServiceImpl<ServiceOrgConstructionSubsidyApply> implements ServiceOrgConstructionSubApplyService{
    @Autowired
    private ServiceOrgConstructionSubApplyMapper serviceOrgConstructionSubApplyMapper;
    @Override
    public BaseMapper<ServiceOrgConstructionSubsidyApply> getMapper() {
        return serviceOrgConstructionSubApplyMapper;
    }

    @Override
    public ServiceOrgConstructionSubsidyApply selectByServiceOrgId(Integer serviceOrgId) {
        return serviceOrgConstructionSubApplyMapper.selectByServiceOrgId(serviceOrgId);
    }

    @Override
    public List<ServiceOrgConstructionSubsidyApply> selectAll() {
        return serviceOrgConstructionSubApplyMapper.selectAll();
    }
}
