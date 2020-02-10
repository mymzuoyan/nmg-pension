package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgElderly;
import com.fedtech.pension.org.entity.ServiceOrgTowerRoomInformation;
import com.fedtech.pension.org.mapper.ServiceOrgElderlyMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author gengqiang
 * @date 2018/1/15
 */
@Service(interfaceClass = ServiceOrgElderlyService.class, version = "1.0.0")
public class ServiceOrgElderlyServiceImpl extends BaseServiceImpl<ServiceOrgElderly> implements ServiceOrgElderlyService {

    @Autowired
    private ServiceOrgElderlyMapper mapper;

    @Override
    public BaseMapper<ServiceOrgElderly> getMapper() {
        return mapper;
    }



    @Override
    public ServiceOrgElderly selectByElderlyId(Integer elderlyId) {
        return mapper.selectByElderlyId(elderlyId);
    }

    @Override
    public List<ServiceOrgElderly> selectByServiceOrgId(Integer serviceOrgId) {
        return mapper.selectByServiceOrgId(serviceOrgId);
    }

    @Override
    public List<ServiceOrgElderly> selectByServiceOrgIdAndBedNumber(Integer serviceOrgId, String bedNumber) {
        return mapper.selectByServiceOrgIdAndBedNumber(serviceOrgId,bedNumber);
    }
}
