package com.fedtech.pension.nurse.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.nurse.entity.NurseElderlySign;
import com.fedtech.pension.nurse.mapper.NurseElderlySignMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/8/24
 */
@Service(interfaceClass = NurseElderlySignService.class, version = "1.0.0")
public class NurseElderlySignServiceImpl extends BaseServiceImpl<NurseElderlySign> implements NurseElderlySignService {

    @Autowired
    private NurseElderlySignMapper mapper;

    @Override
    public BaseMapper<NurseElderlySign> getMapper() {
        return mapper;
    }
}
