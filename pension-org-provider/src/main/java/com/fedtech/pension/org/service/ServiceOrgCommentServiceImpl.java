package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.ServiceOrgComment;
import com.fedtech.pension.org.mapper.ServiceOrgCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author gengqiang
 * @date 2019/6/26
 */
@Service(interfaceClass = ServiceOrgCommentService.class, version = "1.0.0")
public class ServiceOrgCommentServiceImpl extends BaseServiceImpl<ServiceOrgComment> implements ServiceOrgCommentService {

    @Autowired
    private ServiceOrgCommentMapper mapper;

    @Override
    public BaseMapper<ServiceOrgComment> getMapper() {
        return mapper;
    }
}