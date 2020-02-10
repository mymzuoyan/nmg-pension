package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.AllianceType;
import com.fedtech.pension.power.mapper.AllianceTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


@Service(interfaceClass = AllianceTypeService.class, version = "1.0.0")
public class AllianceTypeServiceImpl extends BaseServiceImpl<AllianceType> implements AllianceTypeService {

    @Autowired
    private AllianceTypeMapper serviceTypeMapper;

    @Override
    public BaseMapper<AllianceType> getMapper() {
        return serviceTypeMapper;
    }


    @Override
    public List<AllianceType> selectIntype(String inClassic) {

        return serviceTypeMapper.selectIntype(inClassic);
    }
}
