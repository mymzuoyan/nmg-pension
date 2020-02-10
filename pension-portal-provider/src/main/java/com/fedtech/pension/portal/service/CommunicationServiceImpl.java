package com.fedtech.pension.portal.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.portal.entity.Communication;
import com.fedtech.pension.portal.mapper.CommunicationMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Administrator
 * @date 2016/12/14
 */
@Service(interfaceClass = CommunicationService.class, version = "1.0.0")
public class CommunicationServiceImpl extends BaseServiceImpl<Communication> implements CommunicationService {


    @Autowired
    private CommunicationMapper mapper;

    @Override
    public BaseMapper<Communication> getMapper() {
        return mapper;
    }

    @Override
    public List<Communication> selectTopN(Integer count) {
        return mapper.selectTopN(count);
    }
}

