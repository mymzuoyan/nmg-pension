package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgElderlyNeeds;
import com.fedtech.pension.org.entity.ServiceOrgElderlyNeedsDistribution;
import com.fedtech.pension.org.mapper.ServiceOrgElderlyNeedsDistributionMapper;
import com.fedtech.pension.org.mapper.ServiceOrgElderlyNeedsMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  旅居老人需求发放
 * @author miaoyueming
 * @date 2019/9/27
 */
@Service(interfaceClass = ServiceOrgElderlyNeedsDistributionService.class, version = "1.0.0")
public class ServiceOrgElderlyNeedsDistributionServiceImpl extends BaseServiceImpl<ServiceOrgElderlyNeedsDistribution> implements ServiceOrgElderlyNeedsDistributionService {

    @Autowired
    private ServiceOrgElderlyNeedsDistributionMapper serviceOrgElderlyNeedsDistributionMapper;


    @Override
    public BaseMapper<ServiceOrgElderlyNeedsDistribution> getMapper() {
        return serviceOrgElderlyNeedsDistributionMapper;
    }
}


