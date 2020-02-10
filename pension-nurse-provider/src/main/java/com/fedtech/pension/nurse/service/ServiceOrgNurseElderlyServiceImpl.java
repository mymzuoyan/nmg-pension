package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.ServiceOrgNurseElderly;
import com.fedtech.pension.nurse.mapper.ServiceOrgNurseElderlyMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/8/22
 */
@Service(interfaceClass = ServiceOrgNurseElderlyService.class, version = "1.0.0")
public class ServiceOrgNurseElderlyServiceImpl extends BaseServiceImpl<ServiceOrgNurseElderly> implements ServiceOrgNurseElderlyService {
    @Autowired
    private ServiceOrgNurseElderlyMapper mapper;

    @Override
    public BaseMapper<ServiceOrgNurseElderly> getMapper() {
        return mapper;
    }

    @Override
    public boolean deleteByIdcardnoAndNumber(Integer elderId, String number) {
        return mapper.deleteByIdcardnoAndNumber(elderId, number) > 0;
    }

    @Override
    public ServiceOrgNurseElderly findByIdcardnoAndNumber(Integer elderId, String number) {
        return mapper.findByIdcardnoAndNumber(elderId, number);
    }
}
