package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.CommunityPensionStars;
import com.fedtech.pension.org.entity.HealthRecords;
import com.fedtech.pension.org.mapper.CommunityPensionStarsMapper;
import com.fedtech.pension.org.mapper.HealthRecordsMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author guxiangyang
 * @date 2019/9/17
 */
@Service(interfaceClass = HealthRecordsService.class,version = "1.0.0")
public class HealthRecordsServiceImpl extends BaseServiceImpl<HealthRecords> implements HealthRecordsService {

    @Autowired
    private HealthRecordsMapper healthRecordsMapper;
    @Override
    public BaseMapper<HealthRecords> getMapper() {
        return healthRecordsMapper;
    }

}
