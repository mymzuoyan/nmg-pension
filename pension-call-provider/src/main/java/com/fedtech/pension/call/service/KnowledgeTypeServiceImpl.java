package com.fedtech.pension.call.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.call.entity.KnowledgeType;
import com.fedtech.pension.call.mapper.KnowledgeTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author CoderQiang
 * @date 2017/2/24
 */
@Service(interfaceClass = KnowledgeTypeService.class, version = "1.0.0")
public class KnowledgeTypeServiceImpl extends BaseServiceImpl<KnowledgeType> implements KnowledgeTypeService {

    @Autowired
    private KnowledgeTypeMapper mapper;

    @Override
    public BaseMapper<KnowledgeType> getMapper() {
        return mapper;
    }
}
