package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.entity.ServiceOrgTowerCourtyardInformation;
import com.fedtech.pension.org.mapper.ServiceOrgTowerCourtyardInformationMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
@Service(interfaceClass = ServiceOrgTowerCourtyardInformationService.class, version = "1.0.0")
public class ServiceOrgTowerCourtyardInformationServiceImpl extends BaseServiceImpl<ServiceOrgTowerCourtyardInformation> implements ServiceOrgTowerCourtyardInformationService {

    @Autowired
    private ServiceOrgTowerCourtyardInformationMapper mapper;

    @Override
    public BaseMapper<ServiceOrgTowerCourtyardInformation> getMapper() {
        return mapper;
    }

    @Override
    public ServiceOrgTowerCourtyardInformation selectByTowerCourtyardNum(String towerCourtyardNum) {
        return mapper.selectByTowerCourtyardNum(towerCourtyardNum);
    }

    @Override
    public List<ServiceOrgTowerCourtyardInformation> selectByServiceOrgId(Integer serviceOrgId) {
        return mapper.selectByServiceOrgId(serviceOrgId);
    }

    @Override
    public ServiceOrgTowerCourtyardInformation selectByTowerCourtyardNumAndServiceOrgId(String towerCourtyardNum, Integer ServiceOrgId) {
        return mapper.selectByTowerCourtyardNumAndServiceOrgId(towerCourtyardNum,ServiceOrgId);
    }

}
