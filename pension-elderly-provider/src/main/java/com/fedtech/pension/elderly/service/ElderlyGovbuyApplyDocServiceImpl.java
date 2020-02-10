package com.fedtech.pension.elderly.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.ElderlyGovbuyApplyDoc;
import com.fedtech.pension.elderly.mapper.ElderlyGovbuyApplyDocMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2017/7/26
 */
@Service(interfaceClass = ElderlyGovbuyApplyDocService.class,version = "1.0.0",timeout = 5000, retries = 0)
public class ElderlyGovbuyApplyDocServiceImpl extends BaseServiceImpl<ElderlyGovbuyApplyDoc> implements ElderlyGovbuyApplyDocService {
    @Autowired
    private ElderlyGovbuyApplyDocMapper mapper;

    @Override
    public BaseMapper<ElderlyGovbuyApplyDoc> getMapper() {
        return mapper;
    }
}
