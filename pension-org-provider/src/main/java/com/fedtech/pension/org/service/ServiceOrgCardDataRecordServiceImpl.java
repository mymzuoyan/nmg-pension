package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgCardDataRecord;
import com.fedtech.pension.org.mapper.ServiceOrgCardDataRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhnn on 2018/5/2.
 */
@Service(version = "1.0.0", interfaceClass = ServiceOrgCardDataRecordService.class)
public class ServiceOrgCardDataRecordServiceImpl extends BaseServiceImpl<ServiceOrgCardDataRecord> implements ServiceOrgCardDataRecordService {

    @Autowired
    private ServiceOrgCardDataRecordMapper serviceOrgCardDataRecordMapper;

    @Override
    public BaseMapper<ServiceOrgCardDataRecord> getMapper() {
        return serviceOrgCardDataRecordMapper;
    }
}
