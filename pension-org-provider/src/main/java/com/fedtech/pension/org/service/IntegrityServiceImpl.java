package com.fedtech.pension.org.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.Integrity;
import com.fedtech.pension.org.mapper.IntegrityMapper;
import org.springframework.beans.factory.annotation.Autowired;


@Service(interfaceClass = IntegrityService.class,version = "1.0.0")
public class IntegrityServiceImpl extends BaseServiceImpl<Integrity> implements IntegrityService{
    @Autowired
    private IntegrityMapper mapper;
    @Override
    public BaseMapper<Integrity> getMapper() {
        return mapper;
    }

}
