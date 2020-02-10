package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgElderlyNeeds;
import com.fedtech.pension.org.entity.SojournManage;
import com.fedtech.pension.org.mapper.ServiceOrgElderlyNeedsMapper;
import com.fedtech.pension.org.mapper.SojournManageMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  旅居老人需求管理
 * @author miaoyueming
 * @date 2019/9/24
 */
@Service(interfaceClass = ServiceOrgElderlyNeedsService.class, version = "1.0.0")
public class ServiceOrgElderlyNeedsServiceImpl extends BaseServiceImpl<ServiceOrgElderlyNeeds> implements ServiceOrgElderlyNeedsService {

    @Autowired
    private ServiceOrgElderlyNeedsMapper serviceOrgElderlyNeedsMapper;


    @Override
    public BaseMapper<ServiceOrgElderlyNeeds> getMapper() {
        return serviceOrgElderlyNeedsMapper;
    }
}


