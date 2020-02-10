package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.portal.entity.Module;
import com.fedtech.pension.portal.mapper.ModuleMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2016/10/12.
 */
@Service(interfaceClass = ModuleService.class, version = "1.0.0")
public class ModuleServiceImpl extends BaseServiceImpl<Module> implements ModuleService {

    @Autowired
    private ModuleMapper moduleMapper;

    @Override
    public BaseMapper<Module> getMapper() {
        return moduleMapper;
    }
}


