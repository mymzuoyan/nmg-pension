package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.NurseElderlyLocation;
import com.fedtech.pension.nurse.mapper.NurseElderlyLocationMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/8/24
 */
@Service(interfaceClass = NurseElderlyLocationService.class, version = "1.0.0")
public class NurseElderlyLocationServiceImpl extends BaseServiceImpl<NurseElderlyLocation> implements NurseElderlyLocationService {


    @Autowired
    private NurseElderlyLocationMapper mapper;

    @Override
    public BaseMapper<NurseElderlyLocation> getMapper() {
        return mapper;
    }
}
