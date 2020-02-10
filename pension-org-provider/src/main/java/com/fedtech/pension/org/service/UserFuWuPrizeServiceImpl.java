package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.UserFuWuPrize;
import com.fedtech.pension.org.mapper.UserFuWuPrizeMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 获奖信息登记表
 * @author miaoyueming
 * @date 2019/10/12
 */
@Service(interfaceClass = UserFuWuPrizeService.class, version = "1.0.0")
public class UserFuWuPrizeServiceImpl extends BaseServiceImpl<UserFuWuPrize> implements UserFuWuPrizeService {

    @Autowired
    private UserFuWuPrizeMapper userFuWuPrizeMapper;


    @Override
    public BaseMapper<UserFuWuPrize> getMapper() {
        return userFuWuPrizeMapper;
    }
}


