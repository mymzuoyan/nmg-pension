package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgBedsInformation;
import com.fedtech.pension.org.entity.ServiceOrgFloorInformation;
import com.fedtech.pension.org.mapper.ServiceOrgBedsInformationMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author guxiangyang
 * @date 2019/10/10
 */
@Service(interfaceClass = ServiceOrgBedsInformationService.class,version = "1.0.0")
public class ServiceOrgBedsInformationServiceImpl extends BaseServiceImpl<ServiceOrgBedsInformation> implements ServiceOrgBedsInformationService {
    @Autowired
    private ServiceOrgBedsInformationMapper mapper;

    @Override
    public BaseMapper<ServiceOrgBedsInformation> getMapper() {
        return mapper;
    }


    @Override
    public ServiceOrgBedsInformation selectByBedNumberAndRoomId(String bedNumber, Integer roomId) {
        return mapper.selectByBedNumberAndRoomId(bedNumber,roomId);
    }

    @Override
    public List<ServiceOrgBedsInformation> selectByRoomId(Integer roomId) {
        return mapper.selectByRoomId(roomId);
    }

    @Override
    public ServiceOrgBedsInformation selectByBedNumberAndRoomNum(String bedNumber, String roomNum) {
        return mapper.selectByBedNumberAndRoomNum(bedNumber,roomNum);
    }

}
