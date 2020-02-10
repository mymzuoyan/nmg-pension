package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.CallHandle;
import com.fedtech.pension.call.mapper.CallHandleMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author CodingQiang
 * @date 2016/10/17
 */
@Service(interfaceClass = CallHandleService.class, version = "1.0.0")
public class CallHandleServiceImpl extends BaseServiceImpl<CallHandle> implements CallHandleService {

    @Autowired
    private CallHandleMapper mapper;

    @Override
    public BaseMapper<CallHandle> getMapper() {
        return mapper;
    }
}
