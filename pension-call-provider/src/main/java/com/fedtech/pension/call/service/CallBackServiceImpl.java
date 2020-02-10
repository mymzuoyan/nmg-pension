package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.CallBack;
import com.fedtech.pension.call.mapper.CallBackMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author CodingQiang
 * @date 2016/10/19
 */
@Service(interfaceClass = CallBackService.class, version = "1.0.0")
public class CallBackServiceImpl extends BaseServiceImpl<CallBack> implements CallBackService {

    @Autowired
    private CallBackMapper mapper;

    @Override
    public BaseMapper<CallBack> getMapper() {
        return mapper;
    }
}
