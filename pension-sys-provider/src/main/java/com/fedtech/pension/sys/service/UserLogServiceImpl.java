package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.UserLog;
import com.fedtech.pension.sys.mapper.UserLogMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by CoderQiang on 2017/1/16.
 */
@Service(version = "1.0.0", interfaceClass = UserLogService.class)
public class UserLogServiceImpl extends BaseServiceImpl<UserLog> implements UserLogService {

    @Autowired
    private UserLogMapper mapper;

    @Override
    public BaseMapper<UserLog> getMapper() {
        return mapper;
    }
}
