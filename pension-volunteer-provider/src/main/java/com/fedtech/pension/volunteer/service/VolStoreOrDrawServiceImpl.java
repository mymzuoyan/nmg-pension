package com.fedtech.pension.volunteer.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.volunteer.entity.VolStoreOrDraw;
import com.fedtech.pension.volunteer.mapper.VolStoreOrDrawMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Administrator
 * @date 2016/9/28
 */
@Service(interfaceClass = VolStoreOrDrawService.class, version = "1.0.0")
public class VolStoreOrDrawServiceImpl extends BaseServiceImpl<VolStoreOrDraw> implements VolStoreOrDrawService {

    @Autowired
    private VolStoreOrDrawMapper volStoreOrDrawMapper;

    @Override
    public BaseMapper<VolStoreOrDraw> getMapper() {
        return volStoreOrDrawMapper;
    }

}
