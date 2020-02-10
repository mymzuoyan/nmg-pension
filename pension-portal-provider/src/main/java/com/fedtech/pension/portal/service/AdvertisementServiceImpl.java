package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.portal.entity.Advertisement;
import com.fedtech.pension.portal.mapper.AdvertisementMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2016/12/15.
 */
@Service(interfaceClass = AdvertisementService.class, version = "1.0.0")
public class AdvertisementServiceImpl extends BaseServiceImpl<Advertisement> implements AdvertisementService {

    @Autowired
    private AdvertisementMapper mapper;

    @Override
    public BaseMapper<Advertisement> getMapper() {
        return mapper;
    }
}
