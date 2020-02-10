package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.UserFuWuQuit;
import com.fedtech.pension.org.mapper.UserFuWuQuitMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 从业人员离职登记表
 * @author miaoyueming
 * @date 2019/10/12
 */
@Service(interfaceClass = UserFuWuQuitService.class, version = "1.0.0")
public class UserFuWuQuitServiceImpl extends BaseServiceImpl<UserFuWuQuit> implements UserFuWuQuitService {

    @Autowired
    private UserFuWuQuitMapper userFuWuQuitMapper;


    @Override
    public BaseMapper<UserFuWuQuit> getMapper() {
        return userFuWuQuitMapper;
    }
}


