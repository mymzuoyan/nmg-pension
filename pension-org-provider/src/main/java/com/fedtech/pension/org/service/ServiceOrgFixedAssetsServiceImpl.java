package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgFixedAssets;
import com.fedtech.pension.org.mapper.ServiceOrgFixedAssetsMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *  居家固定资产
 * @author miaoyueming
 * @date 2019/10/23
 */
@Service(interfaceClass = ServiceOrgFixedAssetsService.class, version = "1.0.0")
public class ServiceOrgFixedAssetsServiceImpl extends BaseServiceImpl<ServiceOrgFixedAssets> implements ServiceOrgFixedAssetsService {

    @Autowired
    private ServiceOrgFixedAssetsMapper serviceOrgFixedAssetsMapper;


    @Override
    public BaseMapper<ServiceOrgFixedAssets> getMapper() {
        return serviceOrgFixedAssetsMapper;
    }
}


