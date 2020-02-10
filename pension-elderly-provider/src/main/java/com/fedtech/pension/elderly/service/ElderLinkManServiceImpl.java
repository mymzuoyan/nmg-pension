package com.fedtech.pension.elderly.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.elderly.entity.ElderLinkMan;
import com.fedtech.pension.elderly.mapper.ElderLinkManMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author zhangcz
 */
@org.springframework.stereotype.Service
@Service(interfaceClass = ElderLinkManService.class, version = "1.0.0", timeout = 5000, retries = 0)
public class ElderLinkManServiceImpl extends BaseServiceImpl<ElderLinkMan> implements ElderLinkManService {

    @Autowired
    private ElderLinkManMapper elderLinkManMapper;

    @Override
    public BaseMapper<ElderLinkMan> getMapper() {
        return elderLinkManMapper;
    }

    @Override
    public List<ElderLinkMan> selectByElderId(Integer elderId) {
        return elderLinkManMapper.selectByElderId(elderId);
    }
}
