package com.fedtech.pension.org.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fedtech.commons.base.BaseMapper;
import com.fedtech.commons.base.BaseServiceImpl;
import com.fedtech.pension.org.entity.CheckName;
import com.fedtech.pension.org.mapper.CheckNameMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author csn
 * @date 2018/2/9
 */
@Service(interfaceClass = CheckNameService.class,version = "1.0.0")
public class CheckNameServiceImpl extends BaseServiceImpl<CheckName> implements CheckNameService{

    @Autowired
    private CheckNameMapper checkNameMapper;

    @Override
    public BaseMapper<CheckName> getMapper() {
        return checkNameMapper;
    }
}
