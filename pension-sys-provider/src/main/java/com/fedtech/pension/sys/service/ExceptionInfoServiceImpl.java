package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.ExceptionInfo;
import com.fedtech.pension.sys.mapper.ExceptionInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author CoderQiang
 * @date 2017/3/17
 */
@Service(version = "1.0.0", interfaceClass = ExceptionInfoService.class)
public class ExceptionInfoServiceImpl extends BaseServiceImpl<ExceptionInfo> implements ExceptionInfoService {

    @Autowired
    private ExceptionInfoMapper mapper;

    @Override
    public BaseMapper<ExceptionInfo> getMapper() {
        return mapper;
    }
}
