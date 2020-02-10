package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.ServiceType;
import com.fedtech.pension.sys.mapper.ServiceTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author CodingQiang
 * @date 2016/10/27
 */
@Service(interfaceClass = ServiceTypeService.class, version = "1.0.0")
public class ServiceTypeServiceImpl extends BaseServiceImpl<ServiceType> implements ServiceTypeService {

    @Autowired
    private ServiceTypeMapper mapper;

    @Override
    public BaseMapper<ServiceType> getMapper() {
        return mapper;
    }

    @Override
    public List<ServiceType> getTypeByIds(String ids) {
        return mapper.getTypeByIds(ids);
    }
}
