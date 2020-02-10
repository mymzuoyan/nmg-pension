package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.NursingHomeServiceCheck;
import com.fedtech.pension.org.mapper.NursingHomeServiceCheckMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author csn
 * @date 2018/2/7
 */
@Service(interfaceClass = NursingHomeServiceCheckService.class, version = "1.0.0")
public class NursingHomeServiceCheckServiceImpl extends BaseServiceImpl<NursingHomeServiceCheck> implements NursingHomeServiceCheckService{

    @Autowired
    private NursingHomeServiceCheckMapper nursingHomeServiceCheckMapper;

    @Override
    public BaseMapper<NursingHomeServiceCheck> getMapper() {
        return nursingHomeServiceCheckMapper;
    }

    @Override
    public NursingHomeServiceCheck getRecodeDetail(NursingHomeServiceCheck filter) {
        return nursingHomeServiceCheckMapper.getRecodeDetail(filter);
    }
}
