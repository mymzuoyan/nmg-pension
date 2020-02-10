package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgAssessment;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.mapper.ServiceOrgFloorInformationMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
@Service(interfaceClass = ServiceOrgFloorInformationService.class, version = "1.0.0")
public class ServiceOrgFloorInformationServiceImpl extends BaseServiceImpl<ServiceOrgFloorInformation> implements ServiceOrgFloorInformationService {

    @Autowired
    private ServiceOrgFloorInformationMapper mapper;

    @Override
    public BaseMapper<ServiceOrgFloorInformation> getMapper() {
        return mapper;
    }


    @Override
    public ServiceOrgFloorInformation selectByFloorNumber(String floorNumber,Integer towerCourtyardId) {
        return mapper.selectByFloorNumber(floorNumber,towerCourtyardId);
    }

    @Override
    public List<ServiceOrgFloorInformation> selectByTowerCourtyardId(Integer towerCourtyardId) {
        return mapper.selectByTowerCourtyardId(towerCourtyardId);
    }

}
