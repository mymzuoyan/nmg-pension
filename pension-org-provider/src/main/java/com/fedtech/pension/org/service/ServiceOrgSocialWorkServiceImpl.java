package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgSocialWork;
import com.fedtech.pension.org.mapper.ServiceOrgSocialDonationMapper;
import com.fedtech.pension.org.mapper.ServiceOrgSocialWorkMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gxy
 * @date 2019/6/27 - 16:59
 */

@Service(interfaceClass = ServiceOrgSocialWorkService.class, version = "1.0.0")
public class ServiceOrgSocialWorkServiceImpl extends BaseServiceImpl<ServiceOrgSocialWork> implements ServiceOrgSocialWorkService {

    @Autowired
    private ServiceOrgSocialWorkMapper mapper;

    @Override
    public BaseMapper<ServiceOrgSocialWork> getMapper() {
        return mapper;
    }
}
