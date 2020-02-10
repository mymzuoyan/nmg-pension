package com.fedtech.pension.power.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.power.entity.FranSerRecord;
import com.fedtech.pension.power.mapper.FranSerRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;

@Service(interfaceClass = FranSerRecordService.class, version = "1.0.0")
public class FranSerRecordServiceImpl  extends BaseServiceImpl<FranSerRecord> implements FranSerRecordService {

    @Autowired
    private FranSerRecordMapper franSerRecordMapper;

    @Override
    public BaseMapper<FranSerRecord> getMapper() {
        return franSerRecordMapper;
    }
}
