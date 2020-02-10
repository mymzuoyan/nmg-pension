package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.entity.ServiceOrgTowerRoomInformation;
import com.fedtech.pension.org.mapper.ServiceOrgTowerRoomInformationMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
@Service(interfaceClass = ServiceOrgTowerRoomInformationService.class, version = "1.0.0")
public class ServiceOrgTowerRoomInformationServiceImpl extends BaseServiceImpl<ServiceOrgTowerRoomInformation> implements ServiceOrgTowerRoomInformationService {

    @Autowired
    private ServiceOrgTowerRoomInformationMapper mapper;

    @Override
    public BaseMapper<ServiceOrgTowerRoomInformation> getMapper() {
        return mapper;
    }

    @Override
    public ServiceOrgTowerRoomInformation selectByFloorNumberAndfloorId(String roomNum, Integer floorId) {
        return mapper.selectByFloorNumberAndfloorId(roomNum,floorId);
    }

    @Override
    public List<ServiceOrgTowerRoomInformation> selectByFloorNumber(String roomNum,String serviceOrgId) {
        return mapper.selectByFloorNumber(roomNum,serviceOrgId);
    }

    @Override
    public ServiceOrgTowerRoomInformation selectByRoomNumAndServiceOrgId(String roomNum,String serviceOrgId) {
        return mapper.selectByRoomNumAndServiceOrgId(roomNum,serviceOrgId);
    }

    @Override
    public List<ServiceOrgTowerRoomInformation> selectByFloorId(Integer floorId) {
        return mapper.selectByFloorId(floorId);
    }
}
