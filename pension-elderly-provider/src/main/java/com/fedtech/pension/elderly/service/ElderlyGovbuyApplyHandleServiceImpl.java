package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApplyHandle;
import com.fedtech.pension.elderly.mapper.ElderlyGovbuyApplyHandleMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by gengqiang on 2017/7/29.
 */
@Service(interfaceClass = ElderlyGovbuyApplyHandleService.class,version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyGovbuyApplyHandleServiceImpl extends BaseServiceImpl<ElderlyGovbuyApplyHandle> implements ElderlyGovbuyApplyHandleService {

    @Autowired
    private ElderlyGovbuyApplyHandleMapper mapper;

    @Override
    public BaseMapper<ElderlyGovbuyApplyHandle> getMapper() {
        return mapper;
    }
}
