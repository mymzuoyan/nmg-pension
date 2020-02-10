package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.Knowledge;
import com.fedtech.pension.call.mapper.KnowledgeMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author CoderQiang
 * @date 2017/2/24
 */
@Service(interfaceClass = KnowledgeService.class, version = "1.0.0")
public class KnowledgeServiceImpl extends BaseServiceImpl<Knowledge> implements KnowledgeService {

    @Autowired
    private KnowledgeMapper mapper;

    @Override
    public BaseMapper<Knowledge> getMapper() {
        return mapper;
    }
}
