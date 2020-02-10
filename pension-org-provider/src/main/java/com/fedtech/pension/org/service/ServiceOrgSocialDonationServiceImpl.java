package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgSocialDonation;
import com.fedtech.pension.org.mapper.ServiceOrgElderlyMapper;
import com.fedtech.pension.org.mapper.ServiceOrgSocialDonationMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gxy
 * @date 2019/6/27 - 16:49
 */
@Service(interfaceClass = ServiceOrgSocialDonationService.class, version = "1.0.0")
public class ServiceOrgSocialDonationServiceImpl extends BaseServiceImpl<ServiceOrgSocialDonation> implements ServiceOrgSocialDonationService  {

    @Autowired
    private ServiceOrgSocialDonationMapper mapper;

    @Override
    public BaseMapper<ServiceOrgSocialDonation> getMapper() {
        return mapper;
    }
}
