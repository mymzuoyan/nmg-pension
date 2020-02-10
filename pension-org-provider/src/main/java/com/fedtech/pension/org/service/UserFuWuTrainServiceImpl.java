package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.UserFuWuTrain;
import com.fedtech.pension.org.mapper.UserFuWuTrainMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 培训信息登记表
 * @author miaoyueming
 * @date 2019/10/12
 */
@Service(interfaceClass = UserFuWuTrainService.class, version = "1.0.0")
public class UserFuWuTrainServiceImpl extends BaseServiceImpl<UserFuWuTrain> implements UserFuWuTrainService {

    @Autowired
    private UserFuWuTrainMapper userFuWuTrainMapperu;


    @Override
    public BaseMapper<UserFuWuTrain> getMapper() {
        return userFuWuTrainMapperu;
    }
}


