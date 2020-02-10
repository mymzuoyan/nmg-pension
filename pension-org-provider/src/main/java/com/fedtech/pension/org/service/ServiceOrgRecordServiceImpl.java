package com.fedtech.pension.org.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.EntrySubsidy;
import com.fedtech.pension.org.entity.ServiceOrgRecord;
import com.fedtech.pension.org.mapper.ServiceOrgRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author miaoyueming
 * @date 2019/8/9
 * 建档内容
 */
@Service(interfaceClass = ServiceOrgRecordService.class,version = "1.0.0")
public class ServiceOrgRecordServiceImpl extends BaseServiceImpl<ServiceOrgRecord> implements ServiceOrgRecordService {

    @Autowired
    private ServiceOrgRecordMapper serviceOrgRecordMapper;

    @Override
    public BaseMapper<ServiceOrgRecord> getMapper() {
        return serviceOrgRecordMapper;
    }

    @Override
    public Integer selectIdByServiceOrgId(Integer serviceOrgId) {
        return serviceOrgRecordMapper.selectIdByServiceOrgId(serviceOrgId);
    }
}
