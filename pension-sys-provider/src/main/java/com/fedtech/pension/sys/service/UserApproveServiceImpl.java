package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.sys.entity.UserApprove;
import com.fedtech.pension.sys.mapper.UserApproveMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhnn on 2017/2/27.
 */
@Service(version = "1.0.0", interfaceClass = UserApproveService.class)
public class UserApproveServiceImpl extends BaseServiceImpl<UserApprove> implements UserApproveService {

    @Autowired
    private UserApproveMapper userApproveMapper;

    @Override
    public BaseMapper<UserApprove> getMapper() {
        return userApproveMapper;
    }
}
